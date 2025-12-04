<?php

namespace App\Filament\Resources;

use App\Filament\Resources\TahunAjaranResource\Pages;
use App\Models\tahun_ajaran;
use Filament\Resources\Resource;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class TahunAjaranResource extends Resource
{
    protected static ?string $model = tahun_ajaran::class;
    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?string $navigationLabel = 'Data Tahun Ajaran';
    protected static ?string $pluralModelLabel = 'Data Tahun Ajaran';
    protected static ?string $modelLabel = 'Data Tahun Ajaran';
    protected static ?int $navigationSort = 1;
    // protected static ?string $navigationGroup = 'Manajemen Data';

    public static function GetNavigationGroup():string
    {
        $user = Auth::user();
        if ($user->isSuperAdmin()) {
            return "Manajemen Data";
        }
        return "Manajemen Data";
    }

    public static function canViewAny(): bool
    {
        $user = Auth::user();
        return $user->isSuperAdmin();
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

    public static function canCreate(): bool
    {
        return Auth::user()->isSuperAdmin();
    }

    public static function canEdit($record): bool
    {
        return Auth::user()->isSuperAdmin();
    }

    public static function canDelete($record): bool
    {
        return Auth::user()->isSuperAdmin();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('tahun_ajaran')
                    ->required(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('tahun_ajaran')
                    ->searchable(),
            ])
            ->actions([
                Tables\Actions\EditAction::make()
                    ->visible(fn() => Auth::user()->isSuperAdmin()),
                Tables\Actions\DeleteAction::make()
                    ->visible(fn() => Auth::user()->isSuperAdmin()),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make()
                        ->visible(fn() => Auth::user()->isSuperAdmin()),
                ]),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListTahunAjarans::route('/'),
            'create' => Pages\CreateTahunAjaran::route('/create'),
            'edit' => Pages\EditTahunAjaran::route('/{record}/edit'),
        ];
    }
}
