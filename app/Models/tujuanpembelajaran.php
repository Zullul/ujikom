<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class TujuanPembelajaran extends Model
{
    use HasFactory , LogsActivity ;

    protected $table = 'tujuan_pembelajarans';

    protected $fillable = [
        'deskripsi',
        'sekolah_id',
    ];
    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['deskripsi', 'sekolah_id']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Tujuan Pembelajaran')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }
    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) {
            'created' => 'membuat',
            'updated' => 'memperbarui',
            'deleted' => 'menghapus',
            default => 'melakukan aksi pada'
        };
        return "{$action} data tujuan pembelajaran: {$this->deskripsi}";
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }
}