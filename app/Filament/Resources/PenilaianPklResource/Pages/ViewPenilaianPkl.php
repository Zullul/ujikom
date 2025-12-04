<?php

namespace App\Filament\Resources\PenilaianPklResource\Pages;

use App\Filament\Resources\PenilaianPklResource;
use App\Models\PenilaianPkl;
use Filament\Resources\Pages\ViewRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Contracts\Support\Htmlable;

class ViewPenilaianPkl extends ViewRecord
{
    protected static string $resource = PenilaianPklResource::class;

    /**
     * Override view untuk Admin Sekolah dan Siswa menggunakan format sertifikat
     */
    protected static string $view = 'filament.pages.view-penilaian-sertifikat';
    
    /**
     * Kondisional view berdasarkan role
     */
    public function getView(): string
    {
        $user = Auth::user();
        
        // Jika Admin Sekolah atau Siswa, gunakan view sertifikat
        if ($user->isAdminSekolah() || $user->isSiswa()) {
            return 'filament.pages.view-penilaian-sertifikat';
        }
        
        // Jika Guru atau DUDI, gunakan view khusus guru/pembimbing
        if ($user->isGuru() || $user->isDudiPembimbing()) {
            return 'filament.pages.view-penilaian-guru';
        }
        
        // Fallback ke view default
        return 'filament-panels::pages.view-record';
    }

    /**
     * 2. TAMBAHKAN SELURUH METHOD DI BAWAH INI
     * Method ini akan menimpa cara default Filament dalam mencari data,
     * memastikan ia mencari di tabel `penilaian_pkls` dengan query yang benar.
     */
    protected function resolveRecord(int | string $key): Model
    {
        // Mulai query pada model yang benar (PenilaianPkl)
        $query = PenilaianPkl::query();

        // Terapkan kembali logika otorisasi agar tetap aman
        $user = Auth::user();

        if ($user->isGuru() || $user->isDudiPembimbing()) {
            $prakerinSiswaIds = \App\Models\PrakerinSiswa::where(
                $user->isGuru() ? 'guru_pembimbing_id' : 'dudi_pembimbing_id',
                $user->ref_id
            )->pluck('id');

            $query->whereIn('prakerin_siswa_id', $prakerinSiswaIds);
        } elseif ($user->isAdminSekolah()) {
            $query->whereHas('prakerinSiswa.siswa', fn($q) => $q->where('sekolah_id', $user->sekolah_id));
        } elseif ($user->isSiswa()) {
            $query->whereHas('prakerinSiswa', fn($q) => $q->where('siswa_id', $user->ref_id));
        }

        // Eager load semua relations yang dibutuhkan untuk menghindari N+1
        $query->with([
            'prakerinSiswa.siswa.kelas',
            'prakerinSiswa.siswa.sekolah',
            'prakerinSiswa.dudi',
            'details.tujuanPembelajaran'
        ]);

        // Cari dan kembalikan data, atau tampilkan 404 jika tidak ditemukan
        return $query->findOrFail($key);
    }
}
