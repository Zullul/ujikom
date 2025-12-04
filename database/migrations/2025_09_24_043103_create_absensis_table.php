<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('absensis', function (Blueprint $table) {
            $table->id();
            $table->foreignId('siswa_id')->constrained('siswas')->onDelete('cascade');
            $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswas')->onDelete('cascade');
            $table->date('tanggal');
            $table->enum('status_kehadiran', ['hadir', 'sakit', 'izin', 'alpa']);
            $table->string('keterangan')->nullable();
            $table->boolean('diverifikasi_pembimbing_dudi')->default(false);
            $table->timestamps();

            // Mencegah siswa absen lebih dari sekali di hari yang sama
            $table->unique(['siswa_id', 'tanggal']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('absensis');
    }
};
