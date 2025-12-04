<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KelasResource\Pages;
use App\Models\Kelas;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;

class KelasResource extends Resource
{
    protected static ?string $model = Kelas::class;
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Data Kelas';
    protected static ?string $pluralModelLabel = 'Data Kelas';
    protected static ?string $modelLabel = 'Data Kelas';
    protected static ?string $navigationGroup = 'Manajemen Data';
    protected static ?int $navigationSort = 1;

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

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return $user->isAdminSekolah();
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();
        $user = Auth::user();

        // Admin Sekolah: Hanya lihat data sekolahnya sendiri
        if ($user->isAdminSekolah()) {
            $query->where('sekolah_id', $user->sekolah_id);
        }

        return $query;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_kelas')->required()->maxLength(45),
                Forms\Components\TextInput::make('konsentrasi_keahlian')->required()->maxLength(45),
                // Forms\Components\Select::make('tahun_ajaran_id')
                //     ->relationship('tahunAjaran', 'tahun_ajaran')
                //     ->required(),
                // Forms\Components\Select::make('sekolah_id')
                //     ->relationship('sekolah', 'nama_sekolah')
                //     ->required()
                //     ->default(Auth::user()->sekolah_id)
                //     ->disabled(!Auth::user()->isSuperAdmin()),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_kelas')->searchable(),
                Tables\Columns\TextColumn::make('konsentrasi_keahlian')->searchable(),
                // Tables\Columns\TextColumn::make('tahunAjaran.tahun_ajaran')->label('Tahun Ajaran')->sortable(),
            ])
            // ->filters([
            //     SelectFilter::make('tahunAjaran')
            //         ->relationship('tahunAjaran', 'tahun_ajaran')
            //         ->label('Tahun Ajaran'),
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
            'index' => Pages\ListKelas::route('/'),
            'create' => Pages\CreateKelas::route('/create'),
            'edit' => Pages\EditKelas::route('/{record}/edit'),
        ];
    }
}
