<?php

namespace App\Filament\Resources;

use App\Filament\Resources\KelasResource\Pages;
use App\Filament\Resources\KelasResource\RelationManagers;
use App\Models\Kelas;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class KelasResource extends Resource
{
    protected static ?string $model = Kelas::class;

    protected static ?string $navigationIcon = 'heroicon-o-user-group';
    protected static ?string $navigationLabel = 'Data Kelas';
    protected static ?string $pluralModelLabel = 'Data Kelas';
    protected static ?string $modelLabel = 'Data Kelas';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
            Forms\Components\Select::make('sekolah_id')
                ->label('Sekolah')
                ->relationship('sekolah', 'nama_sekolah')
                ->required(),
            Forms\Components\TextInput::make('nama_kelas')
                ->required()
                ->maxLength(45),
            Forms\Components\TextInput::make('konsentrasi_keahlian')
                ->required()
                ->maxLength(45),
        ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                ->label('Sekolah')
                ->searchable(),
                Tables\Columns\TextColumn::make('nama_kelas')
                ->searchable(),
                Tables\Columns\TextColumn::make('konsentrasi_keahlian')
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
            'index' => Pages\ListKelas::route('/'),
            'create' => Pages\CreateKelas::route('/create'),
            'edit' => Pages\EditKelas::route('/{record}/edit'),
        ];
    }
}
