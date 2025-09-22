<?php

namespace App\Filament\Resources;

use App\Filament\Resources\DudiPembimbingResource\Pages;
use App\Filament\Resources\DudiPembimbingResource\RelationManagers;
use App\Models\dudi_pembimbing;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Navigation\NavigationManager;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class DudiPembimbingResource extends Resource
{
    protected static ?string $model = dudi_pembimbing::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Data Pembimbing Dudi';
    protected static ?string $pluralModelLabel = 'Data Pembimbing Dudi';
    protected static ?string $modelLabel = 'Data Pembimbing Dudi';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('dudi_id')
                ->label('Dudi')
                ->relationship('dudi', 'nama_dudi')
                ->required(),
                Forms\Components\TextInput::make('nama_pembimbing')
                ->required()
                ->maxLength(45),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('dudi.nama_dudi')
                ->label('Dudi')
                ->searchable(),
                Tables\Columns\TextColumn::make('nama_pembimbing')
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
            'index' => Pages\ListDudiPembimbings::route('/'),
            'create' => Pages\CreateDudiPembimbing::route('/create'),
            'edit' => Pages\EditDudiPembimbing::route('/{record}/edit'),
        ];
    }
}
