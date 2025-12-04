<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Scopes\TahunAjaranScope;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class Dudi extends Model
{
    use HasFactory , LogsActivity ;

    protected $table = 'dudis';

    protected $guarded = [];
    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['nama_dudi', 'alamat', 'nama_pimpinan', 'no_telp']) // Log atribut ini
            ->logOnlyDirty()
            ->useLogName('Data Dudi')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }
    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'created' => 'membuat', 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data dudi: {$this->nama_dudi} (Pimpinan: {$this->nama_pimpinan})";
    }

    public function tahunAjaran()
    {
        return $this->belongsTo(tahun_ajaran::class);
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    // Relasi ke User
    // Tambahkan method ini ke model Dudi yang sudah ada
    // public function users()
    // {
    //     return $this->hasMany(User::class);
    // }

    // Relasi ke dudi pembimbing
    public function pembimbings()
    {
        return $this->hasMany(DudiPembimbing::class, 'dudi_id');
    }

    // Alias untuk compatibility dengan view
    public function dudiPembimbings()
    {
        return $this->pembimbings();
    }

    // Relasi ke prakerin siswa
    public function prakerinSiswa()
    {
        return $this->hasMany(PrakerinSiswa::class, 'dudi_id');
    }

    // Get siswa yang prakerin di dudi ini
    public function siswaPrakerin()
    {
        return $this->hasManyThrough(
            Siswa::class,
            PrakerinSiswa::class,
            'dudi_id',
            'id',
            'id',
            'siswa_id'
        );
    }

    // Scope untuk dudi yang belum punya user
    public function scopeWithoutUser($query)
    {
        return $query->whereDoesntHave('user');
    }

    protected static function booted(): void
    {
        static::addGlobalScope(new TahunAjaranScope);
    }

    public function user()
    {
        // Ganti 'sekolah_id' menjadi 'ref_id'
        return $this->hasOne(User::class, 'ref_id')->where('role_type', 'dudi');
    }

    // // Helper method untuk membuat username otomatis
    // public function generateUsername()
    // {
    //     return strtolower(str_replace([' ', '.', ',', '-'], '_', $this->nama_dudi));
    // }

    // // Helper method untuk membuat email otomatis
    // public function generateEmail()
    // {
    //     return $this->generateUsername() . '@dudi.com';
    // }
}
