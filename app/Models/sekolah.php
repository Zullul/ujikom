<?php
// app/Models/Sekolah.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sekolah extends Model
{
    use HasFactory;

    protected $table = 'sekolahs';

    protected $fillable = [
        'nama_sekolah',
        'alamat_sekolah',
        'kontak',
        'nama_kepala_sekolah',
        'status_sekolah' // aktif, non-aktif
    ];

    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 1);
    }

    public function gurus()
    {
        return $this->hasMany(Guru::class);
    }

    public function kelas()
    {
        return $this->hasMany(KelasSiswa::class);
    }

    public function dudis()
    {
        return $this->hasMany(Dudi::class);
    }
}
