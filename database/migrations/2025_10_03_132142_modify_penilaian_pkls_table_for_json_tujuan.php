<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            // Hapus foreign key terlebih dahulu
            $table->dropForeign(['tujuan_pembelajaran_id']);

            // Hapus kolom-kolom lama
            $table->dropColumn('tujuan_pembelajaran_id');
            $table->dropColumn('tujuan_pembelajaran_custom');

            // Tambahkan satu kolom JSON baru setelah prakerin_siswa_id
            $table->json('tujuan_pembelajaran_data')->nullable()->after('prakerin_siswa_id');
        });
    }

    public function down(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            $table->dropColumn('tujuan_pembelajaran_data');

            // Kembalikan kolom lama jika migrasi di-rollback
            $table->foreignId('tujuan_pembelajaran_id')->nullable()->constrained('tujuan_pembelajarans')->onDelete('set null');
            $table->text('tujuan_pembelajaran_custom')->nullable();
        });
    }
};
