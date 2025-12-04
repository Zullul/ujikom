<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasOne;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class PrakerinSiswa extends Model
{
    use HasFactory , LogsActivity ;

    protected $table = 'prakerin_siswas';

    protected $fillable = [
        'prakerin_id',
        'siswa_id',
        'dudi_id',
        'dudi_pembimbing_id',
        'guru_pembimbing_id',
        'no_sk',
        'status',
        'hari_kerja_per_minggu',
    ];
    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['prakerin_id', 'siswa_id', 'dudi_id', 'dudi_pembimbing_id', 'guru_pembimbing_id', 'no_sk', 'status', 'hari_kerja_per_minggu']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Prakerin Siswa')
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
        return "{$action} data prakerin siswa: {$this->siswa->nama_siswa} (No SK: {$this->no_sk})";
    }

    public function prakerin()
    {
        return $this->belongsTo(Prakerin::class);
    }

    public function penilaianPkl(): HasOne
    {
        return $this->hasOne(PenilaianPkl::class);
    }

    public function siswa()
    {
        return $this->belongsTo(Siswa::class);
    }

    public function dudi()
    {
        return $this->belongsTo(Dudi::class);
    }

    public function dudiPembimbing()
    {
        return $this->belongsTo(DudiPembimbing::class);
    }

    public function guru()
    {
        // Asumsi nama model guru adalah 'Guru'
        return $this->belongsTo(Guru::class, 'guru_pembimbing_id');
    }
    
    // Alias untuk guru pembimbing (untuk konsistensi penamaan)
    public function guruPembimbing()
    {
        return $this->guru();
    }
    
    public function laporanMingguans()
    {
        return $this->hasMany(LaporanMingguan::class);
    }
    public function getGroupingKeyAttribute(): string
    {
        return implode('-', [
            $this->prakerin_id,
            $this->dudi_id,
            $this->guru_pembimbing_id,
            $this->dudi_pembimbing_id,
            $this->no_sk
        ]);
    }
}
