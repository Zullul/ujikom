<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('penilaian_pkls', function (Blueprint $table) {
            $table->id();
            $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswas')->onDelete('cascade');
            $table->foreignId('tujuan_pembelajaran_id')->nullable()->constrained('tujuan_pembelajarans')->onDelete('set null');
            $table->text('tujuan_pembelajaran_custom')->nullable();
            $table->integer('skor');
            $table->enum('ketercapaian', ['tercapai', 'tidak tercapai']);
            $table->text('keterangan')->nullable();
            $table->string('penilai_role'); // 'guru' atau 'dudi_pembimbing'
            $table->unsignedBigInteger('penilai_id');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('penilaian_pkls');
    }
};