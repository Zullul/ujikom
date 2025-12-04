<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SiswaResource\Pages;
use App\Models\Siswa;
use App\Models\PrakerinSiswa;
use App\Models\Guru;
use App\Imports\SiswaImportCSV;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Notifications\Notification;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;

class SiswaResource extends Resource
{
    protected static ?string $model = Siswa::class;
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationLabel = 'Data Siswa';
    protected static ?string $pluralModelLabel = 'Data Siswa';
    protected static ?string $modelLabel = 'Siswa';
    protected static ?string $navigationGroup = 'Manajemen Data';
    protected static ?int $navigationSort = 2;

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return  $user->isAdminSekolah();
    }

    public static function canViewAny(): bool
    {
        $user = Auth::user();
        return $user->isAdminSekolah();
    }

    public static function canCreate(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function canEdit($record): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function canDelete($record): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();
        $user = Auth::user();

        // if ($user->isAdminSekolah()) {
        //     return $query;
        // }

        if ($user->isAdminSekolah()) {
            return $query->where('sekolah_id', $user->sekolah_id);
        }

        if ($user->isGuruPembimbing()) {
            // Guru hanya bisa lihat siswa yang dibimbingnya
            return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                $q->where('guru_id', $user->ref_id);
            });
        }

        if ($user->isDudiPembimbing()) {
            // Dudi hanya bisa lihat siswa yang prakerin di tempat mereka
            return $query->whereHas('prakerinSiswa', function ($q) use ($user) {
                $q->where('dudi_id', $user->ref_id);
            });
        }

        return $query->whereRaw('1 = 0');
    }

public static function form(Form $form): Form
{
    return $form
        ->schema([
            Forms\Components\TextInput::make('nama_siswa')
                ->required()
                ->maxLength(255),
            Forms\Components\TextInput::make('nis')
                ->label('NIS')
                ->required()
                ->maxLength(255),
            Forms\Components\TextInput::make('tempat_lahir')
                ->required()
                ->maxLength(255),
            Forms\Components\DatePicker::make('tanggal_lahir')
                ->required(),
            Forms\Components\Select::make('kelas_id')
                ->relationship('kelas', 'nama_kelas', fn (Builder $query) => $query->where('sekolah_id', Auth::user()->sekolah_id))
                ->required(),
            // Sekolah ID dan Tahun Ajaran ID akan diisi secara otomatis,
            // jadi kita tidak perlu menampilkannya di form.
            // Data ini akan ditambahkan saat proses penyimpanan.
        ]);
}
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_siswa')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('nis')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('kelas.nama_kelas')->label('Kelas')->searchable()->sortable(),
                // Tables\Columns\TextColumn::make('tahunAjaran.tahun_ajaran')->label('Tahun Ajaran')->sortable(),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')->label('Sekolah')->searchable()->visible(fn() => Auth::user()?->isSuperAdmin()),
            ])
            ->filters([
                SelectFilter::make('kelas')
                ->relationship('kelas', 'nama_kelas', fn (Builder $query) => 
                $query->where('sekolah_id', Auth::user()->sekolah_id))
                ->label('Kelas') 
                ->searchable()
                ->preload(),
                // SelectFilter::make('tahunAjaran')->relationship('tahunAjaran', 'tahun_ajaran')->label('Tahun Ajaran'),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make()->requiresConfirmation(),
            ])
            ->bulkActions([
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSiswas::route('/'),
            'create' => Pages\CreateSiswa::route('/create'),
            'view' => Pages\ViewSiswa::route('/{record}'),
            'edit' => Pages\EditSiswa::route('/{record}/edit'),
        ];
    }
}
