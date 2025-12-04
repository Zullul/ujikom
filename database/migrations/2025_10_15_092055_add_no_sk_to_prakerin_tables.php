<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('prakerins', function (Blueprint $table) {
            $table->string('no_sk')->nullable()->after('keterangan');
        });

        Schema::table('prakerin_siswas', function (Blueprint $table) {
            $table->string('no_sk')->nullable()->after('status');
        });
    }

    public function down(): void
    {
        Schema::table('prakerins', function (Blueprint $table) {
            $table->dropColumn('no_sk');
        });

        Schema::table('prakerin_siswas', function (Blueprint $table) {
            $table->dropColumn('no_sk');
        });
    }
};