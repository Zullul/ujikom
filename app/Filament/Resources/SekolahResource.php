<?php
// app/Filament/Resources/SekolahResource.php

namespace App\Filament\Resources;

use App\Filament\Resources\SekolahResource\Pages;
use App\Models\Sekolah;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Auth;


class SekolahResource extends Resource
{
    protected static ?string $model = Sekolah::class;
    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';
    protected static ?string $navigationLabel = 'Sekolah';
    protected static ?string $pluralLabel = 'Sekolah';

    // public static function shouldRegisterNavigation(): bool
    // {
    //     $user = Auth::user();
    //     return $user && ($user->isAdminPusat());
    // }

    public static function canViewAny(): bool
    {
        return auth()->user()->can('view_sekolah');
    }

    public static function canCreate(): bool
    {
        return auth()->user()->can('create_sekolah');
    }

    public static function canEdit($record): bool
    {
        return auth()->user()->can('edit_sekolah');
    }

    public static function canDelete($record): bool
    {
        return auth()->user()->can('delete_sekolah');
    }

    public static function shouldRegisterNavigation(): bool
    {
        return auth()->user()->can('view_sekolah');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_sekolah')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Textarea::make('alamat_sekolah')
                    ->required()
                    ->rows(3),
                Forms\Components\TextInput::make('nama_kepala_sekolah')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('status_sekolah')
                    ->options([
                        'smk' => 'SMK',
                        'sma' => 'SMA',
                    ])
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('nama_sekolah')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('alamat_sekolah')
                    ->limit(50),
                Tables\Columns\TextColumn::make('nama_kepala_sekolah'),
                Tables\Columns\BadgeColumn::make('status_sekolah')
                    ->colors([
                        'success' => 'smk',
                        'secondary' => 'sma',
                    ]),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('status_sekolah')
                    ->options([
                        'smk' => 'SMK',
                        'sma' => 'SMA',
                    ]),
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
            'index' => Pages\ListSekolahs::route('/'),
            'create' => Pages\CreateSekolah::route('/create'),
            'edit' => Pages\EditSekolah::route('/{record}/edit'),
        ];
    }
}
