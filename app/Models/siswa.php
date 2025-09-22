<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    use HasFactory;

    protected $table = 'siswas';

    protected $fillable = [
        'nama_siswa',
        'nis',
        'tempat_lahir',
        'tanggal_lahir',
        'sekolah_id',
    ];

    protected $casts = [
        'tanggal_lahir' => 'date',
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 1);
    }

    // Relasi ke prakerin siswa
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'siswa_id');
    }

    // Get guru pembimbing dari prakerin aktif
    public function guruPembimbing()
    {
        return $this->hasManyThrough(
            Guru::class,
            PrakerinSiswa::class,
            'siswa_id', // Foreign key on prakerin_siswa table
            'id', // Foreign key on guru table
            'id', // Local key on siswa table
            'guru_id' // Local key on prakerin_siswa table
        );
    }

    // Get dudi dari prakerin aktif
    public function dudi()
    {
        return $this->hasManyThrough(
            Dudi::class,
            PrakerinSiswa::class,
            'siswa_id',
            'id',
            'id',
            'dudi_id'
        );
    }

    // Scope untuk siswa yang belum punya user
    public function scopeWithoutUser($query)
    {
        return $query->whereDoesntHave('user');
    }

    // Helper method untuk membuat username otomatis
    public function generateUsername()
    {
        return strtolower($this->nis);
    }

    // Helper method untuk membuat email otomatis
    public function generateEmail()
    {
        return strtolower($this->nis) . '@siswa.com';
    }
}
