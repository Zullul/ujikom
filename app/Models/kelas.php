<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\TahunAjaranScope; // <-- 1. TAMBAHKAN INI
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class Kelas extends Model
{
    use HasFactory , LogsActivity ;
    protected $guarded = [];
    

    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_kelas', 'kompetensi_keahlian']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Kelas')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }

    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'created' => 'membuat', 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data kelas: {$this->nama_kelas}";
    }

    // ... (kode relasi yang sudah ada) ...
    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }
    // ... (akhir dari kode relasi) ...


    /**
     * The "booted" method of the model.
     */
    protected static function booted(): void // <-- 2. TAMBAHKAN SELURUH FUNGSI INI
    {
        static::addGlobalScope(new TahunAjaranScope);
    }
}
