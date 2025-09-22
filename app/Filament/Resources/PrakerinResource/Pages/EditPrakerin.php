<?php

namespace App\Filament\Resources\PrakerinResource\Pages;

use App\Filament\Resources\PrakerinResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditPrakerin extends EditRecord
{
    protected static string $resource = PrakerinResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
