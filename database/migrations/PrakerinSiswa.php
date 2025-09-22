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
        Schema::create('prakerin_siswa', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('prakerin_id');
            $table->unsignedBigInteger('siswa_id');
            $table->unsignedBigInteger('guru_id');
            $table->unsignedBigInteger('dudi_id');
            $table->string('nama_siswa');
            $table->string('nis')->unique();
            $table->string('tempat_lahir');
            $table->date('tanggal_lahir');
            $table->string('alamat');
            $table->string('kontak');
            $table->unsignedBigInteger('dudi_pembimbing_id');
            $table->timestamps();

            $table->foreign('prakerin_id')->references('id')->on('prakerins')->onDelete('cascade');
            $table->foreign('siswa_id')->references('id')->on('siswas')->onDelete('cascade');
            $table->foreign('guru_id')->references('id')->on('gurus')->onDelete('cascade');
            $table->foreign('dudi_id')->references('id')->on('dudis')->onDelete('cascade');
            $table->foreign('dudi_pembimbing_id')->references('id')->on('dudi_pembimbings')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('prakerin_siswa');
    }
};
