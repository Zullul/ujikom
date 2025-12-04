<?php
// app/Imports/SiswaImport.php

namespace App\Imports;

use App\Models\Siswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class SiswaImport implements ToModel, WithHeadingRow
{
    private $sekolahId;
    private $tahunAjaranId;
    private $kelasMapping;

    // --- MODIFIKASI CONSTRUCTOR ---
    public function __construct(int $sekolahId, int $tahunAjaranId, array $kelasMapping)
    {
        $this->sekolahId = $sekolahId;
        $this->tahunAjaranId = $tahunAjaranId;
        $this->kelasMapping = $kelasMapping;
    }

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        // Normalisasi nama kelas dari CSV (convert XII -> 12, XI -> 11, X -> 10)
        $kelasFromCsv = trim($row['kelas']);
        $kelasNormalized = $this->normalizeKelasName($kelasFromCsv);
        
        \Log::info("CSV Kelas: '{$kelasFromCsv}' -> Normalized: '{$kelasNormalized}'");
        
        // Ambil ID kelas dari mapping berdasarkan nama kelas yang sudah dinormalisasi
        $kelasId = $this->kelasMapping[$kelasNormalized] ?? null;

        // Jangan impor jika kelas tidak ditemukan
        if (!$kelasId) {
            \Log::warning("Kelas '{$kelasFromCsv}' (normalized: '{$kelasNormalized}') tidak ditemukan dalam mapping!");
            return null;
        }
        
        \Log::info("Kelas '{$kelasFromCsv}' matched to ID: {$kelasId}");

        return new Siswa([
            'nama_siswa'    => $row['nama_siswa'],
            'nis'           => $row['nis'],
            'tempat_lahir'  => $row['tempat_lahir'] ?? null,
            'tanggal_lahir' => $row['tanggal_lahir'] ?? null,
            'kelas_id'      => $kelasId,
            'sekolah_id'    => $this->sekolahId,
            'tahun_ajaran_id' => $this->tahunAjaranId,
            'status'        => 'aktif',
        ]);
    }
    
    /**
     * Normalisasi nama kelas: XII -> 12, XI -> 11, X -> 10
     */
    private function normalizeKelasName(string $kelas): string
    {
        $normalized = strtolower(trim($kelas));
        
        // Replace angka romawi dengan angka biasa
        $normalized = preg_replace('/^xii\s+/', '12 ', $normalized);
        $normalized = preg_replace('/^xi\s+/', '11 ', $normalized);
        $normalized = preg_replace('/^x\s+/', '10 ', $normalized);
        
        return $normalized;
    }
}
