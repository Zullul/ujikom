<?php

namespace App\Filament\Resources\TujuanPembelajaranResource\Pages;

use App\Filament\Resources\TujuanPembelajaranResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateTujuanPembelajaran extends CreateRecord
{
    protected static string $resource = TujuanPembelajaranResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
    protected function mutatedFormDataBeforeCreate(array $data): array
    {
        $data['sekolah_id'] = auth()->user()->sekolah_id;
        return $data;
    }
    
}
