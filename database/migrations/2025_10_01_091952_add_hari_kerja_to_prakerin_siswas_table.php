<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        Schema::table('prakerin_siswas', function (Blueprint $table) {
            $table->tinyInteger('hari_kerja_per_minggu')->default(5)->after('status');
        });
    }
    public function down(): void
    {
        Schema::table('prakerin_siswas', function (Blueprint $table) {
            $table->dropColumn('hari_kerja_per_minggu');
        });
    }
};
