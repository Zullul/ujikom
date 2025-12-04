<?php

namespace App\Filament\Resources\LaporanMingguanResource\Pages;

use App\Filament\Resources\LaporanMingguanResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder; // <-- Import Builder
use Illuminate\Support\Facades\Auth;   // <-- Import Auth

class ListLaporanMingguans extends ListRecords
{
    protected static string $resource = LaporanMingguanResource::class;

    // Siswa tidak bisa membuat laporan, jadi kita sembunyikan tombol "Create"
    protected function getHeaderActions(): array
    {
        return [];
    }

    // --- INI KUNCINYA: FILTER DATA UNTUK SISWA ---
    protected function getTableQuery(): Builder
    {
        // Ambil query dasar
        $query = parent::getTableQuery();
        $user = Auth::user();

        // Jika yang login adalah siswa, filter berdasarkan ID-nya
        if ($user->role_type === 'siswa') {
            $query->where('siswa_id', $user->ref_id);
        }

        return $query;
    }
}
