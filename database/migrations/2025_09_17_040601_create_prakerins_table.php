<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('prakerins', function (Blueprint $table) {
            $table->id();
            $table->string('ketua');
            $table->string('sekretaris');
            $table->timestamp('tanggal_mulai');
            $table->timestamp('tanggal_selesai');
            $table->string('keterangan');
            $table->foreignId('sekolah_id')->constrained()->onDelete('cascade');
            $table->foreignId('tahun_ajaran_id')->constrained()->onDelete('cascade');
            $table->string('tahun_ajaran');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('prakerins');
    }
};
