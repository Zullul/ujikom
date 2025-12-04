<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('weekly_reflections', function (Blueprint $table) {
            $table->id();

            // Kunci asing ke tabel siswa
            $table->foreignId('student_id')->constrained('users')->onDelete('cascade');

            // Kunci asing ke tabel pembimbing
            $table->foreignId('pembimbing_id')->constrained('users')->onDelete('cascade');

            $table->integer('week_number'); // Minggu ke-
            $table->date('start_date');     // Tanggal mulai minggu
            $table->date('end_date');       // Tanggal akhir minggu
            $table->text('reflection_text'); // Isi refleksi

            // Kolom opsional, bisa dihapus jika tidak perlu
            $table->tinyInteger('discipline_score')->nullable();
            $table->tinyInteger('performance_score')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('weekly_reflections');
    }
};
