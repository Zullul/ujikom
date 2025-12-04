<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LokasiDudiSayaResource\Pages;
use App\Filament\Resources\LokasiDudiSayaResource\RelationManagers;
use App\Models\LokasiDudiSaya;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Facades\Auth;

class LokasiDudiSayaResource extends Resource
{
    protected static ?string $model = LokasiDudiSaya::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';
    
    public static function shouldRegisterNavigation(): bool
    {
        // Resource ini tidak digunakan, disembunyikan dari navigasi
        // Gunakan Page AmbilLokasiDudi sebagai gantinya
        return false;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                //
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                //
            ])
            ->filters([
                //
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
            'index' => Pages\ManageLokasiDudiSayas::route('/'),
        ];
    }
}
