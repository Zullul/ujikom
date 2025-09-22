<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    use HasFactory;

    protected $table = 'absensi';

    protected $fillable = [
        'prakerin_id',
        'prakerin_siswa_id',
        'tanggal',
        'jam_masuk',
        'jam_pulang',
        'status',
        'catatan_harian',
        'cek_pembimbing',
        'cek_tgl'
    ];

    protected $casts = [
        'tanggal' => 'date',
        'jam_masuk' => 'datetime:H:i',
        'jam_pulang' => 'datetime:H:i',
        'cek_tgl' => 'date',
        'cek_pembimbing' => 'boolean'
    ];

    public function prakerin()
    {
        return $this->belongsTo(Prakerin::class);
    }

    public function prakerinSiswa()
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }
}
