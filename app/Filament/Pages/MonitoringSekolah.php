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
        // Ambil data sekolah dengan menghitung relasi 'dudis' dan 'users'
        // Gunakan withoutGlobalScope jika ada scope default yang mungkin mengganggu (misal: TahunAjaranScope)
        // Sesuaikan nama relasi 'dudis' jika berbeda di model Sekolah Anda
        $this->sekolahs = Sekolah::withCount(['dudis', 'users'])->get();
    }
}