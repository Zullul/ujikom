<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PrakerinResource\Pages;
use App\Models\Prakerin;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Forms\Components\DateTimePicker;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Tables\Columns\TextColumn;

class PrakerinResource extends Resource
{
    protected static ?string $model = Prakerin::class;
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationLabel = 'Data Prakerin';
    protected static ?string $pluralModelLabel = 'Data Prakerin';
    protected static ?string $modelLabel = 'Prakerin';
    protected static ?string $navigationGroup = 'Manajemen Prakerin';

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        // Semua role bisa melihat prakerin, tapi dengan batasan berbeda
        return $user && ($user->isAdmin() || $user->isGuru() || $user->isDudi() || $user->isSiswa());
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                TextInput::make('ketua')
                    ->label('Ketua')
                    ->required()
                    ->maxLength(255),

                TextInput::make('sekretaris')
                    ->label('Sekretaris')
                    ->required()
                    ->maxLength(255),

                DateTimePicker::make('tanggal_mulai')
                    ->label('Tanggal Mulai')
                    ->required()
                    ->native(false),

                DateTimePicker::make('tanggal_selesai')
                    ->label('Tanggal Selesai')
                    ->required()
                    ->native(false)
                    ->after('tanggal_mulai'),

                Textarea::make('keterangan')
                    ->label('Keterangan')
                    ->required()
                    ->rows(3),

                Select::make('sekolah_id')
                    ->label('Sekolah')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->required()
                    ->default(function () {
                        $user = Auth::user();
                        return $user->sekolah_id ?? null;
                    })
                    ->disabled(function () {
                        $user = Auth::user();
                        return !$user->isAdmin(); // Non-admin tidak bisa ubah sekolah
                    }),

                Select::make('tahun_ajaran_id')
                    ->label('Tahun Ajaran')
                    ->relationship('tahunAjaran', 'tahun_ajaran')
                    ->required(),

                TextInput::make('tahun_ajaran')
                    ->label('Tahun Ajaran (Text)')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(function (Builder $query) {
                $user = Auth::user();

                if ($user->isAdmin()) {
                    // Admin bisa lihat semua prakerin
                    return $query;
                }

                if ($user->isGuru() || $user->isSiswa() || $user->isDudi()) {
                    // Filter berdasarkan sekolah user
                    if ($user->sekolah_id) {
                        $query->where('sekolah_id', $user->sekolah_id);
                    }

                    if ($user->isDudi()) {
                        // Dudi hanya bisa lihat prakerin yang ada siswa di tempat mereka
                        return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                            $q->where('dudi_id', $user->ref_id);
                        });
                    }

                    if ($user->isSiswa()) {
                        // Siswa hanya bisa lihat prakerin yang mereka ikuti
                        return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                            $q->where('siswa_id', $user->ref_id);
                        });
                    }

                    return $query;
                }

                return $query->whereRaw('1 = 0');
            })
            ->columns([
                TextColumn::make('ketua')
                    ->label('Ketua')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('sekretaris')
                    ->label('Sekretaris')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('tanggal_mulai')
                    ->label('Tanggal Mulai')
                    ->dateTime('d/m/Y H:i')
                    ->sortable(),

                TextColumn::make('tanggal_selesai')
                    ->label('Tanggal Selesai')
                    ->dateTime('d/m/Y H:i')
                    ->sortable(),

                TextColumn::make('durasi')
                    ->label('Durasi')
                    ->getStateUsing(function (Prakerin $record) {
                        if ($record->tanggal_mulai && $record->tanggal_selesai) {
                            return $record->tanggal_mulai->diffInDays($record->tanggal_selesai) . ' hari';
                        }
                        return '-';
                    }),

                TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->searchable()
                    ->visible(fn() => Auth::user()->isAdmin()),

                TextColumn::make('tahun_ajaran')
                    ->label('Tahun Ajaran')
                    ->searchable(),

                TextColumn::make('prakerinSiswa_count')
                    ->label('Jumlah Siswa')
                    ->counts('prakerinSiswa')
                    ->badge()
                    ->color('info'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('sekolah_id')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->label('Sekolah')
                    ->visible(fn() => Auth::user()->isAdmin()),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make()
                    ->visible(fn() => Auth::user()->isAdmin() || Auth::user()->isGuru()),
                Tables\Actions\DeleteAction::make()
                    ->visible(fn() => Auth::user()->isAdmin()),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->visible(fn() => Auth::user()->isAdmin()),
                ]),
            ])
            ->defaultSort('created_at', 'desc');
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPrakerins::route('/'),
            'create' => Pages\CreatePrakerin::route('/create'),
            'view' => Pages\ViewPrakerin::route('/{record}'),
            'edit' => Pages\EditPrakerin::route('/{record}/edit'),
        ];
    }

    public static function canCreate(): bool
    {
        $user = Auth::user();
        return $user && ($user->isAdmin() || $user->isGuru());
    }
}
