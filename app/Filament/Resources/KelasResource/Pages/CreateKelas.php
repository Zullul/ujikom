<?php

namespace App\Filament\Resources\KelasResource\Pages;

use App\Filament\Resources\KelasResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\support\Facades\Auth;

class CreateKelas extends CreateRecord
{
    protected static string $resource = KelasResource::class;

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
