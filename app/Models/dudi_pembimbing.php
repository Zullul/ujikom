<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class dudi_pembimbing extends Model
{
    protected $fillable = ['dudi_id', 'nama_pembimbing'];
    public function dudi()
    {
        return $this->belongsTo(dudi::class); // Relasi ke Dudi
    }
}
