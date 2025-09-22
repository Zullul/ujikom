<?php
// database/migrations/add_role_type_to_users_table.php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->enum('role_type', ['admin_pusat', 'admin_sekolah', 'guru', 'siswa'])
                ->default('siswa')
                ->after('email');
            $table->foreignId('sekolah_id')
                ->nullable()
                ->after('role_type')
                ->constrained('sekolahs')
                ->onDelete('cascade');
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['role_type', 'sekolah_id']);
        });
    }
};
