<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('kelas', function (Blueprint $table) {
            $table->integer('tingkat')->after('id')->nullable();
        });

        // Jalankan migrasi data setelah kolom dibuat
        DB::statement("UPDATE kelas SET tingkat = 12, nama_kelas = TRIM(REPLACE(nama_kelas, '12', '')) WHERE nama_kelas LIKE '12 %'");
        DB::statement("UPDATE kelas SET tingkat = 11, nama_kelas = TRIM(REPLACE(nama_kelas, '11', '')) WHERE nama_kelas LIKE '11 %'");
        DB::statement("UPDATE kelas SET tingkat = 10, nama_kelas = TRIM(REPLACE(nama_kelas, '10', '')) WHERE nama_kelas LIKE '10 %'");

        // Fallback untuk data yang mungkin tidak punya spasi, cth: '12PF'
        DB::statement("UPDATE kelas SET tingkat = 12, nama_kelas = TRIM(REPLACE(nama_kelas, '12', '')) WHERE nama_kelas LIKE '12%' AND tingkat IS NULL");
    }

    public function down(): void
    {
        Schema::table('kelas', function (Blueprint $table) {
            $table->dropColumn('tingkat');
        });
    }
};
