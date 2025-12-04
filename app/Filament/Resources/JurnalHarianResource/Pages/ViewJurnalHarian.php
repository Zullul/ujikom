<?php

namespace App\Filament\Resources\JurnalHarianResource\Pages;

use App\Filament\Resources\JurnalHarianResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\ImageEntry;

class ViewJurnalHarian extends ViewRecord
{
    protected static string $resource = JurnalHarianResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // Actions\EditAction::make(),
        ];
    }

    public function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                TextEntry::make('tanggal')->date('l, d F Y'),
                TextEntry::make('siswa.nama_siswa'),
                TextEntry::make('kegiatan')->html()->columnSpanFull(),
                TextEntry::make('catatan_pembimbing_dudi')->visible(fn($record) => !empty($record->catatan_pembimbing_dudi)),
                TextEntry::make('catatan_guru_pembimbing')->visible(fn($record) => !empty($record->catatan_guru_pembimbing)),
            ]);
    }
}
