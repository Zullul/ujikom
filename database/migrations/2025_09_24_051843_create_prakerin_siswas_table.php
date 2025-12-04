<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('prakerin_siswas', function (Blueprint $table) {
            $table->id();
            $table->foreignId('prakerin_id')->constrained('prakerins')->onDelete('cascade');
            $table->foreignId('siswa_id')->unique()->constrained('siswas')->onDelete('cascade'); // Siswa hanya bisa ditempatkan sekali
            $table->foreignId('dudi_id')->constrained('dudis')->onDelete('cascade');
            $table->foreignId('dudi_pembimbing_id')->constrained('dudi_pembimbings')->onDelete('cascade');
            $table->foreignId('guru_pembimbing_id')->constrained('gurus')->onDelete('cascade');
            $table->enum('status', ['berjalan', 'selesai', 'dibatalkan'])->default('berjalan');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('prakerin_siswas');
    }
};
