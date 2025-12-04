<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('penilaian_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('penilaian_pkl_id')->constrained('penilaian_pkls')->onDelete('cascade');
            $table->foreignId('tujuan_pembelajaran_id')->constrained('tujuan_pembelajarans')->onDelete('cascade');
            $table->unsignedTinyInteger('skor_guru')->nullable();
            $table->unsignedTinyInteger('skor_dudi')->nullable();
            $table->timestamps();

            // Pastikan satu tujuan pembelajaran hanya bisa dinilai sekali per siswa
            $table->unique(['penilaian_pkl_id', 'tujuan_pembelajaran_id'], 'penilaian_tujuan_unique');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('penilaian_details');
    }
};
