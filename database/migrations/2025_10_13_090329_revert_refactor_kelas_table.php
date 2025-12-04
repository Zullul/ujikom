<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    public function up(): void
    {
        // Gabungkan kembali 'tingkat' dan 'nama_kelas'
        // Pastikan tidak ada data kelas yang tingkat-nya null sebelum menjalankan ini
        DB::statement("UPDATE kelas SET nama_kelas = CONCAT(tingkat, ' ', nama_kelas) WHERE tingkat IS NOT NULL");

        // Setelah data digabung, hapus kolom 'tingkat'
        Schema::table('kelas', function (Blueprint $table) {
            $table->dropColumn('tingkat');
        });
    }

    public function down(): void
    {
        // Jika perlu dibatalkan lagi, kita bisa tambahkan kolom tingkat kembali
        Schema::table('kelas', function (Blueprint $table) {
            $table->integer('tingkat')->after('id')->nullable();
        });
    }
};
