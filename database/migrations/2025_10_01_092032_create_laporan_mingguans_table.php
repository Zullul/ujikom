<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::create('laporan_mingguans', function (Blueprint $table) {
            $table->id();
            $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswas')->onDelete('cascade');
            $table->foreignId('siswa_id')->constrained('siswas')->onDelete('cascade');
            $table->date('tanggal_mulai_minggu'); // Senin di minggu laporan
            $table->date('tanggal_selesai_minggu'); // Jumat/Minggu di minggu laporan
            $table->text('laporan_guru')->nullable();
            $table->text('laporan_dudi')->nullable();
            $table->timestamps();
            $table->unique(['prakerin_siswa_id', 'tanggal_mulai_minggu']);
        });
    }
    public function down(): void
    {
        Schema::dropIfExists('laporan_mingguans');
    }
};
