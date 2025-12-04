<?php

namespace App\Filament\Resources\LaporanMingguanResource\Pages;

use App\Filament\Resources\LaporanMingguanResource;
use Filament\Resources\Pages\ViewRecord;
use Illuminate\Support\Facades\Auth;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\IconEntry;
use Filament\Infolists\Components\ImageEntry;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Grid;
use Filament\Infolists\Components\Actions\Action;
use Filament\Infolists\Components\Actions;
use Carbon\Carbon;
use Illuminate\Support\HtmlString;

class ViewLaporanMingguan extends ViewRecord
{
    protected static string $resource = LaporanMingguanResource::class;

    protected function mutateFormDataBeforeFill(array $data): array
    {
        // Eager load absensis untuk performa
        $this->record->load('absensis');
        
        return $data;
    }

    public function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                Section::make('Informasi Umum')
                    ->schema([
                        TextEntry::make('minggu_ke')
                            ->label('Minggu Ke-'),
                        TextEntry::make('tanggal_mulai_minggu')
                            ->label('Periode Minggu')
                            ->formatStateUsing(function ($record) {
                                $mulai = Carbon::parse($record->tanggal_mulai_minggu)->translatedFormat('d M Y');
                                $selesai = Carbon::parse($record->tanggal_selesai_minggu)->translatedFormat('d M Y');
                                return "{$mulai} - {$selesai}";
                            }),
                    ])->columns(2),

                Section::make('Refleksi Pembimbing')
                    ->schema([
                        TextEntry::make('laporan_guru')
                            ->label('Refleksi Guru Pembimbing')
                            ->html()
                            ->placeholder('Belum ada refleksi dari Guru.')
                            ->columnSpanFull(),
                        IconEntry::make('verifikasi_guru')
                             ->label('Status Verifikasi Guru')
                             ->boolean(),
                        TextEntry::make('laporan_dudi')
                            ->label('Refleksi Pembimbing DUDI')
                            ->html()
                            ->placeholder('Belum ada refleksi dari DUDI.')
                            ->columnSpanFull(),
                         IconEntry::make('verifikasi_dudi')
                             ->label('Status Verifikasi DUDI')
                             ->boolean(),
                    ])->columns(1),

