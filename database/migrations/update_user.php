<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        // Drop kolom role_type dari users jika ada
        if (Schema::hasColumn('users', 'role_type')) {
            Schema::table('users', function (Blueprint $table) {
                $table->dropColumn('role_type');
            });
        }

        // Update users table
        Schema::table('users', function (Blueprint $table) {
            $table->string('fullname')->nullable()->after('name');
        });

        // Create user_roles table jika belum ada
        if (!Schema::hasTable('user_roles')) {
            Schema::create('user_roles', function (Blueprint $table) {
                $table->id();
                $table->string('role', 100)->unique();
                $table->string('description')->nullable();
                $table->timestamps();
            });
        }

        // Create permissions table jika belum ada
        if (!Schema::hasTable('permissions')) {
            Schema::create('permissions', function (Blueprint $table) {
                $table->id();
                $table->string('code', 150)->unique();
                $table->string('description')->nullable();
                $table->timestamps();
            });
        }

        // Create role_permissions table jika belum ada
        if (!Schema::hasTable('role_permissions')) {
            Schema::create('role_permissions', function (Blueprint $table) {
                $table->id();
                $table->foreignId('role_id')->constrained('user_roles')->onDelete('cascade');
                $table->foreignId('permission_id')->constrained('permissions')->onDelete('cascade');
                $table->timestamps();
                $table->unique(['role_id', 'permission_id']);
            });
        }

        // Tambahkan tabel-tabel yang ada di SQL pertama tapi belum ada
        $this->createMissingTables();
    }

    private function createMissingTables()
    {
        // Absensi table
        if (!Schema::hasTable('absensi')) {
            Schema::create('absensi', function (Blueprint $table) {
                $table->id();
                $table->foreignId('prakerin_id')->constrained('prakerins')->onDelete('cascade');
                $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswa')->onDelete('cascade');
                $table->date('tanggal');
                $table->time('jam_masuk')->nullable();
                $table->time('jam_pulang')->nullable();
                $table->string('status', 45)->nullable();
                $table->string('catatan_harian')->nullable();
                $table->boolean('cek_pembimbing')->default(false);
                $table->date('cek_tgl')->nullable();
                $table->timestamps();
                $table->softDeletes();

                $table->unique(['prakerin_siswa_id', 'tanggal']);
            });
        }

        // Jurnal harian table
        if (!Schema::hasTable('jurnal_harian')) {
            Schema::create('jurnal_harian', function (Blueprint $table) {
                $table->id();
                $table->foreignId('prakerin_id')->constrained('prakerins')->onDelete('cascade');
                $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswa')->onDelete('cascade');
                $table->date('tanggal');
                $table->text('kegiatan')->nullable();
                $table->text('hasil')->nullable();
                $table->text('kendala')->nullable();
                $table->text('tindakan_followup')->nullable();
                $table->enum('status_review', ['pending', 'revisi', 'disetujui'])->default('pending');
                $table->string('reviewer_role', 50)->nullable();
                $table->unsignedBigInteger('reviewer_id')->nullable();
                $table->timestamps();
                $table->softDeletes();

                $table->index(['prakerin_siswa_id', 'tanggal']);
            });
        }

        // Tujuan pembelajaran table
        if (!Schema::hasTable('tujuan_pembelajaran')) {
            Schema::create('tujuan_pembelajaran', function (Blueprint $table) {
                $table->id();
                $table->string('deskripsi');
                $table->foreignId('sekolah_id')->constrained('sekolahs')->onDelete('cascade');
                $table->timestamps();
                $table->softDeletes();
            });
        }

        // Penilaian PKL table
        if (!Schema::hasTable('penilaian_pkl')) {
            Schema::create('penilaian_pkl', function (Blueprint $table) {
                $table->id();
                $table->date('tgl');
                $table->string('skor', 45)->nullable();
                $table->text('keterangan')->nullable();
                $table->enum('ketercapaian', ['Ya', 'Tidak', 'Sebagian'])->default('Sebagian');
                $table->foreignId('prakerin_siswa_id')->constrained('prakerin_siswa')->onDelete('cascade');
                $table->foreignId('tujuan_pembelajaran_id')->nullable()->constrained('tujuan_pembelajaran')->onDelete('set null');
                $table->string('penilai_role', 50)->nullable();
                $table->unsignedBigInteger('penilai_id')->nullable();
                $table->timestamps();
                $table->softDeletes();
            });
        }
    }

    public function down()
    {
        Schema::dropIfExists('penilaian_pkl');
        Schema::dropIfExists('tujuan_pembelajaran');
        Schema::dropIfExists('jurnal_harian');
        Schema::dropIfExists('absensi');
        Schema::dropIfExists('role_permissions');
        Schema::dropIfExists('permissions');
        Schema::dropIfExists('user_roles');
    }
};
