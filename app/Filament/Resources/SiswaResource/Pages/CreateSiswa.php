<?php

namespace App\Filament\Resources\SiswaResource\Pages;

use App\Filament\Resources\SiswaResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateSiswa extends CreateRecord
{
    protected static string $resource = SiswaResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();

        // Ambil sekolah_id dari user yang login
        $data['sekolah_id'] = $user->sekolah_id;

        // Ambil tahun_ajaran_id dari sesi yang sudah dipilih
        if (session()->has('selected_tahun_ajaran_id')) {
            $data['tahun_ajaran_id'] = session('selected_tahun_ajaran_id');
        }

        // Set status aktif untuk siswa baru
        $data['status'] = 'aktif';

        return $data;
    }
}
