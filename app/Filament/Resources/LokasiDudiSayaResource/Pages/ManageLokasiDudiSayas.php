<?php

namespace App\Filament\Resources\LokasiDudiSayaResource\Pages;

use App\Filament\Resources\LokasiDudiSayaResource;
use Filament\Actions;
use Filament\Resources\Pages\ManageRecords;

class ManageLokasiDudiSayas extends ManageRecords
{
    protected static string $resource = LokasiDudiSayaResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
