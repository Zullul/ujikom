<?php
// app/Filament/Resources/GuruResource.php

namespace App\Filament\Resources;

use App\Filament\Resources\GuruResource\Pages;
use App\Models\Guru;
use App\Models\Sekolah;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class GuruResource extends Resource
{
    protected static ?string $model = Guru::class;
    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Guru';
    protected static ?string $label = 'Guru';

    public static function canViewAny(): bool
    {
        return auth()->user()->can('view_guru');
    }

    public static function canCreate(): bool
    {
        return auth()->user()->can('create_guru');
    }

    public static function canEdit($record): bool
    {
        return auth()->user()->can('edit_guru');
    }

    public static function canDelete($record): bool
    {
        return auth()->user()->can('delete_guru');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return auth()->user()->can('view_guru');
    }

    public static function getEloquentQuery(): Builder
    {
        $query = parent::getEloquentQuery();

        // Jika bukan admin pusat, hanya tampilkan data sekolah sendiri
        if (!auth()->user()->isAdminPusat()) {
            $query->where('sekolah_id', auth()->user()->sekolah_id);
        }

        return $query;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('sekolah_id')
                    ->label('Sekolah')
                    ->options(function () {
                        if (auth()->user()->isAdminPusat()) {
                            return Sekolah::pluck('nama_sekolah', 'id');
                        }
                        return Sekolah::where('id', auth()->user()->sekolah_id)
                            ->pluck('nama_sekolah', 'id');
                    })
                    ->required()
                    ->default(auth()->user()->sekolah_id)
                    ->disabled(!auth()->user()->isAdminPusat()),

                Forms\Components\TextInput::make('nama_guru')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('nip')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->maxLength(255),

                Forms\Components\TextInput::make('kontak')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('jabatan')
                    ->required()
                    ->maxLength(255),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->sortable()
                    ->visible(auth()->user()->isAdminPusat()),

                Tables\Columns\TextColumn::make('nama_guru')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('nip')
                    ->searchable(),

                Tables\Columns\TextColumn::make('kontak'),

                Tables\Columns\TextColumn::make('jabatan'),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('sekolah')
                    ->relationship('sekolah', 'nama_sekolah')
                    ->visible(auth()->user()->isAdminPusat()),
            ])
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
            'index' => Pages\ListGurus::route('/'),
            'create' => Pages\CreateGuru::route('/create'),
            'edit' => Pages\EditGuru::route('/{record}/edit'),
        ];
    }
}
