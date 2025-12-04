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
        Schema::table('weekly_reflections', function (Blueprint $table) {
            $table->timestamp('verified_by_guru_at')->nullable()->after('performance_score');
            $table->timestamp('verified_by_dudi_at')->nullable()->after('verified_by_guru_at');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('weekly_reflections', function (Blueprint $table) {
            //
        });
    }
};
