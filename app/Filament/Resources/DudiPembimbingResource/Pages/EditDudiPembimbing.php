<?php

namespace App\Filament\Resources\DudiPembimbingResource\Pages;

use App\Filament\Resources\DudiPembimbingResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditDudiPembimbing extends EditRecord
{
    protected static string $resource = DudiPembimbingResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
