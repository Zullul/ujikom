<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Prakerin extends Model
{
    use HasFactory;

    protected $table = 'prakerin';

    protected $fillable = [
        'ketua',
        'sekretaris',
        'tanggal_mulai',
        'tanggal_selesai',
        'keterangan',
        'sekolah_id',
        'tahun_ajaran_id'
    ];

    protected $casts = [
        'tanggal_mulai' => 'date',
        'tanggal_selesai' => 'date',
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class);
    }

    public function absensi()
    {
        return $this->hasMany(Absensi::class);
    }

    public function jurnalHarian()
    {
        return $this->hasMany(JurnalHarian::class);
    }
}
