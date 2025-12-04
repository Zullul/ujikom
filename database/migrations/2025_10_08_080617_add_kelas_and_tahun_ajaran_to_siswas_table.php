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
        Schema::table('siswas', function (Blueprint $table) {
            // Tambahkan kolom untuk foreign key ke tabel kelas
            $table->foreignId('kelas_id')
                ->nullable()
                ->after('sekolah_id')
                ->constrained('kelas')
                ->onDelete('set null');

            // Tambahkan kolom untuk foreign key ke tabel tahun_ajaran
            $table->foreignId('tahun_ajaran_id')
                ->nullable()
                ->after('kelas_id')
                ->constrained('tahun_ajarans')
                ->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('siswas', function (Blueprint $table) {
            //
        });
    }
};
