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
        Schema::create('dudis', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sekolah_id');
            $table->string('nama_dudi');
            $table->string('bidang_usaha');
            $table->string('alamat');
            $table->string('pimpinan');
            $table->string('instruktur');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate();

            $table->foreign('sekolah_id')
                ->references('id')
                ->on('sekolahs')
                ->onDelete('cascade'); // Jika sekolah dihapus, dudi juga ikut dihapus
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dudis');
    }
};
