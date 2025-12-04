<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TujuanPembelajaranResource\Pages;
use App\Models\TujuanPembelajaran;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class TujuanPembelajaranResource extends Resource
{
    protected static ?string $model = TujuanPembelajaran::class;
    protected static ?string $navigationIcon = 'heroicon-o-check-badge';
    protected static ?string $navigationLabel = 'Tujuan Pembelajaran';
    protected static ?string $pluralModelLabel = 'Tujuan Pembelajaran';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 2;

    public static function canAccess(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()->where('sekolah_id', Auth::user()->sekolah_id);
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('deskripsi')
                    ->required(),
                Forms\Components\Hidden::make('sekolah_id')
                    ->default(fn () => Auth::user()->sekolah_id),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('deskripsi')
                    ->html()
                    ->wrap(),
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
            'index' => Pages\ListTujuanPembelajarans::route('/'),
            'create' => Pages\CreateTujuanPembelajaran::route('/create'),
            'edit' => Pages\EditTujuanPembelajaran::route('/{record}/edit'),
        ];
    }
}