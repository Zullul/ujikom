<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Spatie\Activitylog\Traits\LogsActivity; // <-- Tambahkan
use Spatie\Activitylog\LogOptions;          // <-- Tambahkan

class User extends Authenticatable
{
use HasApiTokens, HasFactory, Notifiable, HasRoles, LogsActivity;

    protected $fillable = [
        'name', 'email', 'password', 'username', 'role_id',
        'ref_id', 'sekolah_id', 'role_type',
    ];
    protected $hidden = [ 'password', 'remember_token', ];
    protected $casts = [ 'email_verified_at' => 'datetime', 'password' => 'hashed', ];

    // --- Tambahkan method getActivitylogOptions ---
    public function getActivitylogOptions(): LogOptions
    {
        return LogOptions::defaults()
            ->logOnly(['username']) // Hanya log perubahan username
            // TIDAK log password untuk keamanan
            ->logOnlyDirty()
            ->useLogName('Akun Pengguna')
            ->setDescriptionForEvent(fn(string $eventName) => $this->generateLogDescription($eventName))
            ->dontSubmitEmptyLogs();
    }

    public function generateLogDescription(string $eventName): string
    {
        $action = match($eventName) { 'updated' => 'memperbarui', 'deleted' => 'menghapus', default => 'melakukan aksi pada' };
        return "{$action} data akun pengguna: {$this->name} (Username: {$this->username})";
    }

    // Relasi ke model lain berdasarkan role
    public function siswa()
    {
        return $this->belongsTo(Siswa::class, 'ref_id')->where('role_id', 1);
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class, 'ref_id')->where('role_id', 2);
    }

    public function dudi()
    {
        return $this->belongsTo(Dudi::class, 'ref_id')->where('role_id', 3);
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }
    public function dudiPembimbing()
    {
        // Menghubungkan User ke Dudi Pembimbing melalui ref_id
        return $this->belongsTo(DudiPembimbing::class, 'ref_id');
    }

    // Method untuk mengecek role berdasarkan tabel akses
    public function isSuperAdmin(): bool
    {
        return $this->role_type === 'super_admin' || $this->hasRole('super_admin');
    }

    public function isAdminSekolah(): bool
    {
        return $this->role_type === 'admin_sekolah' || $this->hasRole('admin_sekolah');
    }

    public function isGuruPembimbing(): bool
    {
        return $this->role_type === 'guru' || $this->hasRole('guru');
    }

    public function isDudiPembimbing(): bool
    {
        return $this->role_type === 'dudi_pembimbing' || $this->hasRole('dudi_pembimbing');
    }

    public function isDudi(): bool
    {
        return $this->role_type === 'dudi' || $this->hasRole('dudi');
    }

    public function isSiswa(): bool
    {
        return $this->role_type === 'siswa' || $this->hasRole('siswa');
    }



    // Legacy methods untuk backward compatibility
    public function isAdmin(): bool
    {
        return $this->isSuperAdmin() || $this->isAdminSekolah();
    }

    public function isGuru(): bool
    {
        return $this->isGuruPembimbing();
    }

    // Method removed to avoid duplication with isDudiPembimbing() defined above

    public function isAdminPusat(): bool
    {
        return $this->isSuperAdmin();
    }

    // Method untuk cek akses berdasarkan tabel
    public function canAccessKelola($feature): bool
    {
        $permissions = [
            'sekolah' => [
                'super_admin' => true,
                'admin_sekolah' => false,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => false,
                'siswa' => false,
            ],
            'guru_siswa' => [
                'super_admin' => true,
                'admin_sekolah' => true,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => false,
                'siswa' => false,
            ],
            'kelas_tahun_ajaran' => [
                'super_admin' => true,
                'admin_sekolah' => true,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => false,
                'siswa' => false,
            ],
            'dudi_pembimbing' => [
                'super_admin' => true,
                'admin_sekolah' => true,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => false,
                'siswa' => false,
            ],
            'laporan_jurnal' => [
                'super_admin' => true,
                'admin_sekolah' => true,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => true,
                'siswa' => false,
            ],
            'laporan_penilaian' => [
                'super_admin' => true,
                'admin_sekolah' => true,
                'guru_pembimbing' => true,
                'dudi_pembimbing' => false,
                'siswa' => false,
            ],
            'validasi_laporan_jurnal' => [
                'super_admin' => true,
                'admin_sekolah' => false,
                'guru_pembimbing' => true,
                'dudi_pembimbing' => true,
                'siswa' => false,
            ],
            'penilaian_pkl' => [
                'super_admin' => true,
                'admin_sekolah' => false,
                'guru_pembimbing' => false,
                'dudi_pembimbing' => true,
                'siswa' => false,
            ]
        ];

        return $permissions[$feature][$this->role_type] ?? false;
    }

    public function canAccessCRUD($feature, $action = 'read'): bool
    {
        // Implementasi akses CRUD berdasarkan tabel bagian bawah
        $crudPermissions = [
            'manajemen_sekolah' => [
                'super_admin' => ['create', 'update', 'delete'],
                'admin_sekolah' => [],
                'guru_pembimbing' => [],
                'dudi_pembimbing' => [],
                'siswa' => [],
            ],
            'manajemen_user' => [
                'super_admin' => [],
                'admin_sekolah' => ['create', 'update', 'delete'],
                'guru_pembimbing' => [],
                'dudi_pembimbing' => [],
                'siswa' => [],
            ],
            'guru' => [
                'super_admin' => [],
                'admin_sekolah' => ['create', 'update', 'delete'],
                'guru_pembimbing' => [],
                'dudi_pembimbing' => [],
                'siswa' => [],
            ],
            'siswa' => [
                'super_admin' => [],
                'admin_sekolah' => ['create', 'update', 'delete'],
                'guru_pembimbing' => [],
                'dudi_pembimbing' => [],
                'siswa' => [],
            ]
        ];

        $allowedActions = $crudPermissions[$feature][$this->role_type] ?? [];
        return in_array($action, $allowedActions);
    }

    // Override method untuk login dengan username
    public function findForPassport($username)
    {
        return $this->where('username', $username)->first();
    }

    // Method untuk mendapatkan nama berdasarkan role
    public function getDisplayNameAttribute()
    {
        return match ($this->role_id) {
            1 => $this->siswa?->nama_siswa ?? $this->name,
            2 => $this->guru?->nama_guru ?? $this->name,
            3 => $this->dudi?->nama_dudi ?? $this->name,
            default => $this->name
        };
    }
}
