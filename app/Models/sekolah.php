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
        'nama_kepala_sekolah',
        'alamat_sekolah',
        'status_sekolah',
        'masa_aktif_mulai',   // <-- Tambahkan baris ini
        'masa_aktif_selesai', // <-- Tambahkan baris ini
        'is_aktif',           // <-- Tambahkan baris ini
        'batas_akun',         // <-- Tambahkan baris ini
        'kuota_bonus',        // <-- Kuota bonus dengan peringatan
    ];

    

    public function users()
    {
        return $this->hasMany(User::class);
    }

    // ... relasi lainnya ...

    /**
     * Tambahkan method ini
     * Mendapatkan user admin yang terkait dengan sekolah ini.
     */
    public function user()
    {
        return $this->hasOne(User::class, 'sekolah_id')->where('role_type', 'admin_sekolah');
    }
    public function dudis()
    {
        return $this->hasMany(Dudi::class);
    }
}
