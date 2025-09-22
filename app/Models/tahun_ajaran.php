<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tahun_ajaran extends Model
{
    use HasFactory;

    protected $table = 'tahun_ajaran';

    protected $fillable = [
        'tahun_ajaran',
        'sekolah_id',
        'is_active'
    ];

    protected $casts = [
        'is_active' => 'boolean'
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function prakerin()
    {
        return $this->hasMany(Prakerin::class);
    }

    public function kelasSiswa()
    {
        return $this->hasMany(KelasSiswa::class);
    }
}
