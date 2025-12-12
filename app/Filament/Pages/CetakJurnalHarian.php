<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\JurnalHarian;
use App\Models\PrakerinSiswa;
use Illuminate\Support\Facades\Auth;
use Filament\Notifications\Notification;

class CetakJurnalHarian extends Page
{
    protected static ?string $navigationIcon = 'heroicon-o-printer';
    protected static string $view = 'filament.pages.cetak-jurnal-harian';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 5;
    protected static ?string $navigationLabel = 'Cetak Jurnal Harian';
    protected static ?string $title = 'Cetak Jurnal Harian';

    public $prakerinSiswa;
    public $jurnalHarian;
    public $siswa;

    public static function canAccess(): bool
    {
        $user = Auth::user();
        return $user->isSiswa();
    }

    public function mount(): void
    {
        $user = Auth::user();

        // Ambil data prakerin siswa yang sedang berjalan
        $this->prakerinSiswa = PrakerinSiswa::where('siswa_id', $user->ref_id)
            ->where('status', 'berjalan')
            ->with([
                'siswa.kelas',
                'siswa.sekolah',
                'dudi',
                'dudiPembimbing',
                'guru',
                'prakerin'
            ])
            ->first();

        if (!$this->prakerinSiswa) {
            Notification::make()
                ->title('Tidak ada periode PKL aktif')
                ->danger()
                ->send();
            return;
        }

        $this->siswa = $this->prakerinSiswa->siswa;

        // Ambil semua jurnal harian siswa untuk periode prakerin ini
        $this->jurnalHarian = JurnalHarian::where('siswa_id', $user->ref_id)
            ->whereDate('tanggal', '>=', $this->prakerinSiswa->prakerin->tanggal_mulai)
            ->whereDate('tanggal', '<=', $this->prakerinSiswa->prakerin->tanggal_selesai)
            ->orderBy('tanggal', 'asc')
            ->get();
    }
}
