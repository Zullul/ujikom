<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PenilaianDetail extends Model
{
    use HasFactory;

    protected $table = 'penilaian_details';
    protected $guarded = [];

    public function penilaianPkl(): BelongsTo
    {
        return $this->belongsTo(PenilaianPkl::class);
    }

    public function tujuanPembelajaran(): BelongsTo
    {
        return $this->belongsTo(TujuanPembelajaran::class);
    }
}
