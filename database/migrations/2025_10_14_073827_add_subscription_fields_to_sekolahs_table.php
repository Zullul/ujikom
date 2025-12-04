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
        Schema::table('sekolahs', function (Blueprint $table) {
            $table->date('masa_aktif_mulai')->nullable()->after('status_sekolah');
            $table->date('masa_aktif_selesai')->nullable()->after('masa_aktif_mulai');
            $table->boolean('is_aktif')->default(true)->after('masa_aktif_selesai');
            $table->integer('batas_akun')->default(50)->after('is_aktif');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('sekolahs', function (Blueprint $table) {
            $table->dropColumn('masa_aktif_mulai');
            $table->dropColumn('masa_aktif_selesai');
            $table->dropColumn('is_aktif');
            $table->dropColumn('batas_akun');
        });
    }
};
