<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            // Hapus kolom JSON jika ada
            if (Schema::hasColumn('penilaian_pkls', 'tujuan_pembelajaran_data')) {
                $table->dropColumn('tujuan_pembelajaran_data');
            }

            // Tambahkan kembali kolom-kolom yang benar
            $table->foreignId('tujuan_pembelajaran_id')->nullable()->after('prakerin_siswa_id')->constrained('tujuan_pembelajarans')->onDelete('set null');
            $table->text('tujuan_pembelajaran_custom')->nullable()->after('tujuan_pembelajaran_id');
        });
    }

    public function down(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            $table->dropForeign(['tujuan_pembelajaran_id']);
            $table->dropColumn('tujuan_pembelajaran_id');
            $table->dropColumn('tujuan_pembelajaran_custom');
            $table->json('tujuan_pembelajaran_data')->nullable();
        });
    }
};
