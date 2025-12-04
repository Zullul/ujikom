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
        // Hapus tabel jika sudah ada untuk memastikan kita memulai dari awal
        Schema::dropIfExists('penilaian_pkls');

        // Buat kembali tabel dengan skema yang benar
        Schema::create('penilaian_pkls', function (Blueprint $table) {
            $table->id();

            // Kunci utama yang menghubungkan ke siswa
            $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswas')->onDelete('cascade');

            // Pastikan setiap siswa hanya punya satu baris penilaian
            $table->unique('prakerin_siswa_id');

            // Kolom untuk penilaian dari Guru
            $table->integer('skor_guru')->nullable();
            $table->text('keterangan_guru')->nullable();
            $table->foreignId('dinilai_oleh_guru_id')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamp('tanggal_dinilai_guru')->nullable();

            // Kolom untuk penilaian dari DUDI
            $table->integer('skor_dudi')->nullable();
            $table->text('keterangan_dudi')->nullable();
            $table->foreignId('dinilai_oleh_dudi_id')->nullable()->constrained('users')->onDelete('set null');
            $table->timestamp('tanggal_dinilai_dudi')->nullable();

            // Timestamps standar
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down(): void
    {
        Schema::dropIfExists('penilaian_pkls');
    }
};
