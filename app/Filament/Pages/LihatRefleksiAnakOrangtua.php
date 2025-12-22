<?php

namespace App\Filament\Pages;

use App\Models\LaporanMingguan;
use App\Models\Siswa;
use Filament\Pages\Page;
use Illuminate\Support\Facades\Auth;

class LihatRefleksiAnakOrangtua extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static string $view = 'filament.pages.lihat-refleksi-anak-orangtua';
    protected static ?string $navigationLabel = 'Refleksi Anak';
    protected static ?string $title = 'Refleksi Mingguan Anak';
    protected static ?int $navigationSort = 2;

    public ?Siswa $anak = null;
    public $refleksis = [];

    public function mount(): void
    {
        $user = Auth::user();

        // Hanya orangtua yang bisa akses
        if (!$user->isOrangtua()) {
            abort(403, 'Anda tidak memiliki akses ke halaman ini');
        }

        // Ambil data anak
        $this->anak = Siswa::find($user->ref_id);

        if (!$this->anak) {
            abort(404, 'Data anak tidak ditemukan');
        }

        // Ambil semua refleksi anak dengan absensi dan jurnal
        $this->refleksis = LaporanMingguan::where('siswa_id', $this->anak->id)
            ->orderByDesc('minggu_ke')
            ->get()
            ->map(function ($refleksi) {
                // Debug log
                \Log::info('Query absensi orangtua', [
                    'siswa_id' => $this->anak->id,
                    'tanggal_mulai_minggu' => $refleksi->tanggal_mulai_minggu,
                    'tanggal_selesai_minggu' => $refleksi->tanggal_selesai_minggu,
                ]);

                // Ambil absensi untuk periode minggu ini
                $absensi = \App\Models\Absensi::where('siswa_id', $this->anak->id)
                    ->whereBetween('tanggal', [$refleksi->tanggal_mulai_minggu, $refleksi->tanggal_selesai_minggu])
                    ->orderBy('tanggal')
                    ->get()
                    ->map(function ($abs) {
                        return [
                            'tanggal' => $abs->tanggal,
                            'jam_masuk' => $abs->jam_masuk,
                            'jam_pulang' => $abs->jam_pulang,
                            'status_kehadiran' => $abs->status_kehadiran,
                            'keterangan' => $abs->keterangan,
                            'foto_masuk' => $abs->foto_masuk ? \Storage::url($abs->foto_masuk) : null,
                            'foto_pulang' => $abs->foto_pulang ? \Storage::url($abs->foto_pulang) : null,
                        ];
                    });

                \Log::info('Hasil query absensi', [
                    'count' => $absensi->count(),
                    'data' => $absensi->pluck('tanggal')->toArray()
                ]);

                // Ambil jurnal harian untuk periode minggu ini
                $jurnal = \App\Models\JurnalHarian::where('siswa_id', $this->anak->id)
                    ->whereBetween('tanggal', [$refleksi->tanggal_mulai_minggu, $refleksi->tanggal_selesai_minggu])
                    ->orderBy('tanggal')
                    ->get()
                    ->map(function ($jur) {
                        return [
                            'tanggal' => $jur->tanggal,
                            'kegiatan' => $jur->kegiatan,
                            'catatan_guru' => $jur->catatan_guru_pembimbing ?? null,
                            'catatan_dudi' => $jur->catatan_pembimbing_dudi ?? null,
                            'foto_kegiatan' => $jur->foto_kegiatan ? \Storage::url($jur->foto_kegiatan) : null,
                        ];
                    });

                return [
                    'id' => $refleksi->id,
                    'minggu_ke' => $refleksi->minggu_ke,
                    'tanggal_mulai' => $refleksi->tanggal_mulai_minggu,
                    'tanggal_akhir' => $refleksi->tanggal_selesai_minggu,
                    'isi_refleksi' => $refleksi->isi_refleksi,
                    'status_verifikasi' => $refleksi->status_verifikasi ?? 'Menunggu',
                    'created_at' => $refleksi->created_at,
                    'absensi' => $absensi,
                    'jurnal' => $jurnal,
                ];
            });
    }

    public static function canAccess(): bool
    {
        $user = Auth::user();
        return $user && $user->isOrangtua();
    }
}
