<?php

namespace App\Filament\Resources\PrakerinResource\Pages;

use App\Filament\Resources\PrakerinResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePrakerin extends CreateRecord
{
    protected static string $resource = PrakerinResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Ambil data sekolah_id dari user yang login
        if (Auth::user()->isAdminSekolah()) {
            $data['sekolah_id'] = Auth::user()->sekolah_id;
        }

        // Ambil tahun_ajaran_id dari sesi yang sudah dipilih
        if (session()->has('selected_tahun_ajaran_id')) {
            $data['tahun_ajaran_id'] = session('selected_tahun_ajaran_id');
        }

        return $data;
    }
}
