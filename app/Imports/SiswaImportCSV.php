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
        // Ambil ID kelas dari mapping berdasarkan nama kelas di CSV
        $kelasId = $this->kelasMapping[strtolower(trim($row['kelas']))] ?? null;

        // Jangan impor jika kelas tidak ditemukan
        if (!$kelasId) {
            return null;
        }

        return new Siswa([
            'nama_siswa'    => $row['nama_siswa'],
            'nis'           => $row['nis'],
            'jenis_kelamin' => $row['jenis_kelamin'],
            'kelas_id'      => $kelasId,
            'sekolah_id'    => $this->sekolahId,         // <-- Ambil dari constructor
            'tahun_ajaran_id' => $this->tahunAjaranId, // <-- Ambil dari constructor
        ]);
    }
}
