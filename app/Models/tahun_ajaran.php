<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tahun_ajaran extends Model
{
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    // --- TAMBAHKAN BARIS INI UNTUK MEMPERBAIKI ERROR ---
    protected $table = 'tahun_ajarans';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'tahun_ajaran',
        'sekolah_id'
    ];

    /**
     * Get the sekolah that owns the tahun_ajaran.
     */
    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    /**
     * Get the prakerins for the tahun_ajaran.
     */
    public function prakerins()
    {
        return $this->hasMany(Prakerin::class);
    }
    
}