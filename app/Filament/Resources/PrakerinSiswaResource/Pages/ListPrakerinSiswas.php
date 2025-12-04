<?php

namespace App\Filament\Resources\PrakerinSiswaResource\Pages;

use App\Filament\Resources\PrakerinSiswaResource;
use App\Models\PrakerinSiswa;
use Filament\Actions;
use Filament\Resources\Pages\Page;
use Illuminate\Support\Collection;
use Livewire\Attributes\Url; // <-- 1. Import class Url

class ListPrakerinSiswas extends Page
{
    protected static string $resource = PrakerinSiswaResource::class;
    protected static string $view = 'filament.resources.prakerin-siswa-resource.pages.list-rombels';
    protected static ?string $title = 'Prakerin Siswa';

    public array $rombels = [];

    #[Url(keep: true)] // <-- 2. Atribut ini membuat search query tersimpan di URL
    public string $search = ''; // <-- 3. Properti publik untuk menampung input search

    public function mount(): void
    {
        $this->prepareRombelsData();
    }

    // 4. Method ini akan otomatis terpanggil setiap kali nilai $search berubah
    public function updatedSearch(): void
    {
        $this->prepareRombelsData();
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\Action::make('create')
                ->label('Tempatkan Siswa Baru')
                ->url(PrakerinSiswaResource::getUrl('pilih-dudi')),
        ];
    }

    protected function prepareRombelsData(): void
    {
        $sekolahId = auth()->user()->sekolah_id;
        $tahunAjaranId = session('selected_tahun_ajaran_id');

        // Mulai query dasar
        $query = PrakerinSiswa::with(['dudi', 'prakerin', 'dudiPembimbing', 'guru', 'siswa.kelas'])
            ->whereHas('siswa', fn($q) => $q->where('sekolah_id', $sekolahId))
            ->whereHas('prakerin', fn($q) => $q->where('tahun_ajaran_id', $tahunAjaranId));

        // 5. Tambahkan kondisi pencarian jika $this->search tidak kosong
        if (!empty($this->search)) {
            $query->where(function ($q) {
                $search = $this->search;
                // Cari di nama DUDI
                $q->whereHas('dudi', function ($subQuery) use ($search) {
                    $subQuery->where('nama_dudi', 'like', "%{$search}%");
                })
                    // Atau cari di nama Pembimbing DUDI
                    ->orWhereHas('dudiPembimbing', function ($subQuery) use ($search) {
                        $subQuery->where('nama_pembimbing', 'like', "%{$search}%");
                    })
                    // Atau cari di nama Guru
                    ->orWhereHas('guru', function ($subQuery) use ($search) {
                        $subQuery->where('nama_guru', 'like', "%{$search}%");
                    });
            });
        }

        $placements = $query->get();

        // Pengelompokan tetap dilakukan di PHP
        $this->rombels = $placements->groupBy(function ($item) {
            return implode('-', [
                $item->prakerin_id,
                $item->dudi_id,
                $item->guru_pembimbing_id,
                $item->dudi_pembimbing_id,
                $item->no_sk
            ]);
        })->all();
    }
}
