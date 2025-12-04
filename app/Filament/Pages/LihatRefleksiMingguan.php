<?php

namespace App\Filament\Pages;

use App\Models\LaporanMingguan;
use App\Models\PrakerinSiswa;
use Filament\Pages\Page;
use Filament\Tables\Concerns\InteractsWithTable;
use Filament\Tables\Contracts\HasTable;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\ViewColumn;
use Filament\Infolists\Infolist;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\Section;
use Filament\Tables\Actions\ViewAction;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class LihatRefleksiMingguan extends Page implements HasTable
{
    use InteractsWithTable;
    
    protected static string $view = 'filament.pages.lihat-refleksi-mingguan';
    protected static bool $shouldRegisterNavigation = false;
    
    public $week_number;
    public $start_date;
    public $end_date;
    public $prakerin_id;
    
    public function mount(): void
    {
        $user = Auth::user();
        
        if (!$user->isAdminSekolah()) {
            abort(403);
        }
        
        $this->week_number = request()->query('week_number');
        $this->start_date = request()->query('start_date');
        $this->end_date = request()->query('end_date');
        $this->prakerin_id = request()->query('prakerin_id');
    }
    
    public function getHeading(): string
    {
        $start = Carbon::parse($this->start_date);
        $end = Carbon::parse($this->end_date);
        return 'Refleksi Mingguan - Minggu ke-' . $this->week_number . ' (' . $start->translatedFormat('d M') . ' - ' . $end->translatedFormat('d M Y') . ')';
    }
    
    public function table(Table $table): Table
    {
        return $table
            ->query(
                LaporanMingguan::query()
                    ->where('minggu_ke', $this->week_number)
                    ->where('tanggal_mulai_minggu', $this->start_date)
                    ->where('tanggal_selesai_minggu', $this->end_date)
                    ->whereHas('prakerinSiswa', function ($query) {
                        $user = Auth::user();
                        $query->whereHas('siswa', function ($q) use ($user) {
                            $q->where('sekolah_id', $user->sekolah_id);
                        });
                        
                        if ($this->prakerin_id) {
                            $query->where('prakerin_id', $this->prakerin_id);
                        }
                    })
                    ->with(['prakerinSiswa.siswa.kelas', 'prakerinSiswa.guru', 'prakerinSiswa.dudiPembimbing', 'prakerinSiswa.dudi'])
            )
            ->columns([
                TextColumn::make('prakerinSiswa.siswa.nama_siswa')
                    ->label('Nama Siswa')
                    ->searchable()
                    ->sortable(),
                    
                TextColumn::make('prakerinSiswa.siswa.kelas.nama_kelas')
                    ->label('Kelas')
                    ->sortable()
                    ->searchable(),
                    
                TextColumn::make('prakerinSiswa.dudi.nama_dudi')
                    ->label('Tempat Prakerin')
                    ->wrap()
                    ->searchable(),
                
                IconColumn::make('verifikasi_guru')
                    ->label('Verifikasi Guru')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger'),
                    
                TextColumn::make('laporan_guru')
                    ->label('Catatan Guru')
                    ->wrap()
                    ->limit(50)
                    ->default('-'),
                
                IconColumn::make('verifikasi_dudi')
                    ->label('Verifikasi DUDI')
                    ->boolean()
                    ->trueIcon('heroicon-o-check-circle')
                    ->falseIcon('heroicon-o-x-circle')
                    ->trueColor('success')
                    ->falseColor('danger'),
                    
                TextColumn::make('laporan_dudi')
                    ->label('Catatan DUDI')
                    ->wrap()
                    ->limit(50)
                    ->default('-'),
            ])
            ->actions([
                ViewAction::make()
                    ->label('Detail')
                    ->modalHeading(fn ($record) => 'Detail Refleksi - ' . $record->prakerinSiswa->siswa->nama_siswa)
                    ->modalWidth('4xl')
                    ->infolist(fn (Infolist $infolist) => $infolist
                        ->schema([
                            Section::make('Informasi Siswa')
                                ->schema([
                                    TextEntry::make('prakerinSiswa.siswa.nama_siswa')
                                        ->label('Nama Siswa'),
                                    TextEntry::make('prakerinSiswa.siswa.kelas.nama_kelas')
                                        ->label('Kelas'),
                                    TextEntry::make('prakerinSiswa.dudi.nama_dudi')
                                        ->label('Tempat Prakerin'),
                                ])
                                ->columns(3),
                                
                            Section::make('Verifikasi Guru Pembimbing')
                                ->schema([
                                    TextEntry::make('prakerinSiswa.guru.nama_guru')
                                        ->label('Guru Pembimbing'),
                                    TextEntry::make('verifikasi_guru')
                                        ->label('Status')
                                        ->badge()
                                        ->color(fn ($state) => $state ? 'success' : 'danger')
                                        ->formatStateUsing(fn ($state) => $state ? 'Terverifikasi' : 'Belum Verifikasi'),
                                    TextEntry::make('catatan_guru')
                                        ->label('Catatan')
                                        ->default('-')
                                        ->columnSpanFull(),
                                ])
                                ->columns(2),
                                
                            Section::make('Verifikasi Pembimbing DUDI')
                                ->schema([
                                    TextEntry::make('prakerinSiswa.dudiPembimbing.nama_pembimbing')
                                        ->label('Pembimbing DUDI'),
                                    TextEntry::make('verifikasi_dudi')
                                        ->label('Status')
                                        ->badge()
                                        ->color(fn ($state) => $state ? 'success' : 'danger')
                                        ->formatStateUsing(fn ($state) => $state ? 'Terverifikasi' : 'Belum Verifikasi'),
                                    TextEntry::make('catatan_dudi')
                                        ->label('Catatan')
                                        ->default('-')
                                        ->columnSpanFull(),
                                ])
                                ->columns(2),
                        ])
                    ),
            ])
            ->defaultSort('prakerinSiswa.siswa.nama_siswa', 'asc');
    }
}
