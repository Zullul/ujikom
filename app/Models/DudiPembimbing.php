<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\TahunAjaranScope;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

// Nama kelas diubah menjadi PascalCase
class DudiPembimbing extends Model
{
    use HasFactory , LogsActivity ;

    // Nama tabel di database tetap sama
    protected $table = 'dudi_pembimbings';
    protected $guarded = [];

    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_pembimbing', 'jabatan', 'dudi_id']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Dudi Pembimbing')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }
    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'created' => 'membuat', 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data dudi pembimbing: {$this->nama_pembimbing} (Dudi ID: {$this->dudi_id})";
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function dudi()
    {
        return $this->belongsTo(Dudi::class);
    }

    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_type', 'dudi_pembimbing');
    }

    protected static function booted(): void
    {
        static::addGlobalScope(new TahunAjaranScope);
    }
}
