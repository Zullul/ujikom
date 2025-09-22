<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Dudi extends Model
{
    use HasFactory;

    protected $table = 'dudis';

    protected $fillable = [
        'sekolah_id',
        'nama_dudi',
        'bidang_usaha',
        'alamat',
        'pimpinan',
        'instruktur'
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    // Relasi ke User
    // Tambahkan method ini ke model Dudi yang sudah ada
    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 3);
    }

    // Relasi ke dudi pembimbing
    public function pembimbings()
    {
        return $this->hasMany(dudi_pembimbing::class, 'dudi_id');
    }

    // Relasi ke prakerin siswa
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'dudi_id');
    }

    // Get siswa yang prakerin di dudi ini
    public function siswaPrakerin()
    {
        return $this->hasManyThrough(
            Siswa::class,
            PrakerinSiswa::class,
            'dudi_id',
            'id',
            'id',
            'siswa_id'
        );
    }

    // Scope untuk dudi yang belum punya user
    public function scopeWithoutUser($query)
    {
        return $query->whereDoesntHave('user');
    }

    // Helper method untuk membuat username otomatis
    public function generateUsername()
    {
        return strtolower(str_replace([' ', '.', ',', '-'], '_', $this->nama_dudi));
    }

    // Helper method untuk membuat email otomatis
    public function generateEmail()
    {
        return $this->generateUsername() . '@dudi.com';
    }
}
