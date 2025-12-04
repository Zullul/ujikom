<?php

namespace App\Filament\Resources\JurnalHarianResource\Pages;

use App\Filament\Resources\JurnalHarianResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditJurnalHarian extends EditRecord
{
    protected static string $resource = JurnalHarianResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
