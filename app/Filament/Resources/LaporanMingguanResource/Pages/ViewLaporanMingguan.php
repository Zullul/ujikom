<?php

namespace App\Filament\Resources\LaporanMingguanResource\Pages;

use App\Filament\Resources\LaporanMingguanResource;
use Filament\Resources\Pages\ViewRecord;
use Illuminate\Support\Facades\Auth;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\Section;
use Filament\Infolists\Components\IconEntry;
use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\Grid;
use Filament\Infolists\Components\Actions;
use Filament\Infolists\Components\Actions\Action;
use Carbon\Carbon;
use Illuminate\Support\Facades\Storage;
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
                                        
                                        // --- BAGIAN BUTTON MODAL POP-UP ---
                                        Actions::make([
                                            // Action Foto Masuk
                                            Action::make('lihat_foto_masuk')
                                                ->label('Foto Masuk')
                                                ->icon('heroicon-o-camera')
                                                ->color('info')
                                                ->visible(fn ($record) => $record->status_kehadiran === 'hadir' && !empty($record->foto_masuk))
                                                ->modalHeading('Dokumentasi Foto Masuk')
                                                ->modalContent(fn ($record) => new HtmlString('
                                                    <div style="display: flex; justify-content: center; align-items: center; background-color: #f3f4f6; padding: 10px; border-radius: 8px;">
                                                        <img 
                                                            src="'.Storage::url($record->foto_masuk).'" 
                                                            alt="Foto Masuk" 
                                                            style="max-width: 100%; max-height: 80vh; object-fit: contain; border-radius: 4px;"
                                                        >
                                                    </div>
                                                '))
                                                ->modalSubmitAction(false)
                                                ->modalCancelAction(false)
                                                ->closeModalByClickingAway(true),

                                            // Action Foto Pulang
                                            Action::make('lihat_foto_pulang')
                                                ->label('Foto Pulang')
                                                ->icon('heroicon-o-camera')
                                                ->color('warning')
                                                ->visible(fn ($record) => $record->status_kehadiran === 'hadir' && !empty($record->foto_pulang))
                                                ->modalHeading('Dokumentasi Foto Pulang')
                                                ->modalContent(fn ($record) => new HtmlString('
                                                    <div style="display: flex; justify-content: center; align-items: center; background-color: #f3f4f6; padding: 10px; border-radius: 8px;">
                                                        <img 
                                                            src="'.Storage::url($record->foto_pulang).'" 
                                                            alt="Foto Pulang" 
                                                            style="max-width: 100%; max-height: 80vh; object-fit: contain; border-radius: 4px;"
                                                        >
                                                    </div>
                                                '))
                                                ->modalSubmitAction(false)
                                                ->modalCancelAction(false)
                                                ->closeModalByClickingAway(true),

                                            // Action Foto Bukti (Izin/Sakit)
                                            Action::make('lihat_foto_bukti')
                                                ->label('Foto Bukti')
                                                ->icon('heroicon-o-document-text')
                                                ->color('danger')
                                                ->visible(fn ($record) => in_array($record->status_kehadiran, ['izin', 'sakit']) && !empty($record->foto_izin_sakit))
                                                ->modalHeading('Bukti Izin/Sakit')
                                                ->modalContent(fn ($record) => new HtmlString('
                                                    <div style="display: flex; justify-content: center; align-items: center; background-color: #f3f4f6; padding: 10px; border-radius: 8px;">
                                                        <img 
                                                            src="'.Storage::url($record->foto_izin_sakit).'" 
                                                            alt="Foto Bukti" 
                                                            style="max-width: 100%; max-height: 80vh; object-fit: contain; border-radius: 4px;"
                                                        >
                                                    </div>
                                                '))
                                                ->modalSubmitAction(false)
                                                ->modalCancelAction(false)
                                                ->closeModalByClickingAway(true),
                                        ])
                                        ->columnSpan(2)
                                        ->alignStart(),
                                        // --- AKHIR BAGIAN BUTTON MODAL ---

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