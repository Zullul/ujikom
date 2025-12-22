<?php

namespace App\Filament\Widgets;

use App\Models\Absensi;
use App\Models\Dudi;
use App\Models\DudiPembimbing;
use App\Models\Guru;
use App\Models\PrakerinSiswa;
use App\Models\Sekolah;
use App\Models\Siswa;
use App\Models\User;
use Carbon\Carbon;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Card;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

class RoleBasedOverview extends BaseWidget
{
    protected function getCards(): array
    {
        /** @var User $user */
        $user = Auth::user();

        if (!$user) {
            return [];
        }

        if ($user->isSuperAdmin()) {
            return $this->superAdminCards();
        }

        if ($user->isAdminSekolah()) {
            return $this->adminSekolahCards($user);
        }

        if ($user->isGuruPembimbing()) {
            return $this->guruPembimbingCards($user);
        }

        if ($user->isDudiPembimbing()) {
            return $this->dudiPembimbingCards($user);
        }

        if ($user->isSiswa()) {
            return $this->siswaCards($user);
        }

        if ($user->isOrangtua()) {
            return $this->orangtuaCards($user);
        }

        return [];
    }

    protected function superAdminCards(): array
    {
        // Cache global counts untuk menghindari hit database berulang
        [$totalSekolah, $totalSiswa, $totalGuru, $totalDudi] = Cache::remember('rb_overview_super_admin_counts', 60, function () {
            return [
                Sekolah::count(),
                Siswa::count(),
                Guru::count(),
                Dudi::count(),
            ];
        });

        return [
            Card::make('Sekolah', (string) $totalSekolah)->description('Terdaftar')->color('success'),
            Card::make('Siswa', (string) $totalSiswa)->description('Total')->color('primary'),
            Card::make('Guru', (string) $totalGuru)->description('Total')->color('primary'),
            Card::make('DUDI', (string) $totalDudi)->description('Total')->color('primary'),
        ];
    }

    protected function adminSekolahCards(User $user): array
    {
        $sid = $user->sekolah_id;

        // Cache per sekolah untuk 60 detik
        [$totalSiswa, $totalGuru, $totalDudi] = Cache::remember("rb_overview_admin_counts_{$sid}", 60, function () use ($sid) {
            return [
                Siswa::where('sekolah_id', $sid)->count(),
                Guru::where('sekolah_id', $sid)->count(),
                Dudi::where('sekolah_id', $sid)->count(),
            ];
        });

        // Hindari whereDate agar index tanggal bisa dipakai
        $start = Carbon::today()->startOfDay();
        $end = Carbon::today()->endOfDay();
        $absensiHariIni = Cache::remember("rb_overview_admin_absensi_today_{$sid}", 30, function () use ($sid, $start, $end) {
            return Absensi::whereBetween('tanggal', [$start, $end])
                ->whereHas('siswa', fn($q) => $q->where('sekolah_id', $sid))
                ->count();
        });

        return [
            Card::make('Siswa', (string) $totalSiswa)->description('Di sekolah Anda')->color('primary'),
            Card::make('Guru', (string) $totalGuru)->description('Di sekolah Anda')->color('primary'),
            Card::make('DUDI', (string) $totalDudi)->description('Mitra')->color('primary'),
            Card::make('Absensi Hari Ini', (string) $absensiHariIni)->description('Tercatat')->color('success'),
        ];
    }

    protected function guruPembimbingCards(User $user): array
    {
        // ref_id menunjuk ke id guru
        $gid = $user->ref_id;

        $totalBimbingan = Cache::remember("rb_overview_guru_bimbingan_{$gid}", 60, function () use ($gid) {
            return PrakerinSiswa::where('guru_pembimbing_id', $gid)->count();
        });

        $start = Carbon::today()->startOfDay();
        $end = Carbon::today()->endOfDay();
        $absensiHariIni = Cache::remember("rb_overview_guru_absensi_today_{$gid}", 30, function () use ($gid, $start, $end) {
            return Absensi::whereBetween('tanggal', [$start, $end])
                ->whereHas('prakerinSiswa', fn($q) => $q->where('guru_pembimbing_id', $gid))
                ->count();
        });

        $belumVerifikasi = Cache::remember("rb_overview_guru_belum_verif_{$gid}", 30, function () use ($gid) {
            return Absensi::whereHas('prakerinSiswa', fn($q) => $q->where('guru_pembimbing_id', $gid))
                ->whereNull('diverifikasi_pembimbing_dudi')
                ->count();
        });

        return [
            Card::make('Siswa Bimbingan', (string) $totalBimbingan)->description('Total aktif')->color('primary'),
            Card::make('Absensi Hari Ini', (string) $absensiHariIni)->description('Semua bimbingan')->color('success'),
            Card::make('Perlu Verifikasi', (string) $belumVerifikasi)->description('Absensi/Jurnal')->color('warning'),
        ];
    }

