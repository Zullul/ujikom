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
        Schema::table('absensis', function (Blueprint $table) {
            $table->string('foto_masuk')->nullable()->after('keterangan');
            $table->string('foto_pulang')->nullable()->after('foto_masuk');
            $table->string('foto_izin_sakit')->nullable()->after('foto_pulang');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('absensis', function (Blueprint $table) {
            $table->dropColumn(['foto_masuk', 'foto_pulang', 'foto_izin_sakit']);
        });
    }
};
