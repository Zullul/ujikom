<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\TahunAjaranScope;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class Guru extends Model
{
    use HasFactory , LogsActivity;

    protected $table = 'gurus';

    protected $guarded = [];

    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_guru', 'nip', 'jenis_kelamin', 'mata_pelajaran']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Guru')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }
    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'created' => 'membuat', 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data guru: {$this->nama_guru} (NIP: {$this->nip})";
    }
    
    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    // Tambahkan method ini ke model Guru yang sudah ada
    public function user()
    {
        return $this->hasOne(User::class, 'ref_id')->where('role_id', 2);
    }

    // Relasi ke prakerin siswa (sebagai pembimbing)
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'guru_id');
    }

    // Get siswa yang dibimbing
    public function siswaBimbingan()
    {
        return $this->hasManyThrough(
            Siswa::class,
            PrakerinSiswa::class,
            'guru_id',
            'id',
            'id',
            'siswa_id'
        );
    }

    // Scope untuk guru yang belum punya user
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
        return strtolower($this->nip);
    }

    // Helper method untuk membuat email otomatis
    public function generateEmail()
    {
        return strtolower($this->nip) . '@guru.com';
    }
}
