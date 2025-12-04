<?php

namespace App\Filament\Resources\TahunAjaranResource\Pages;

use App\Filament\Resources\TahunAjaranResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListTahunAjarans extends ListRecords
{
    protected static string $resource = TahunAjaranResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
            // Logika kenaikan kelas yang lama bisa dikembalikan jika diperlukan,
            // atau hapus aksi ini jika Anda ingin melakukannya secara manual.
        ];
    }
}
