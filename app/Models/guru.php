<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Guru extends Model
{
    use HasFactory;

    protected $table = 'gurus';

    protected $fillable = [
        'nama_guru',
        'nip',
        'kontak',
        'jabatan',
        'sekolah_id'
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    // Tambahkan method ini ke model Guru yang sudah ada
    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 2);
    }

    // Relasi ke prakerin siswa (sebagai pembimbing)
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'guru_id');
    }

    // Get siswa yang dibimbing
    public function siswaBimbingan()
    {
        return $this->hasManyThrough(
            Siswa::class,
            PrakerinSiswa::class,
            'guru_id',
            'id',
            'id',
            'siswa_id'
        );
    }

    // Scope untuk guru yang belum punya user
    public function scopeWithoutUser($query)
    {
        return $query->whereDoesntHave('user');
    }

    // Helper method untuk membuat username otomatis
    public function generateUsername()
    {
        return strtolower($this->nip);
    }

    // Helper method untuk membuat email otomatis
    public function generateEmail()
    {
        return strtolower($this->nip) . '@guru.com';
    }
}
