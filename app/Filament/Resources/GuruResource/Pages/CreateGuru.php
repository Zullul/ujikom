<?php

namespace App\Filament\Resources\GuruResource\Pages;

use App\Filament\Resources\GuruResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateGuru extends CreateRecord
{
    protected static string $resource = GuruResource::class;

    // --- TAMBAHKAN METHOD INI ---
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        // Jika pengguna adalah admin sekolah, tambahkan sekolah_id mereka ke data
        if (Auth::user()->isAdminSekolah()) {
            $data['sekolah_id'] = Auth::user()->sekolah_id;
        }

        return $data;
    }
}
