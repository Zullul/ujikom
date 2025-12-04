<?php

namespace App\Filament\Resources\DudiPembimbingResource\Pages;

use App\Filament\Resources\DudiPembimbingResource;
use App\Models\Dudi;
use Filament\Resources\Pages\Page;
use Illuminate\Support\Facades\Auth;
use Livewire\Attributes\Url;

class PilihDudiPembimbing extends Page
{
    protected static string $resource = DudiPembimbingResource::class;

    protected static string $view = 'filament.resources.dudi-pembimbing-resource.pages.pilih-dudi-pembimbing';

    protected static ?string $title = 'Pilih DUDI - Data Pembimbing';

    #[Url]
    public $search = '';

    #[Url]
    public $filterAlamat = '';

    #[Url]
    public $filterBidangUsaha = '';

    // Method untuk mengambil data DUDI yang akan ditampilkan
    public function getDudis()
    {
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');
        $sekolahId = Auth::user()->sekolah_id;

        $query = Dudi::where('sekolah_id', $sekolahId)
            ->where('tahun_ajaran_id', $selectedTahunAjaranId)
            ->withCount('dudiPembimbings'); // Hitung jumlah pembimbing per DUDI

        // Apply search filter
        if ($this->search) {
            $query->where(function($q) {
                $q->where('nama_dudi', 'like', '%' . $this->search . '%')
                  ->orWhere('alamat', 'like', '%' . $this->search . '%')
                  ->orWhere('bidang_usaha', 'like', '%' . $this->search . '%');
            });
        }

        // Apply alamat filter
        if ($this->filterAlamat) {
            $query->where('alamat', $this->filterAlamat);
        }

        // Apply bidang usaha filter
        if ($this->filterBidangUsaha) {
            $query->where('bidang_usaha', $this->filterBidangUsaha);
        }

        return $query->get();
    }

    public function getAlamatOptions(): array
    {
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');
        $sekolahId = Auth::user()->sekolah_id;

        return Dudi::where('sekolah_id', $sekolahId)
            ->where('tahun_ajaran_id', $selectedTahunAjaranId)
            ->distinct()
            ->pluck('alamat')
            ->filter()
            ->sort()
            ->values()
            ->toArray();
    }

    public function getBidangUsahaOptions(): array
    {
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');
        $sekolahId = Auth::user()->sekolah_id;

        return Dudi::where('sekolah_id', $sekolahId)
            ->where('tahun_ajaran_id', $selectedTahunAjaranId)
            ->distinct()
            ->pluck('bidang_usaha')
            ->filter()
            ->sort()
            ->values()
            ->toArray();
    }

    // Helper untuk mendapatkan URL ke halaman list pembimbing per DUDI
    public function getListUrl($dudiId): string
    {
        return DudiPembimbingResource::getUrl('list-by-dudi', ['dudi_id' => $dudiId]);
    }
}
