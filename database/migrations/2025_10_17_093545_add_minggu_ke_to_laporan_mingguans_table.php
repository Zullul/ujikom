<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('laporan_mingguans', function (Blueprint $table) {
            // Tambahkan kolom ini setelah 'prakerin_siswa_id'
            $table->integer('minggu_ke')->after('prakerin_siswa_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('laporan_mingguans', function (Blueprint $table) {
            $table->dropColumn('minggu_ke');
        });
    }
};