    protected function dudiPembimbingCards(User $user): array
    {
        // ref_id menunjuk ke id dudi_pembimbing
        $dpid = $user->ref_id;

        $totalAnak = Cache::remember("rb_overview_dudi_anak_{$dpid}", 60, function () use ($dpid) {
            return PrakerinSiswa::where('dudi_pembimbing_id', $dpid)->count();
        });

        $start = Carbon::today()->startOfDay();
        $end = Carbon::today()->endOfDay();
        $absensiHariIni = Cache::remember("rb_overview_dudi_absensi_today_{$dpid}", 30, function () use ($dpid, $start, $end) {
            return Absensi::whereBetween('tanggal', [$start, $end])
                ->whereHas('prakerinSiswa', fn($q) => $q->where('dudi_pembimbing_id', $dpid))
                ->count();
        });

        $belumVerifikasi = Cache::remember("rb_overview_dudi_belum_verif_{$dpid}", 30, function () use ($dpid) {
            return Absensi::whereHas('prakerinSiswa', fn($q) => $q->where('dudi_pembimbing_id', $dpid))
                ->where(function($q){
                    $q->whereNull('diverifikasi_pembimbing_dudi')->orWhere('diverifikasi_pembimbing_dudi', false);
                })
                ->count();
        });

        return [
            Card::make('Siswa PKL', (string) $totalAnak)->description('Di bawah bimbingan')->color('primary'),
            Card::make('Absensi Hari Ini', (string) $absensiHariIni)->description('Semua siswa')->color('success'),
            Card::make('Butuh Validasi', (string) $belumVerifikasi)->description('Absensi/Jurnal')->color('warning'),
        ];
    }

    protected function siswaCards(User $user): array
    {
        // ref_id menunjuk ke id siswa
        $sid = $user->ref_id;
        $start = Carbon::today()->startOfDay();
        $end = Carbon::today()->endOfDay();

        $absensi = Absensi::where('siswa_id', $sid)
            ->whereBetween('tanggal', [$start, $end])
            ->first();

        $status = $absensi->status_kehadiran ?? 'Belum Absen';
        $jamMasuk = $absensi?->jam_masuk ? Carbon::parse($absensi->jam_masuk)->format('H:i') : '-';
        $jamPulang = $absensi?->jam_pulang ? Carbon::parse($absensi->jam_pulang)->format('H:i') : '-';

        return [
            Card::make('Status Hari Ini', (string) $status)->description('Absensi')->color($status === 'Hadir' ? 'success' : 'warning'),
            Card::make('Jam Masuk', (string) $jamMasuk)->description('Hari ini')->color('primary'),
            Card::make('Jam Pulang', (string) $jamPulang)->description('Hari ini')->color('primary'),
        ];
    }

    protected function orangtuaCards(User $user): array
    {
        // ref_id menunjuk ke id siswa (anaknya)
        $anak = Siswa::find($user->ref_id);

        if (!$anak) {
            return [Card::make('Informasi', 'Data anak tidak ditemukan')->description('Error')->color('danger')];
        }

        // Hitung total refleksi yang sudah diisi (cache pendek)
        $totalRefleksi = Cache::remember("rb_overview_ortu_total_ref_{$anak->id}", 60, function () use ($anak) {
            return \App\Models\LaporanMingguan::where('siswa_id', $anak->id)->count();
        });

        // Cek refleksi minggu ini
        $mingguan = Cache::remember("rb_overview_ortu_ref_minggu_ini_{$anak->id}", 30, function () use ($anak) {
            return \App\Models\LaporanMingguan::where('siswa_id', $anak->id)
                ->where('minggu_ke', $this->getWeekNumber())
                ->first();
        });

        $statusRefleksi = $mingguan ? 'Sudah Diisi' : 'Belum Diisi';

        return [
            Card::make('Nama Anak', (string) $anak->nama_siswa)->description('Data siswa')->color('primary'),
            Card::make('NIS Anak', (string) $anak->nis)->description('Nomor identitas')->color('primary'),
            Card::make('Total Refleksi', (string) $totalRefleksi)->description('Sudah diisi')->color('success'),
            Card::make('Minggu Ini', (string) $statusRefleksi)->description('Status')->color($mingguan ? 'success' : 'warning'),
        ];
    }

    private function getWeekNumber(): int
    {
        return Carbon::now()->weekOfYear;
    }
}
