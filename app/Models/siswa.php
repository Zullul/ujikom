<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\TahunAjaranScope;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class Siswa extends Model
{
// <-- Tambahkan LogsActivity
    use HasFactory, LogsActivity;

    protected $table = 'siswas';
    protected $guarded = [];

    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_siswa', 'nis', 'jenis_kelamin', 'kelas_id', 'status']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Siswa')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }

    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'created' => 'membuat', 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data siswa: {$this->nama_siswa} (NIS: {$this->nis})";
    }

    // Relasi ke kelas
    public function kelas()
    {
        return $this->belongsTo(Kelas::class);
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 1);
    }

    // Relasi ke orangtua (parent)
    public function orangtua()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_type', 'orangtua');
    }

    // Relasi ke prakerin siswa
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'siswa_id');
    }

    // Get guru pembimbing dari prakerin aktif
    public function guruPembimbing()
    {
        return $this->hasManyThrough(
            Guru::class,
            PrakerinSiswa::class,
            'siswa_id', // Foreign key on prakerin_siswa table
            'id', // Foreign key on guru table
            'id', // Local key on siswa table
            'guru_id' // Local key on prakerin_siswa table
        );
    }

    // Get dudi dari prakerin aktif
    public function dudi()
    {
        return $this->hasManyThrough(
            Dudi::class,
            PrakerinSiswa::class,
            'siswa_id',
            'id',
            'id',
            'dudi_id'
        );
    }

    // Scope untuk siswa yang belum punya user
    public function scopeWithoutUser($query)
    {
        return $query->whereDoesntHave('user');
    }

    protected static function booted(): void
    {
        static::addGlobalScope(new TahunAjaranScope);
    }

    // Helper method untuk membuat username otomatis
    public function generateUsername()
    {
        return strtolower($this->nis);
    }

    // Helper method untuk membuat email otomatis
    public function generateEmail()
    {
        return strtolower($this->nis) . '@siswa.com';
    }
}
