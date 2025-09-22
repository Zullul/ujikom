<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, HasRoles;

    protected $fillable = [
        'name',
        'email',
        'password',
        'username',
        'fullname',
        'role_id', // Reference ke user_roles table
        'ref_id', // id dari tabel siswa, guru, dudi_pembimbing
        'sekolah_id',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

    // Relasi ke user_roles (sesuai dengan SQL pertama)
    public function userRole()
    {
        return $this->belongsTo(UserRole::class, 'role_id');
    }

    // Relasi ke model lain berdasarkan role
    public function siswa()
    {
        return $this->belongsTo(Siswa::class, 'ref_id')
            ->whereHas('userRole', function ($query) {
                $query->where('role', 'siswa');
            });
    }

    public function guru()
    {
        return $this->belongsTo(Guru::class, 'ref_id')
            ->whereHas('userRole', function ($query) {
                $query->where('role', 'guru_pembimbing');
            });
    }

    public function dudiPembimbing()
    {
        return $this->belongsTo(dudi_pembimbing::class, 'ref_id')
            ->whereHas('userRole', function ($query) {
                $query->where('role', 'dudi_pembimbing');
            });
    }

    public function sekolah()
    {
        return $this->belongsTo(Sekolah::class);
    }

    // Method untuk mengecek role (sesuai dengan SQL pertama)
    public function isSuperAdmin(): bool
    {
        return $this->userRole?->role === 'super_admin';
    }

    public function isAdminSekolah(): bool
    {
        return $this->userRole?->role === 'admin_sekolah';
    }

    public function isGuruPembimbing(): bool
    {
        return $this->userRole?->role === 'guru_pembimbing';
    }

    public function isDudiPembimbing(): bool
    {
        return $this->userRole?->role === 'dudi_pembimbing';
    }

    public function isSiswa(): bool
    {
        return $this->userRole?->role === 'siswa';
    }

    // Backward compatibility
    public function isAdmin(): bool
    {
        return $this->isSuperAdmin();
    }

    public function isAdminPusat(): bool
    {
        return $this->isSuperAdmin();
    }

    public function isGuru(): bool
    {
        return $this->isGuruPembimbing();
    }

    public function isDudi(): bool
    {
        return $this->isDudiPembimbing();
    }
}
