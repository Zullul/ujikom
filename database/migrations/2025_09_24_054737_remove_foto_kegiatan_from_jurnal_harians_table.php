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
        Schema::table('jurnal_harians', function (Blueprint $table) {
            $table->dropColumn('foto_kegiatan');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('jurnal_harians', function (Blueprint $table) {
            $table->string('foto_kegiatan')->nullable()->after('kegiatan');
        });
    }
};
