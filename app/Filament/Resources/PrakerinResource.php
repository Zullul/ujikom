<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PrakerinResource\Pages;
use App\Models\Prakerin;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Auth;

class PrakerinResource extends Resource
{
    protected static ?string $model = Prakerin::class;
    protected static ?string $navigationIcon = 'heroicon-o-briefcase';
    protected static ?string $navigationLabel = 'Data Prakerin';
    protected static ?string $pluralModelLabel = 'Data Prakerin';
    protected static ?string $navigationGroup = 'Manajemen Prakerin';
    protected static ?int $navigationSort = 1;

    public static function shouldRegisterNavigation(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('ketua')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('sekretaris')
                    ->required()
                    ->maxLength(255),
                Forms\Components\DatePicker::make('tanggal_mulai')
                    ->required()
                    ->native(false),
                Forms\Components\DatePicker::make('tanggal_selesai')
                    ->required()
                    ->native(false)
                    ->after('tanggal_mulai'),
                Forms\Components\TextInput::make('no_sk')
                    ->label('Nomor SK')
                    ->maxLength(255)
                    ->columnSpanFull(),
                Forms\Components\Textarea::make('keterangan')
                    ->required()
                    ->maxLength(255)
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->modifyQueryUsing(function ($query) {
                $query->where('sekolah_id', Auth::user()->sekolah_id)
                      ->where('tahun_ajaran_id', session('selected_tahun_ajaran_id'));
            })
            ->columns([
                Tables\Columns\TextColumn::make('ketua')->searchable(),
                // Tables\Columns\TextColumn::make('tahunAjaran.tahun_ajaran')->label('Tahun Ajaran')->sortable(),
                Tables\Columns\TextColumn::make('tanggal_mulai')->dateTime('d M Y'),
                Tables\Columns\TextColumn::make('tanggal_selesai')->dateTime('d M Y'),
                Tables\Columns\TextColumn::make('no_sk')->label('No. SK'),
                Tables\Columns\TextColumn::make('keterangan')->limit(50),
            ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\ViewAction::make(),
                Tables\Actions\DeleteAction::make()->requiresConfirmation(),
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
            'index' => Pages\ListPrakerins::route('/'),
            'create' => Pages\CreatePrakerin::route('/create'),
            'view' => Pages\ViewPrakerin::route('/{record}'),
            'edit' => Pages\EditPrakerin::route('/{record}/edit'),
        ];
    }
}
