<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use App\Models\Scopes\TahunAjaranScope;
use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    use HasFactory;

    /**
     * Nama tabel yang digunakan oleh model.
     *
     * @var string
     */
    protected $table = 'absensis'; // <-- PERBAIKAN KUNCI

    /**
     * Atribut yang bisa diisi secara massal.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'siswa_id',
        'prakerin_siswa_id',
        'tanggal',
        'jam_masuk',
        'jam_pulang',
        'status_kehadiran',
        'keterangan',
        'diverifikasi_pembimbing_dudi',
        'foto_masuk',
        'foto_pulang',
        'foto_izin_sakit',
    ];

    /**
     * Tipe data asli untuk atribut.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'tanggal' => 'date',
        'diverifikasi_pembimbing_dudi' => 'boolean',
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
