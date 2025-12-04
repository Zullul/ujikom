<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\User;
use App\Models\PrakerinSiswa; // 1. IMPORT MODEL PrakerinSiswa
use Illuminate\Support\Facades\Auth;

class PilihSiswaRefleksi extends Page
{
    protected static string $view = 'filament.pages.pilih-siswa-refleksi';
    protected static bool $shouldRegisterNavigation = false;

    public $week_number, $start_date, $end_date, $prakerin_id;
    public $students = [];

    public function mount($week_number, $start_date, $end_date): void
    {
        $this->week_number = $week_number;
        $this->start_date = $start_date;
        $this->end_date = $end_date;
        $this->prakerin_id = request()->query('prakerin_id');

        $user = Auth::user();

        if ($user->role_type === 'admin_sekolah') {
            // Admin: Ambil siswa berdasarkan periode prakerin yang dipilih
            $query = PrakerinSiswa::whereHas('prakerin', function ($q) use ($user) {
                $q->where('sekolah_id', $user->sekolah_id);
            })->where('status', 'berjalan');
            
            // Filter berdasarkan prakerin_id jika ada
            if ($this->prakerin_id) {
                $query->where('prakerin_id', $this->prakerin_id);
            }
            
            $siswaIds = $query->pluck('siswa_id');
        } else {
            // Guru/Dudi: Ambil siswa bimbingannya
            $siswaIds = PrakerinSiswa::where('status', 'berjalan')
                ->where(function ($query) use ($user) {
                    $query->where('dudi_pembimbing_id', $user->ref_id)
                          ->orWhere('guru_pembimbing_id', $user->ref_id);
                })
                ->pluck('siswa_id');
        }

        $this->students = User::where('role_type', 'siswa')
            ->whereIn('ref_id', $siswaIds)
            ->orderBy('name')->get();
    }

    public static function getSlug(): string
    {
        return 'refleksi-mingguan/pilih-siswa/{week_number}/{start_date}/{end_date}';
    }

    // Pastikan fungsi ini ada dan benar
    public static function getRouteName(?string $panel = null): string
    {
        // Cukup panggil metode asli dari induknya
        return parent::getRouteName($panel);
    }
}
