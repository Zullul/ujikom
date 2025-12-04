<?php

namespace App\Filament\Resources\AbsensiPembimbingResource\Pages;

use App\Filament\Resources\AbsensiPembimbingResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditAbsensiPembimbing extends EditRecord
{
    protected static string $resource = AbsensiPembimbingResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
