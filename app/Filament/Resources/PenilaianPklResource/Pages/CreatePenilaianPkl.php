<?php

namespace App\Filament\Resources\PenilaianPklResource\Pages;

use App\Filament\Resources\PenilaianPklResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreatePenilaianPkl extends CreateRecord
{
    protected static string $resource = PenilaianPklResource::class;

    // --- TAMBAHKAN METHOD INI UNTUK MEMPERBAIKI ERROR CREATE ---
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();
        $data['penilai_role'] = $user->isGuru() ? 'guru' : 'dudi_pembimbing';
        $data['penilai_id'] = $user->id;

        return $data;
    }
}
