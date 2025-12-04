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
            // Tambahkan kolom untuk verifikasi DUDI setelah laporan_dudi
            $table->boolean('verifikasi_dudi')->default(false)->after('laporan_dudi');

            // Tambahkan kolom untuk verifikasi Guru setelah laporan_guru
            $table->boolean('verifikasi_guru')->default(false)->after('laporan_guru');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('laporan_mingguans', function (Blueprint $table) {
            $table->dropColumn('verifikasi_dudi');
            $table->dropColumn('verifikasi_guru');
        });
    }
};
