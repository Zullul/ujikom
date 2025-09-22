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
        Schema::create('dudi_pembimbings', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('dudi_id');
            $table->string('nama_pembimbing');
            $table->timestamp('created_at')->useCurrent();
            $table->timestamp('updated_at')->useCurrentOnUpdate();

            $table->foreign('dudi_id')
                ->references('id')
                ->on('dudis')
                ->onDelete('cascade'); // Jika dudi dihapus, pembimbing juga ikut dihapus
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('dudi_pembimbings');
    }
};
