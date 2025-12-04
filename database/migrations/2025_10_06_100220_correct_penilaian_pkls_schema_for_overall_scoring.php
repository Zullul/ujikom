<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            // Urutan yang Benar:
            // 1. Hapus Foreign Key yang terikat pada index yang mau dihapus.
            $table->dropForeign(['tujuan_pembelajaran_id']);

            // 2. Hapus Unique Index yang lama (yang terdiri dari dua kolom).
            $table->dropUnique('prakerin_tujuan_unique');

            // 3. Buat kolom tujuan_pembelajaran_id menjadi boleh kosong (nullable).
            $table->foreignId('tujuan_pembelajaran_id')->nullable()->change();

            // 4. Tambahkan Unique Constraint yang baru (hanya pada satu kolom).
            // Ini memastikan setiap siswa hanya punya satu baris penilaian.
            $table->unique(['prakerin_siswa_id']);

            // 5. Tambahkan kembali Foreign Key yang tadi dihapus.
            $table->foreign('tujuan_pembelajaran_id')
                ->references('id')
                ->on('tujuan_pembelajarans')
                ->onDelete('set null');

            // Catatan: Kolom-kolom lain seperti skor_guru, skor_dudi, dll.
            // sudah ada dari migrasi pertama Anda yang berhasil (modify_penilaian_pkls_table),
            // jadi tidak perlu ditambahkan lagi di sini.
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            // Logika untuk mengembalikan jika perlu
            $table->dropForeign(['tujuan_pembelajaran_id']);
            $table->dropUnique(['prakerin_siswa_id']);
            $table->unique(['prakerin_siswa_id', 'tujuan_pembelajaran_id'], 'prakerin_tujuan_unique');
            $table->foreign('tujuan_pembelajaran_id')
                ->references('id')
                ->on('tujuan_pembelajarans')
                ->onDelete('set null');
        });
    }
};
