<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PenilaianPkl extends Model
{
    use HasFactory;

    protected $table = 'penilaian_pkl';

    protected $fillable = [
        'tgl',
        'skor',
        'keterangan',
        'ketercapaian',
        'prakerin_siswa_id',
        'tujuan_pembelajaran_id',
        'penilai_role',
        'penilai_id'
    ];

    protected $casts = [
        'tgl' => 'date'
    ];

    public function prakerinSiswa()
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }

    public function tujuanPembelajaran()
    {
        return $this->belongsTo(TujuanPembelajaran::class);
    }
}
