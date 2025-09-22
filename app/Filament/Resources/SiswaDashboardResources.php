<?php

namespace App\Filament\Resources;

use App\Models\Siswa;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use App\Filament\Resources\SiswaDashboardResource\Pages;

class SiswaDashboardResource extends Resource
{
    protected static ?string $model = Siswa::class;
    protected static ?string $navigationIcon = 'heroicon-o-user';
    protected static ?string $navigationLabel = 'Dashboard Saya';
    protected static ?int $navigationSort = 1;

    public static function shouldRegisterNavigation(): bool
    {
        return Auth::user()->isSiswa();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_siswa')
                    ->label('Nama')
                    ->disabled(),
                Forms\Components\TextInput::make('nis')
                    ->label('NIS')
                    ->disabled(),
                Forms\Components\TextInput::make('tempat_lahir')
                    ->label('Tempat Lahir')
                    ->disabled(),
                Forms\Components\DatePicker::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->disabled(),
                Forms\Components\TextInput::make('sekolah.nama_sekolah')
                    ->label('Sekolah')
                    ->disabled(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(function (Builder $query) {
                // Siswa hanya bisa lihat data dirinya sendiri
                return $query->where('id', Auth::user()->ref_id);
            })
            ->columns([
                Tables\Columns\TextColumn::make('nama_siswa')
                    ->label('Nama'),
                Tables\Columns\TextColumn::make('nis')
                    ->label('NIS'),
                Tables\Columns\TextColumn::make('tempat_lahir')
                    ->label('Tempat Lahir'),
                Tables\Columns\TextColumn::make('tanggal_lahir')
                    ->label('Tanggal Lahir')
                    ->date(),
                Tables\Columns\TextColumn::make('sekolah.nama_sekolah')
                    ->label('Sekolah'),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
            ])
            ->paginated(false);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListSiswaDashboard::route('/'),
            'view' => Pages\ViewSiswaDashboard::route('/{record}'),
        ];
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function canEdit($record): bool
    {
        return false;
    }

    public static function canDelete($record): bool
    {
        return false;
    }
}
