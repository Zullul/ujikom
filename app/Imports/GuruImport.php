<?php
// app/Imports/GuruImport.php

namespace App\Imports;

use App\Models\Guru;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class GuruImport implements ToModel, WithHeadingRow
{
    private $sekolahId;
    private $tahunAjaranId;

    // --- MODIFIKASI CONSTRUCTOR ---
    public function __construct(int $sekolahId, int $tahunAjaranId)
    {
        $this->sekolahId = $sekolahId;
        $this->tahunAjaranId = $tahunAjaranId;
    }

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        return new Guru([
            'nama_guru'     => $row['nama_guru'],
            'nip'           => $row['nip'],
            'kontak'        => $row['kontak'],
            'jabatan'       => $row['jabatan'],
            'sekolah_id'    => $this->sekolahId, // <-- Diambil dari constructor
            'tahun_ajaran_id' => $this->tahunAjaranId, // <-- Diambil dari constructor
        ]);
    }
}
