<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\UserRole;

class UserRoleSeeder extends Seeder
{
    public function run(): void
    {
        $roles = [
            ['id' => 0, 'role_name' => 'Administrator'],
            ['id' => 1, 'role_name' => 'Siswa'],
            ['id' => 2, 'role_name' => 'Guru'],
            ['id' => 3, 'role_name' => 'Dudi Pembimbing'],
        ];

        foreach ($roles as $role) {
            UserRole::updateOrCreate(
                ['id' => $role['id']],
                ['role_name' => $role['role_name']]
            );
        }
    }
}
