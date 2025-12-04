<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan


class Prakerin extends Model
{
    use HasFactory , LogsActivity ;

    protected $table = 'prakerins';

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'ketua',
        'sekretaris',
        'tanggal_mulai',
        'tanggal_selesai',
        'keterangan',
        'sekolah_id',
        'tahun_ajaran_id',
        'no_sk', // Tambahkan kolom no_sk ke dalam fillable
        // 'created_by' // Kolom ini tidak ada di tabel Anda, jadi kita hapus
    ];
    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['ketua', 'sekretaris', 'tanggal_mulai', 'tanggal_selesai', 'keterangan', 'sekolah_id', 'tahun_ajaran_id', 'no_sk']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Prakerin')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }

    /**
     * Generate a log description for the given event.
     *
     * @param  string  $eventName
     * @return string
     */
    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) {
            'created' => 'membuat',
            'updated' => 'memperbarui',
            'deleted' => 'menghapus',
            default => 'melakukan aksi pada'
        };
        return "{$action} data prakerin: {$this->ketua} ({$this->tahunAjaran->tahun_ajaran})";
    }

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'tanggal_mulai' => 'datetime', // Diubah menjadi datetime sesuai tipe kolom timestamp
        'tanggal_selesai' => 'datetime',
    ];
    
    /**
     * The accessors to append to the model's array form.
     *
     * @var array
     */
    protected $appends = ['nama_prakerin'];

    public function scopeWhereTahunAjaran($query, $tahunAjaranId)
    {
        return $query->where('tahun_ajaran_id', $tahunAjaranId);
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class);
    }
    public function laporanMingguans()
    {
        return $this->hasMany(LaporanMingguan::class);
    }
    
    public function getNamaProgramDanTahunAttribute(): string
    {
        return "{$this->ketua} ({$this->tahunAjaran->tahun_ajaran})";
    }
    
    /**
     * Accessor untuk nama prakerin yang lebih informatif
     * Digunakan di filter dropdown
     */
    public function getNamaPrakerinAttribute(): string
    {
        $tanggalMulai = $this->tanggal_mulai->format('M Y');
        $tanggalSelesai = $this->tanggal_selesai->format('M Y');
        return "{$this->keterangan} ({$tanggalMulai} - {$tanggalSelesai})";
    }
}