                Section::make('Dokumentasi Absensi Minggu Ini')
                    ->description('Klik ikon foto untuk melihat dokumentasi absensi')
                    ->schema([
                        RepeatableEntry::make('absensis')
                            ->label('')
                            ->schema([
                                Grid::make(6)
                                    ->schema([
                                        TextEntry::make('tanggal')
                                            ->label('Tanggal')
                                            ->date('d M Y')
                                            ->badge()
                                            ->color('primary')
                                            ->weight('bold'),
                                        TextEntry::make('status_kehadiran')
                                            ->label('Status')
                                            ->badge()
                                            ->color(fn (string $state): string => match ($state) {
                                                'hadir' => 'success',
                                                'izin' => 'warning',
                                                'sakit' => 'danger',
                                                'alpha' => 'secondary',
                                            }),
                                        TextEntry::make('jam_masuk')
                                            ->label('Jam Masuk')
                                            ->time('H:i')
                                            ->badge()
                                            ->color('info')
                                            ->visible(fn ($record) => $record->status_kehadiran === 'hadir'),
                                        TextEntry::make('jam_pulang')
                                            ->label('Jam Pulang')
                                            ->time('H:i')
                                            ->badge()
                                            ->color('warning')
                                            ->visible(fn ($record) => $record->status_kehadiran === 'hadir'),
                                        TextEntry::make('foto_masuk')
                                            ->label('Foto')
                                            ->formatStateUsing(function ($record) {
                                                $photos = [];
                                                
                                                if ($record->status_kehadiran === 'hadir') {
                                                    if (!empty($record->foto_masuk)) {
                                                        $photos[] = '<a href="' . asset('storage/' . $record->foto_masuk) . '" target="_blank" 
                                                            style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; 
                                                                   background-color: #2563eb; color: white; border-radius: 6px; 
                                                                   text-decoration: none; box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                                                                   transition: all 0.2s ease; margin-right: 8px; font-size: 0.75rem; font-weight: 500;"
                                                            onmouseover="this.style.backgroundColor=\'#1d4ed8\'; this.style.transform=\'translateY(-2px)\'; this.style.boxShadow=\'0 4px 6px rgba(0,0,0,0.15)\'"
                                                            onmouseout="this.style.backgroundColor=\'#2563eb\'; this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'0 2px 4px rgba(0,0,0,0.1)\'"
                                                            title="Klik untuk melihat foto masuk">
                                                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                                                <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
                                                            </svg>
                                                            <span>Foto Masuk</span>
                                                        </a>';
                                                    }
                                                    
                                                    if (!empty($record->foto_pulang)) {
                                                        $photos[] = '<a href="' . asset('storage/' . $record->foto_pulang) . '" target="_blank" 
                                                            style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; 
                                                                   background-color: #ea580c; color: white; border-radius: 6px; 
                                                                   text-decoration: none; box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                                                                   transition: all 0.2s ease; margin-right: 8px; font-size: 0.75rem; font-weight: 500;"
                                                            onmouseover="this.style.backgroundColor=\'#c2410c\'; this.style.transform=\'translateY(-2px)\'; this.style.boxShadow=\'0 4px 6px rgba(0,0,0,0.15)\'"
                                                            onmouseout="this.style.backgroundColor=\'#ea580c\'; this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'0 2px 4px rgba(0,0,0,0.1)\'"
                                                            title="Klik untuk melihat foto pulang">
                                                            <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                                                <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
                                                            </svg>
                                                            <span>Foto Pulang</span>
                                                        </a>';
                                                    }
                                                }
                                                
                                                if (in_array($record->status_kehadiran, ['izin', 'sakit']) && !empty($record->foto_izin_sakit)) {
                                                    $photos[] = '<a href="' . asset('storage/' . $record->foto_izin_sakit) . '" target="_blank" 
                                                        style="display: inline-flex; align-items: center; gap: 6px; padding: 6px 12px; 
                                                               background-color: #ca8a04; color: white; border-radius: 6px; 
                                                               text-decoration: none; box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                                                               transition: all 0.2s ease; margin-right: 8px; font-size: 0.75rem; font-weight: 500;"
                                                        onmouseover="this.style.backgroundColor=\'#a16207\'; this.style.transform=\'translateY(-2px)\'; this.style.boxShadow=\'0 4px 6px rgba(0,0,0,0.15)\'"
                                                        onmouseout="this.style.backgroundColor=\'#ca8a04\'; this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'0 2px 4px rgba(0,0,0,0.1)\'"
                                                        title="Klik untuk melihat foto pendukung">
                                                        <svg width="16" height="16" fill="currentColor" viewBox="0 0 20 20">
                                                            <path fill-rule="evenodd" d="M4 3a2 2 0 00-2 2v10a2 2 0 002 2h12a2 2 0 002-2V5a2 2 0 00-2-2H4zm12 12H4l4-8 3 6 2-4 3 6z" clip-rule="evenodd"></path>
                                                        </svg>
                                                        <span>Foto Bukti</span>
                                                    </a>';
                                                }
                                                
                                                return !empty($photos) ? '<div style="display: flex; flex-wrap: wrap; gap: 8px; align-items: center;">' . implode('', $photos) . '</div>' : '<span style="color: #9ca3af; font-size: 0.75rem; font-style: italic;">Tidak ada foto</span>';
                                            })
                                            ->html()
                                            ->columnSpan(2),
                                    ]),
                                TextEntry::make('keterangan')
                                    ->label('Keterangan')
                                    ->columnSpanFull()
                                    ->placeholder('-')
                                    ->visible(fn ($record) => !empty($record->keterangan)),
                            ])
                            ->contained(false)
                            ->columnSpanFull(),
                    ])
                    ->collapsed()
                    ->collapsible(),
            ]);
    }
}