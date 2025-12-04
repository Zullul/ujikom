<?php

namespace App\Filament\Resources\TahunAjaranResource\Pages;

use App\Filament\Resources\TahunAjaranResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateTahunAjaran extends CreateRecord
{
    protected static string $resource = TahunAjaranResource::class;

    /**
     * Metode ini akan berjalan secara otomatis sebelum data dibuat
     * untuk menambahkan sekolah_id.
     */
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        if (Auth::user()->isAdminSekolah()) {
            $data['sekolah_id'] = Auth::user()->sekolah_id;
        }

        return $data;
    }
}
