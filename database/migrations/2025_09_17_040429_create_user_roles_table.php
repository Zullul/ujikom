<?php

use Illuminate\Database\Migrations\Migration;
use App\Models\User;

return new class extends Migration
{
    public function up()
    {
        // Update user dengan role_id 0 agar role_type juga admin
        User::where('role_id', '0')->update(['role_type' => 'admin']);
        User::where('role_id', '1')->update(['role_type' => 'siswa']);
        User::where('role_id', '2')->update(['role_type' => 'guru']);
        User::where('role_id', '3')->update(['role_type' => 'dudi']);
    }

    public function down()
    {
        // Rollback if needed
    }
};
