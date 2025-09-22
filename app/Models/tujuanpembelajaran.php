<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TujuanPembelajaran extends Model
{
    use HasFactory;

    protected $table = 'tujuan_pembelajaran';

    protected $fillable = [
        'deskripsi',
        'sekolah_id'
    ];

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function penilaianPkl()
    {
        return $this->hasMany(PenilaianPkl::class);
    }
}
