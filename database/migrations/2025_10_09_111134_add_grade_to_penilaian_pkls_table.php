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
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            // Tambahkan kolom untuk grade dari Guru
            $table->string('grade_guru')->nullable()->after('keterangan_guru');

            // Tambahkan kolom untuk grade dari DUDI
            $table->string('grade_dudi')->nullable()->after('keterangan_dudi');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('penilaian_pkls', function (Blueprint $table) {
            //
        });
    }
};
