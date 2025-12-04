<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanMingguan extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'prakerin_siswa_id',
        'siswa_id',
        'minggu_ke',
        'tanggal_mulai_minggu',   // <-- Sudah ditambahkan
        'tanggal_selesai_minggu', // <-- Sudah ditambahkan
        'laporan_dudi',
        'laporan_guru',
        'verifikasi_dudi',
        'verifikasi_guru',
    ];

    public function prakerinSiswa()
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    /**
     * Get all absensis for this week period
     */
    public function absensis()
    {
        return $this->hasMany(Absensi::class, 'siswa_id', 'siswa_id')
            ->whereBetween('tanggal', [$this->tanggal_mulai_minggu, $this->tanggal_selesai_minggu])
            ->orderBy('tanggal', 'asc');
    }
}
