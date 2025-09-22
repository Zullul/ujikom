<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PrakerinSiswa extends Model
{
    use HasFactory;

    protected $table = 'prakerin_siswa';

    protected $fillable = [
        'nama_siswa',
        'nis',
        'tempat_lahir',
        'tanggal_lahir',
        'jenis_kelamin',
        'alamat',
        'kontak',
        'siswa_id',
        'prakerin_id',
        'guru_id',
        'dudi_id',
        'dudi_pembimbing_id',
    ];

    protected $casts = [
        'tanggal_lahir' => 'date',
    ];

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function prakerin()
    {
        return $this->belongsTo(Prakerin::class);
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class);
    }

    public function dudi()
    {
        return $this->belongsTo(Dudi::class);
    }

    public function dudiPembimbing()
    {
        return $this->belongsTo(dudi_pembimbing::class, 'dudi_pembimbing_id');
    }
}
