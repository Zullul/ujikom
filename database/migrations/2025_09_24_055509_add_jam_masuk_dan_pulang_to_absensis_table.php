<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB; // <-- Tambahkan ini

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('absensis', function (Blueprint $table) {
            $table->time('jam_masuk')->nullable()->after('tanggal');
            $table->time('jam_pulang')->nullable()->after('jam_masuk');
        });

        // Ubah kolom status_kehadiran agar bisa NULL menggunakan DB::statement
        DB::statement("ALTER TABLE absensis MODIFY COLUMN status_kehadiran ENUM('hadir', 'sakit', 'izin', 'alpa') NULL");
    }

    public function down(): void
    {
        Schema::table('absensis', function (Blueprint $table) {
            $table->dropColumn(['jam_masuk', 'jam_pulang']);
        });

        // Kembalikan kolom status_kehadiran ke NOT NULL jika migrasi di-rollback
        DB::statement("ALTER TABLE absensis MODIFY COLUMN status_kehadiran ENUM('hadir', 'sakit', 'izin', 'alpa') NOT NULL");
    }
};
