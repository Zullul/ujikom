<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UpdateExistingUserSeeder extends Seeder
{
    public function run()
    {
        // Update user admin yang sudah ada
        DB::table('users')
            ->where('email', 'delia@admin.com')
            ->update([
                'role_id' => 0, // Admin role
                'ref_id' => null, // Admin tidak perlu ref_id
                'updated_at' => now()
            ]);

        echo "User admin berhasil diupdate!\n";
    }
}
