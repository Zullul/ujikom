<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JurnalHarian extends Model
{
    use HasFactory;

    protected $table = 'jurnal_harian';

    protected $fillable = [
        'prakerin_id',
        'prakerin_siswa_id',
        'tanggal',
        'kegiatan',
        'hasil',
        'kendala',
        'tindakan_followup',
        'status_review',
        'reviewer_role',
        'reviewer_id'
    ];

    protected $casts = [
        'tanggal' => 'date'
    ];

    public function prakerin()
    {
        return $this->belongsTo(Prakerin::class);
    }

    public function prakerinSiswa()
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }
}
