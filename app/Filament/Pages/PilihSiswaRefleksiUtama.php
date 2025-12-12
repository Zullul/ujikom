<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\User;
use App\Models\PrakerinSiswa;
use Illuminate\Support\Facades\Auth;

class PilihSiswaRefleksiUtama extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-bottom-center-text';
    protected static string $view = 'filament.pages.pilih-siswa-refleksi-utama';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 3;
    protected static ?string $navigationLabel = 'Input Refleksi Mingguan';
    protected static ?string $title = 'Input Refleksi Mingguan';

    public $students = [];

    public static function canAccess(): bool
    {
        $user = Auth::user();
        if (!$user) {
            return false;
        }
        
        \Log::info('PilihSiswaRefleksiUtama canAccess check', [
            'user_id' => $user->id,
            'role_type' => $user->role_type,
            'isGuru' => $user->isGuru(),
            'isDudiPembimbing' => $user->isDudiPembimbing(),
        ]);
        
        return $user->isGuru() || $user->isDudiPembimbing();
    }

    public function mount(): void
    {
        $user = Auth::user();

        // Ambil siswa yang dibimbing oleh guru/dudi pembimbing ini
        $siswaIds = PrakerinSiswa::where('status', 'berjalan')
            ->where(function ($query) use ($user) {
                $query->where('dudi_pembimbing_id', $user->ref_id)
                      ->orWhere('guru_pembimbing_id', $user->ref_id);
            })
            ->pluck('siswa_id');

        $this->students = User::where('role_type', 'siswa')
            ->whereIn('ref_id', $siswaIds)
            ->orderBy('name')
            ->get();
    }

    public static function getSlug(): string
    {
        return 'refleksi-mingguan/pilih-siswa';
    }
}
