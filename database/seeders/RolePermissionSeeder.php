<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\UserRole;
use App\Models\Permission;
use Illuminate\Support\Facades\DB;

class RolePermissionSeeder extends Seeder
{
    public function run()
    {
        // Create Roles
        $roles = [
            ['role' => 'super_admin', 'description' => 'Pemilik SaaS, manage tenants/sekolah & monitoring'],
            ['role' => 'admin_sekolah', 'description' => 'Admin internal sekolah - manage master data'],
            ['role' => 'guru_pembimbing', 'description' => 'Guru pembimbing PKL'],
            ['role' => 'dudi_pembimbing', 'description' => 'Pembimbing dari DU/DI'],
            ['role' => 'siswa', 'description' => 'Siswa peserta PKL'],
        ];

        foreach ($roles as $role) {
            UserRole::create($role);
        }

        // Create Permissions
        $permissions = [
            ['code' => 'sekolah.create', 'description' => 'Buat sekolah'],
            ['code' => 'sekolah.read', 'description' => 'Lihat sekolah'],
            ['code' => 'sekolah.update', 'description' => 'Update sekolah'],
            ['code' => 'users.create', 'description' => 'Buat user'],
            ['code' => 'users.update', 'description' => 'Update user'],
            ['code' => 'guru.manage', 'description' => 'Manage data guru'],
            ['code' => 'siswa.manage', 'description' => 'Manage data siswa'],
            ['code' => 'prakerin.create', 'description' => 'Buat prakerin'],
            ['code' => 'prakerin.read', 'description' => 'Lihat prakerin'],
            ['code' => 'prakerin.assign', 'description' => 'Assign siswa ke prakerin'],
            ['code' => 'absensi.create', 'description' => 'Input absensi'],
            ['code' => 'absensi.read', 'description' => 'Lihat absensi'],
            ['code' => 'jurnal.create', 'description' => 'Isi jurnal harian'],
            ['code' => 'jurnal.review', 'description' => 'Review jurnal harian'],
            ['code' => 'laporan.create', 'description' => 'Isi laporan mingguan'],
            ['code' => 'laporan.review', 'description' => 'Review laporan mingguan'],
            ['code' => 'penilaian.create', 'description' => 'Input penilaian'],
            ['code' => 'monitoring.read', 'description' => 'Lihat monitoring lintas sekolah'],
        ];

        foreach ($permissions as $permission) {
            Permission::create($permission);
        }

        // Assign permissions to roles
        $this->assignPermissions();
    }

    private function assignPermissions()
    {
        $superAdmin = UserRole::where('role', 'super_admin')->first();
        $adminSekolah = UserRole::where('role', 'admin_sekolah')->first();
        $guruPembimbing = UserRole::where('role', 'guru_pembimbing')->first();
        $dudiPembimbing = UserRole::where('role', 'dudi_pembimbing')->first();
        $siswa = UserRole::where('role', 'siswa')->first();

        // Super admin gets all permissions
        $allPermissions = Permission::all();
        $superAdmin->permissions()->attach($allPermissions->pluck('id'));

        // Admin sekolah permissions
        $adminPermissions = Permission::whereIn('code', [
            'sekolah.read',
            'users.create',
            'users.update',
            'guru.manage',
            'siswa.manage',
            'prakerin.create',
            'prakerin.read',
            'prakerin.assign',
            'monitoring.read'
        ])->pluck('id');
        $adminSekolah->permissions()->attach($adminPermissions);

        // Guru pembimbing permissions
        $guruPermissions = Permission::whereIn('code', [
            'absensi.read',
            'absensi.create',
            'jurnal.review',
            'laporan.review',
            'penilaian.create'
        ])->pluck('id');
        $guruPembimbing->permissions()->attach($guruPermissions);

        // Dudi pembimbing permissions
        $dudiPermissions = Permission::whereIn('code', [
            'absensi.read',
            'jurnal.review',
            'laporan.review',
            'penilaian.create'
        ])->pluck('id');
        $dudiPembimbing->permissions()->attach($dudiPermissions);

        // Siswa permissions
        $siswaPermissions = Permission::whereIn('code', [
            'jurnal.create',
            'laporan.create',
            'absensi.read'
        ])->pluck('id');
        $siswa->permissions()->attach($siswaPermissions);
    }
}
