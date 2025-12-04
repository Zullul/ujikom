<?php

namespace App\Filament\Resources\PenilaianPklResource\Pages;

use App\Filament\Resources\PenilaianPklResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListPenilaianPkls extends ListRecords
{
    protected static string $resource = PenilaianPklResource::class;

    // Tidak ada lagi tombol atau aksi di header, semua aksi ada di baris tabel
    protected function getHeaderActions(): array
    {
        return [];
    }
}
