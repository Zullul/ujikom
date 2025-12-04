<?php

namespace App\Filament\Resources;

use App\Filament\Resources\GuruResource\Pages;
use App\Models\Guru;
use App\Imports\GuruImport;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Tables\Filters\SelectFilter;

class GuruResource extends Resource
{
    protected static ?string $model = Guru::class;
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Data Guru';
    protected static ?string $pluralModelLabel = 'Data Guru';
    protected static ?string $modelLabel = 'Guru';
    protected static ?string $navigationGroup = 'Manajemen Data';
    protected static ?int $navigationSort = 3;

    public static function canViewAny(): bool
    {
        $user = Auth::user();
        return $user->isAdminSekolah();
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();
        $user = Auth::user();

        if ($user->isAdminSekolah()) {
            return $query->where('sekolah_id', $user->sekolah_id);
        }
        return $query;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_guru')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('nip')
                    ->label('NIP')
                    ->required()
                    ->maxLength(255),

                // sekolah_id dan tahun_ajaran_id akan diisi otomatis
            ]);
    }

    public static function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();

        // Ambil sekolah_id dari user yang sedang login
        $data['sekolah_id'] = $user->sekolah_id;

        // Ambil tahun_ajaran_id dari sesi yang telah dipilih
        if (session()->has('selected_tahun_ajaran_id')) {
            $data['tahun_ajaran_id'] = session('selected_tahun_ajaran_id');
        }

        return $data;
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->sortable()
                    ->visible(fn() => !Auth::user()->isAdminSekolah()),
                Tables\Columns\TextColumn::make('nama_guru')->searchable()->sortable(),
                Tables\Columns\TextColumn::make('tahunAjaran.tahun_ajaran')
                    ->label('Tahun Ajaran')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: false),
                Tables\Columns\TextColumn::make('nip')->searchable(),
                Tables\Columns\TextColumn::make('kontak')
                ->toggleable(isToggledHiddenByDefault: false),
                Tables\Columns\TextColumn::make('jabatan')
                ->toggleable(isToggledHiddenByDefault: false),
            ])
            ->filters([
                // SelectFilter::make('tahunAjaran')
                //     ->relationship('tahunAjaran', 'tahun_ajaran')
                //     ->label('Tahun Ajaran')
                //     ->searchable()
                //     ->preload(),
            ])
            ->actions([
                // --- TAMBAHKAN BARIS INI ---
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),

            ])
            ->bulkActions([  
                Tables\Actions\DeleteBulkAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListGurus::route('/'),
            'create' => Pages\CreateGuru::route('/create'),
            'view' => Pages\ViewGuru::route('/{record}/view'),
            'edit' => Pages\EditGuru::route('/{record}/edit'),
        ];
    }
}
