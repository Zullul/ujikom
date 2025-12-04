<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Sekolah as Sekolah; // Pastikan namespace dan nama model sesuai
use Carbon\Carbon;

class CheckSchoolExpiry extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'school:check-expiry';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Checks for expired school subscriptions and deactivates them';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $this->info('Mulai memeriksa masa aktif sekolah...');

        // Cari sekolah yang:
        // 1. Masih berstatus aktif (is_aktif = true)
        // 2. Tanggal masa aktif selesainya sudah lewat dari hari ini
        $expiredSchools = Sekolah::where('is_aktif', true)
            ->where('masa_aktif_selesai', '<', Carbon::today())
            ->get();

        if ($expiredSchools->isEmpty()) {
            $this->info('Tidak ada sekolah yang masa aktifnya habis hari ini.');
            return;
        }

        foreach ($expiredSchools as $sekolah) {
            $sekolah->is_aktif = false;
            $sekolah->save();
            $this->warn("Sekolah '{$sekolah->nama_sekolah}' telah dinonaktifkan.");
        }

        $this->info('Pemeriksaan selesai. ' . $expiredSchools->count() . ' sekolah telah dinonaktifkan.');
    }
}
