<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class PermissionSeeder extends Seeder
{
    public function run()
    {
        // Reset cached roles and permissions
        app()[\Spatie\Permission\PermissionRegistrar::class]->forgetCachedPermissions();

        // --- UBAH BAGIAN INI ---
        // Create roles
        $superAdmin = Role::updateOrCreate(['name' => 'super_admin'], ['guard_name' => 'web']);
        $adminSekolah = Role::updateOrCreate(['name' => 'admin_sekolah'], ['guard_name' => 'web']);
        $guru = Role::updateOrCreate(['name' => 'guru'], ['guard_name' => 'web']);
        $dudi = Role::updateOrCreate(['name' => 'dudi'], ['guard_name' => 'web']);
        $siswa = Role::updateOrCreate(['name' => 'siswa'], ['guard_name' => 'web']);

        // Create permissions
        $permissions = [
            'kelola_sekolah',
            'kelola_guru_siswa',
            'kelola_kelas_tahun_ajaran',
            'kelola_dudi_pembimbing',
            'kelola_laporan_jurnal',
            'kelola_laporan_penilaian',
            'validasi_laporan_jurnal',
            'penilaian_pkl',
            'monitoring_reporting',
            'crud_sekolah',
            'crud_user',
            'crud_guru',
            'crud_siswa',
        ];

        foreach ($permissions as $permission) {
            // Gunakan updateOrCreate juga untuk permission
            Permission::updateOrCreate(['name' => $permission], ['guard_name' => 'web']);
        }
        // --- AKHIR PERUBAHAN ---


        // Assign permissions to roles
        $superAdmin->givePermissionTo([
            'kelola_sekolah',
            'kelola_guru_siswa',
            'kelola_kelas_tahun_ajaran',
            'kelola_dudi_pembimbing',
            'kelola_laporan_jurnal',
            'kelola_laporan_penilaian',
            'validasi_laporan_jurnal',
            'penilaian_pkl',
            'monitoring_reporting',
            'crud_sekolah'
        ]);

        $adminSekolah->givePermissionTo([
            'kelola_guru_siswa',
            'kelola_kelas_tahun_ajaran',
            'kelola_dudi_pembimbing',
            'kelola_laporan_jurnal',
            'kelola_laporan_penilaian',
            'crud_user',
            'crud_guru',
            'crud_siswa'
        ]);

        $guru->givePermissionTo([
            'kelola_laporan_penilaian',
            'validasi_laporan_jurnal'
        ]);

        $dudi->givePermissionTo([
            'kelola_laporan_jurnal',
            'validasi_laporan_jurnal',
            'penilaian_pkl'
        ]);
    }
}
