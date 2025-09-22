<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DudiResource\Pages;
use App\Filament\Resources\DudiResource\RelationManagers;
use App\Models\Dudi;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class DudiResource extends Resource
{
    protected static ?string $model = Dudi::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';
    protected static ?string $navigationLabel = 'Data Dudi';
    protected static ?string $pluralModelLabel = 'Data Dudi';
    protected static ?string $modelLabel = 'Data Dudi';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_dudi')
                ->required()
                ->maxLength(45),
                Forms\Components\TextInput::make('bidang_usaha')
                ->required()
                ->maxLength(45),
                Forms\Components\TextInput::make('alamat')
                ->required()
                ->maxLength(100),
                Forms\Components\TextInput::make('pimpinan')
                ->required()
                ->maxLength(45),
                Forms\Components\TextInput::make('instruktur')
                ->required()
                ->maxLength(45),
                Forms\Components\Select::make('sekolah_id')
                ->label('Sekolah')
                ->relationship('sekolah', 'nama_sekolah')
                ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_dudi')
                ->searchable(),
                Tables\Columns\TextColumn::make('bidang_usaha')
                ->searchable(),
                Tables\Columns\TextColumn::make('alamat')
                ->searchable(),
                Tables\Columns\TextColumn::make('pimpinan')
                ->searchable(),
                Tables\Columns\TextColumn::make('instruktur')
                ->searchable(),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                ->label('Sekolah')
                ->searchable(),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListDudis::route('/'),
            'create' => Pages\CreateDudi::route('/create'),
            'edit' => Pages\EditDudi::route('/{record}/edit'),
        ];
    }
}
