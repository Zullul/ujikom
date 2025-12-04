<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JurnalHarian extends Model
{
    use HasFactory;

    protected $table = 'jurnal_harians';

    protected $fillable = [
        'siswa_id',
        'prakerin_siswa_id',
        'tanggal',
        'kegiatan',
        'foto_kegiatan',
        'diverifikasi_pembimbing_dudi',
        'catatan_pembimbing_dudi',
        'diverifikasi_guru_pembimbing',
        'catatan_guru_pembimbing',
    ];

    protected $casts = [
        'tanggal' => 'date',
        'diverifikasi_pembimbing_dudi' => 'boolean',
        'diverifikasi_guru_pembimbing' => 'boolean',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function prakerinSiswa()
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }
}
