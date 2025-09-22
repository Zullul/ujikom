<?php

namespace App\Filament\Resources\PrakerinResource\Pages;

use App\Filament\Resources\PrakerinResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPrakerins extends ListRecords
{
    protected static string $resource = PrakerinResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
