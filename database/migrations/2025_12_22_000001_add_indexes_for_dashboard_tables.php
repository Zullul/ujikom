<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
        // Tambah index untuk kolom yang sering difilter di dashboard
        Schema::table('siswas', function (Blueprint $table) {
            if (! $this->hasIndex('siswas', 'siswas_sekolah_id_index')) {
                $table->index('sekolah_id', 'siswas_sekolah_id_index');
            }
            if (! $this->hasIndex('siswas', 'siswas_kelas_id_index')) {
                $table->index('kelas_id', 'siswas_kelas_id_index');
            }
        });

        Schema::table('gurus', function (Blueprint $table) {
            if (! $this->hasIndex('gurus', 'gurus_sekolah_id_index')) {
                $table->index('sekolah_id', 'gurus_sekolah_id_index');
            }
        });

        Schema::table('dudis', function (Blueprint $table) {
            if (! $this->hasIndex('dudis', 'dudis_sekolah_id_index')) {
                $table->index('sekolah_id', 'dudis_sekolah_id_index');
            }
        });

        Schema::table('absensis', function (Blueprint $table) {
            // Index tanggal untuk mempercepat filter rentang hari
            if (! $this->hasIndex('absensis', 'absensis_tanggal_index')) {
                $table->index('tanggal', 'absensis_tanggal_index');
            }
            // Sudah ada index untuk prakerin_siswa_id dan siswa_id melalui FK/unique
        });

        Schema::table('laporan_mingguans', function (Blueprint $table) {
            // Tambahkan index minggu_ke untuk cek minggu berjalan
            if (! $this->hasIndex('laporan_mingguans', 'laporan_mingguans_minggu_ke_index')) {
                $table->index('minggu_ke', 'laporan_mingguans_minggu_ke_index');
            }
        });
    }

    public function down(): void
    {
        Schema::table('siswas', function (Blueprint $table) {
            $table->dropIndex('siswas_sekolah_id_index');
            $table->dropIndex('siswas_kelas_id_index');
        });
        Schema::table('gurus', function (Blueprint $table) {
            $table->dropIndex('gurus_sekolah_id_index');
        });
        Schema::table('dudis', function (Blueprint $table) {
            $table->dropIndex('dudis_sekolah_id_index');
        });
        Schema::table('absensis', function (Blueprint $table) {
            $table->dropIndex('absensis_tanggal_index');
        });
        Schema::table('laporan_mingguans', function (Blueprint $table) {
            $table->dropIndex('laporan_mingguans_minggu_ke_index');
        });
    }

    private function hasIndex(string $table, string $indexName): bool
    {
        // Cek index via Schema manager; jika tidak tersedia gunakan DB raw
        try {
            $connection = Schema::getConnection();
            $schemaManager = $connection->getDoctrineSchemaManager();
            $indexes = $schemaManager->listTableIndexes($table);
            return array_key_exists($indexName, $indexes);
        } catch (\Throwable $e) {
            return false;
        }
    }
};
