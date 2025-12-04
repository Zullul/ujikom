<?php

namespace App\Filament\Resources;

use App\Filament\Resources\PrakerinSiswaResource\Pages;
use App\Models\PrakerinSiswa;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Support\Facades\Auth;

class PrakerinSiswaResource extends Resource
{
    protected static ?string $model = PrakerinSiswa::class;
    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';
    protected static ?string $navigationLabel = 'Prakerin Siswa';
    protected static ?string $pluralModelLabel = 'Prakerin Siswa';
    protected static ?string $navigationGroup = 'Manajemen Prakerin';
    protected static ?int $navigationSort = 2;

    public static function shouldRegisterNavigation(): bool
    {
        return Auth::user()->isAdminSekolah();
    }

    public static function table(Table $table): Table
    {
        return $table
            // Kita tidak perlu query() di sini, cukup view() saja
            ->view('filament.resources.prakerin-siswa-resource.pages.list-rombels')
            ->viewData(function () {
                // Logika pengolahan data sekarang aman di sini
                $sekolahId = auth()->user()->sekolah_id;
                $tahunAjaranId = session('selected_tahun_ajaran_id');

                $placements = PrakerinSiswa::with(['dudi', 'prakerin', 'dudiPembimbing', 'guru', 'siswa.kelas'])
                    ->whereHas('siswa', fn($q) => $q->where('sekolah_id', $sekolahId))
                    ->whereHas('prakerin', fn($q) => $q->where('tahun_ajaran_id', $tahunAjaranId))
                    ->get();

                // Kelompokkan di PHP
                $grouped = $placements->groupBy(function ($item) {
                    return implode('-', [
                        $item->prakerin_id,
                        $item->dudi_id,
                        $item->guru_pembimbing_id,
                        $item->dudi_pembimbing_id,
                        $item->no_sk
                    ]);
                });

                // --- INI ADALAH PERBAIKAN KUNCINYA ---
                // Kirim data sebagai array, bukan collection
                return ['rombels' => $grouped];
            });
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPrakerinSiswas::route('/'),
            'pilih-dudi' => Pages\PilihDudi::route('/pilih-dudi'),
            'create' => Pages\CreatePrakerinSiswa::route('/create'),
            'edit' => Pages\EditPrakerinSiswa::route('/{record}/edit'),
        ];
    }
}
