<?php

namespace App\Filament\Resources;

use App\Filament\Resources\SekolahResource\Pages;
use App\Models\sekolah as Sekolah;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;

use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Illuminate\Support\Facades\Auth;

class SekolahResource extends Resource
{
    protected static ?string $model = Sekolah::class;

    protected static ?string $navigationIcon = 'heroicon-o-building-office-2';

    protected static ?string $navigationLabel = 'Kelola Sekolah';

    protected static ?string $pluralModelLabel = 'Kelola Sekolah';

    protected static ?string $navigationGroup = 'Pengaturan';

        protected static ?string $modelLabel = 'Kelola Sekolah';
    
        protected static ?int $navigationSort = 2;
    
        // protected static ?string $navigationGroup = 'Manajemen Data';

    public static function GetNavigationGroup(): string
    {
        $user = Auth::user();
        if ($user->isSuperAdmin()) {
            return "Manajemen Data";
        }
        return "Pengaturan";
    }

    public static function canViewAny(): bool
    {
        $user = Auth::user();
        return $user->isSuperAdmin();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('nama_sekolah')
                    ->required()
                    ->maxLength(255),

                Forms\Components\TextInput::make('nama_kepala_sekolah')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('alamat_sekolah')
                    ->required()
                    ->maxLength(255),
                Forms\Components\Select::make('status_sekolah')
                    ->options([
                        'negeri' => 'Negeri',
                        'swasta' => 'Swasta',
                    ])
                    ->required(),
                Forms\Components\DatePicker::make('masa_aktif_mulai')
                    ->label('Masa Aktif Mulai')
                    ->required(),
                Forms\Components\DatePicker::make('masa_aktif_selesai')
                    ->label('Masa Aktif Selesai')
                    ->required(),
                Forms\Components\TextInput::make('batas_akun')
                    ->label('Batas Akun')
                    ->numeric()
                    ->required()
                    ->default(50),
                Forms\Components\Toggle::make('is_aktif')
                    ->label('Status Aktif')
                    ->default(true),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('nama_sekolah')->searchable()->sortable(),
                TextColumn::make('nama_kepala_sekolah')->searchable()->sortable(),

                // --- KODE YANG DIPERBAIKI ADA DI KOLOM INI ---
                TextColumn::make('masa_aktif_selesai')
                    ->label('Aktif Sampai')
                    ->date()
                    ->sortable()
                    ->color(function ($record) {
                        // Jika tanggal selesai tidak ada (null), jangan beri warna.
                        if (is_null($record->masa_aktif_selesai)) {
                            return null;
                        }

                        // Ubah string tanggal menjadi objek Carbon untuk perbandingan
                        $tanggalSelesai = Carbon::parse($record->masa_aktif_selesai);

                        // Hitung sisa hari (nilai negatif artinya sudah lewat)
                        $sisaHari = Carbon::now()->diffInDays($tanggalSelesai, false);

                        if ($sisaHari < 0) {
                            return 'danger'; // Merah jika sudah lewat
                        }

                        if ($sisaHari <= 7) {
                            return 'warning'; // Kuning jika sisa 7 hari atau kurang
                        }

                        // Jika tidak masuk kondisi di atas, berarti masih aman
                        return 'success'; // Hijau
                    }),

                IconColumn::make('is_aktif')
                    ->label('Status Aktif')
                    ->boolean(),

                TextColumn::make('batas_akun')->searchable()->sortable(),
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
            'index' => Pages\ListSekolahs::route('/'),
            'create' => Pages\CreateSekolah::route('/create'),
            'edit' => Pages\EditSekolah::route('/{record}/edit'),
        ];
    }
}
