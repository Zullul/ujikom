<?php

namespace App\Filament\Resources;

use App\Filament\Resources\JurnalHarianResource\Pages;
use App\Models\JurnalHarian;
use App\Models\PrakerinSiswa;
use App\Models\Absensi;
use Carbon\Carbon;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;

class JurnalHarianResource extends Resource
{
    protected static ?string $model = JurnalHarian::class;
    protected static ?string $navigationIcon = 'heroicon-o-book-open';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?string $pluralModelLabel = 'Jurnal Harian';
    protected static ?string $navigationLabel = 'Jurnal Harian';
    protected static ?int $navigationSort = 2;

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return $user->isSiswa();
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        $query = parent::getEloquentQuery();

        if ($user->isSiswa()) {
            return $query->where('siswa_id', $user->ref_id);
        }
        return $query->whereRaw('1 = 0');
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\DatePicker::make('tanggal')
                    ->default(now())->required()->disabled(),
                Forms\Components\RichEditor::make('kegiatan')->required()->columnSpanFull(),
            ]);
    }

    // --- PERUBAHAN DI FUNGSI table() ---
    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('tanggal')->date('d M Y')->sortable(),
                Tables\Columns\TextColumn::make('kegiatan')
                    ->formatStateUsing(fn (string $state): string => strip_tags($state))
                    ->limit(50)
                    ->wrap()
                    ->searchable(),
                // Kolom IconColumn untuk diverifikasi_pembimbing_dudi DIHAPUS
                // Kolom IconColumn untuk diverifikasi_guru_pembimbing DUDI DIHAPUS
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                // Aksi Edit tidak lagi perlu memeriksa status verifikasi
                Tables\Actions\EditAction::make(),
            ])
            ->defaultSort('tanggal', 'desc');
    }
    // --- AKHIR PERUBAHAN ---

    public static function canCreate(): bool
    {
        $user = Auth::user();
        if (!$user->isSiswa()) return false;

        $sudahAbsenMasuk = Absensi::where('siswa_id', $user->ref_id)->whereDate('tanggal', today())->whereNotNull('jam_masuk')->exists();
        $sudahIsiJurnal = JurnalHarian::where('siswa_id', $user->ref_id)->whereDate('tanggal', today())->exists();

        return $sudahAbsenMasuk && !$sudahIsiJurnal;
    }

    public static function infolist(Infolist $infolist): Infolist
    {
        return $infolist
            ->schema([
                TextEntry::make('tanggal')->date('l, d F Y'),
                TextEntry::make('kegiatan')
                    ->formatStateUsing(fn (string $state): string => strip_tags($state, '<br><p><strong><em><ul><ol><li>'))
                    ->html()
                    ->columnSpanFull(),
                // Catatan pembimbing masih bisa ditampilkan jika memang masih diperlukan
                TextEntry::make('catatan_pembimbing_dudi')->visible(fn($record) => !empty($record->catatan_pembimbing_dudi)),
                TextEntry::make('catatan_guru_pembimbing')->visible(fn($record) => !empty($record->catatan_guru_pembimbing)),
            ]);
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListJurnalHarians::route('/'),
            'create' => Pages\CreateJurnalHarian::route('/create'),
            'edit' => Pages\EditJurnalHarian::route('/{record}/edit'),
            'view' => Pages\ViewJurnalHarian::route('/{record}'),
        ];
    }
}