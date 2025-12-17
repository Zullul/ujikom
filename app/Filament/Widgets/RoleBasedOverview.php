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

        return [];
    }

    protected function superAdminCards(): array
    {
        $totalSekolah = Sekolah::count();
        $totalSiswa = Siswa::count();
        $totalGuru = Guru::count();
        $totalDudi = Dudi::count();

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

        $totalSiswa = Siswa::where('sekolah_id', $sid)->count();
        $totalGuru = Guru::where('sekolah_id', $sid)->count();
        $totalDudi = Dudi::where('sekolah_id', $sid)->count();

        $today = Carbon::today();
        $absensiHariIni = Absensi::whereDate('tanggal', $today)
            ->whereHas('siswa', fn($q) => $q->where('sekolah_id', $sid))
            ->count();

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

        $totalBimbingan = PrakerinSiswa::where('guru_pembimbing_id', $gid)->count();

        $today = Carbon::today();
        $absensiHariIni = Absensi::whereDate('tanggal', $today)
            ->whereHas('prakerinSiswa', fn($q) => $q->where('guru_pembimbing_id', $gid))
            ->count();

        $belumVerifikasi = Absensi::whereHas('prakerinSiswa', fn($q) => $q->where('guru_pembimbing_id', $gid))
            ->whereNull('diverifikasi_pembimbing_dudi')
            ->count();

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

        $totalAnak = PrakerinSiswa::where('dudi_pembimbing_id', $dpid)->count();

        $today = Carbon::today();
        $absensiHariIni = Absensi::whereDate('tanggal', $today)
            ->whereHas('prakerinSiswa', fn($q) => $q->where('dudi_pembimbing_id', $dpid))
            ->count();

        $belumVerifikasi = Absensi::whereHas('prakerinSiswa', fn($q) => $q->where('dudi_pembimbing_id', $dpid))
            ->where(function($q){
                $q->whereNull('diverifikasi_pembimbing_dudi')->orWhere('diverifikasi_pembimbing_dudi', false);
            })
            ->count();

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
        $today = Carbon::today();

        $absensi = Absensi::where('siswa_id', $sid)->whereDate('tanggal', $today)->first();

        $status = $absensi->status_kehadiran ?? 'Belum Absen';
        $jamMasuk = $absensi?->jam_masuk ? Carbon::parse($absensi->jam_masuk)->format('H:i') : '-';
        $jamPulang = $absensi?->jam_pulang ? Carbon::parse($absensi->jam_pulang)->format('H:i') : '-';

        return [
            Card::make('Status Hari Ini', (string) $status)->description('Absensi')->color($status === 'Hadir' ? 'success' : 'warning'),
            Card::make('Jam Masuk', (string) $jamMasuk)->description('Hari ini')->color('primary'),
            Card::make('Jam Pulang', (string) $jamPulang)->description('Hari ini')->color('primary'),
        ];
    }
}
