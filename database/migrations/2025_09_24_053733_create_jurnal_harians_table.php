<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('jurnal_harians', function (Blueprint $table) {
            $table->id();
            $table->foreignId('siswa_id')->constrained('siswas')->onDelete('cascade');
            $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswas')->onDelete('cascade');
            $table->date('tanggal');
            $table->text('kegiatan');
            $table->string('foto_kegiatan')->nullable();

            $table->boolean('diverifikasi_pembimbing_dudi')->default(false);
            $table->text('catatan_pembimbing_dudi')->nullable();

            $table->boolean('diverifikasi_guru_pembimbing')->default(false);
            $table->text('catatan_guru_pembimbing')->nullable();

            $table->timestamps();

            // Siswa hanya bisa mengisi satu jurnal per hari
            $table->unique(['siswa_id', 'tanggal']);
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('jurnal_harians');
    }
};
