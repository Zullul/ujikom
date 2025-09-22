<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;

class AssignRoleSeeder extends Seeder
{
    public function run(): void
    {
        // Assign role ke user yang sudah ada
        $users = User::all();

        foreach ($users as $user) {
            if ($user->role) {
                $user->assignRole($user->role);
            }
        }
    }
}
