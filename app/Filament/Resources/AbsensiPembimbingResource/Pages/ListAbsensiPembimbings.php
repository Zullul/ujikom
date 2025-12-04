<?php

namespace App\Filament\Resources\AbsensiPembimbingResource\Pages;

use App\Filament\Resources\AbsensiPembimbingResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAbsensiPembimbings extends ListRecords
{
    protected static string $resource = AbsensiPembimbingResource::class;

    // Kosongkan header actions karena aksi ada di baris tabel
    protected function getHeaderActions(): array
    {
        return [];
    }
}