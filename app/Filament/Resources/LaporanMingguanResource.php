<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LaporanMingguanResource\Pages;
use App\Models\LaporanMingguan;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class LaporanMingguanResource extends Resource
{
    protected static ?string $model = LaporanMingguan::class;
    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-bottom-center-text';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 3;
    protected static ?string $navigationLabel = 'Refleksi Mingguan';

    // --- BAGIAN YANG DIPERBAIKI ---
    public static function shouldRegisterNavigation(): bool
    {
        // Menu ini disembunyikan dari navigasi untuk semua role
        // Siswa masih bisa melihat halaman ini jika diarahkan, tapi tidak akan ada di menu
        return Auth::user()->role_type === 'siswa';
    }
    // --- AKHIR PERBAIKAN ---

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('minggu_ke')->label('Minggu Ke-')->sortable(),
                Tables\Columns\TextColumn::make('tanggal_mulai_minggu')->label('Periode')->date('d M Y'),
                Tables\Columns\TextColumn::make('laporan_guru')->label('Refleksi Guru')->limit(50)->wrap(),
                Tables\Columns\TextColumn::make('laporan_dudi')->label('Refleksi DUDI')->limit(50)->wrap(),
                Tables\Columns\IconColumn::make('verifikasi_guru')->label('Verifikasi Guru')->boolean(),
                Tables\Columns\IconColumn::make('verifikasi_dudi')->label('Verifikasi DUDI')->boolean(),
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLaporanMingguans::route('/'),
            'view' => Pages\ViewLaporanMingguan::route('/{record}'),
        ];
    }
}
