<?php

namespace App\Filament\Resources\JurnalHarianResource\Pages;

use App\Filament\Resources\JurnalHarianResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListJurnalHarians extends ListRecords
{
    protected static string $resource = JurnalHarianResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
