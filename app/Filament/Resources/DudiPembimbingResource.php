<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DudiPembimbingResource\Pages;
use App\Models\DudiPembimbing;
use App\Models\PrakerinSiswa;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use App\Models\Scopes\TahunAjaranScope;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;

class DudiPembimbingResource extends Resource
{
    protected static ?string $model = DudiPembimbing::class;
    protected static ?string $navigationIcon = 'heroicon-o-users';
    protected static ?string $navigationLabel = 'Data Pembimbing Dudi';
    protected static ?string $pluralModelLabel = 'Data Pembimbing Dudi';
    protected static ?string $navigationGroup = 'Manajemen Data';
    protected static ?string $modelLabel = 'Pembimbing Dudi';
    protected static ?int $navigationSort = 5;

    // Override getUrl untuk navigation mengarah ke halaman pilih
    public static function getNavigationUrl(): string
    {
        return static::getUrl('index');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        $query = parent::getEloquentQuery();
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');

        // Filter berdasarkan tahun ajaran yang dipilih di session
        if ($selectedTahunAjaranId) {
            $query->where('tahun_ajaran_id', $selectedTahunAjaranId);
        }

        if ($user->isSiswa()) {
            return $query->where('siswa_id', $user->ref_id);
        }
        if ($user->isDudiPembimbing() || $user->isGuru()) {
            $siswaIds = PrakerinSiswa::where($user->isGuru() ? 'guru_pembimbing_id' : 'dudi_pembimbing_id', $user->ref_id)->pluck('siswa_id');
            return $query->whereIn('siswa_id', $siswaIds);
        }
        if ($user->isAdminSekolah()) {
            return $query->whereHas('dudi', fn($q) => $q->where('sekolah_id', $user->sekolah_id));
        }
        return $query;
    } 

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('dudi_id')
                    ->label('Pilih DUDI')
                    ->relationship('dudi', 'nama_dudi', function (Builder $query) {
                        $user = Auth::user();
                        if ($user->isAdminSekolah()) {
                            return $query->where('sekolah_id', $user->sekolah_id);
                        }
                        return $query;
                    })
                    ->searchable()
                    ->required()
                    ->disabled(fn ($livewire) => 
                        $livewire instanceof \Filament\Resources\Pages\CreateRecord && 
                        request()->has('dudi_id')
                    )
                    ->dehydrated(true), // Tetap kirim value meskipun disabled

                // --- TAMBAHKAN FIELD TAHUN AJARAN ---
                // Forms\Components\Select::make('tahun_ajaran_id')
                //     ->relationship('tahunAjaran', 'tahun_ajaran')
                //     ->searchable()
                //     ->preload()
                //     ->required()
                //     ->label('Tahun Ajaran'),

                Forms\Components\TextInput::make('nama_pembimbing')
                    ->required()
                    ->maxLength(45),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_pembimbing')
                    ->label('Nama Pembimbing')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('dudi.nama_dudi')
                    ->label('Nama DUDI')
                    ->searchable()
                    ->sortable(),

                // --- TAMBAHKAN KOLOM TAHUN AJARAN ---
                // Tables\Columns\TextColumn::make('tahunAjaran.tahun_ajaran')
                //     ->label('Tahun Ajaran')
                //     ->sortable(),
            ])
            // --- TAMBAHKAN BAGIAN FILTER ---
            // ->filters([
            //     SelectFilter::make('tahunAjaran')
            //         ->relationship('tahunAjaran', 'tahun_ajaran')
            //         ->label('Tahun Ajaran')
            // ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\PilihDudiPembimbing::route('/'),
            'list-by-dudi' => Pages\ListDudiPembimbingsByDudi::route('/dudi/{dudi_id}/pembimbing'),
            'create' => Pages\CreateDudiPembimbing::route('/create'),
            'edit' => Pages\EditDudiPembimbing::route('/{record}/edit'),
        ];
    }
}
