<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    public function run()
    {
        // Create admin user
        User::create([
            'name' => 'admin',
            'username' => 'admin123',
            'email' => 'admin@admin.com',
            'password' => Hash::make('password'),
            'role' => 0, // admin
            'ref_id' => null,
        ]);
    }
}
