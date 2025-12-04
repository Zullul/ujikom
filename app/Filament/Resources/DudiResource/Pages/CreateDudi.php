<?php

namespace App\Filament\Resources\DudiResource\Pages;

use App\Filament\Resources\DudiResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateDudi extends CreateRecord
{
    protected static string $resource = DudiResource::class;

    // --- TAMBAHKAN METHOD INI ---
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();

        // Ambil sekolah_id dari user yang login
        $data['sekolah_id'] = $user->sekolah_id;

        // Ambil tahun_ajaran_id dari sesi yang sudah dipilih
        if (session()->has('selected_tahun_ajaran_id')) {
            $data['tahun_ajaran_id'] = session('selected_tahun_ajaran_id');
        }

        return $data;
    }
}