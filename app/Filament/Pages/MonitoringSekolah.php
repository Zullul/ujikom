<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Illuminate\Support\Facades\Auth;
use App\Models\Sekolah; // Import model Sekolah
use Filament\Pages\Concerns\HasSubNavigation; // Import trait jika diperlukan


class MonitoringSekolah extends Page
{
    // protected static ?string $navigationIcon = 'heroicon-o-building-library';
    protected static string $view = 'filament.pages.monitoring-sekolah';
    protected static ?string $navigationLabel = 'Monitoring Sekolah';
    protected static ?string $title = 'Monitoring Sekolah';
    protected static ?string $navigationGroup = 'Manajemen Data'; // Grup navigasi
    protected static ?int $navigationSort = 3; // Urutan di navigasi

    // Properti untuk menampung data sekolah
    public $sekolahs = [];

    // Hanya Super Admin yang bisa mengakses halaman ini
    public static function canAccess(): bool
    {
        return Auth::user()->isSuperAdmin();
    }

    // Ambil data saat halaman dimuat
    public function mount(): void
    {
        // Ambil parameter pencarian dari query string
        $search = trim((string) request()->query('search', ''));

        // Ambil data sekolah + hitung relasi, lalu terapkan filter pencarian jika ada
        $this->sekolahs = Sekolah::withCount(['dudis', 'users'])
            ->when($search !== '', function ($query) use ($search) {
                $query->where(function ($q) use ($search) {
                    $q->where('nama_sekolah', 'like', "%{$search}%")
                      ->orWhere('alamat_sekolah', 'like', "%{$search}%")
                      ->orWhere('nama_kepala_sekolah', 'like', "%{$search}%");
                });
            })
            ->orderBy('nama_sekolah')
            ->get();
    }
}