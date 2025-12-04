<?php

namespace App\Observers;

use App\Models\PrakerinSiswa;
use App\Models\LaporanMingguan;
use Carbon\Carbon;

class PrakerinSiswaObserver
{
    /**
     * Handle the PrakerinSiswa "created" event.
     *
     * @param  \App\Models\PrakerinSiswa  $prakerinSiswa
     * @return void
     */
    public function created(PrakerinSiswa $prakerinSiswa)
    {
        try {
            \Log::info('PrakerinSiswaObserver triggered', [
                'prakerin_siswa_id' => $prakerinSiswa->id,
                'siswa_id' => $prakerinSiswa->siswa_id,
            ]);
            
            // Pastikan relasi 'prakerin' sudah dimuat untuk efisiensi
            $prakerinSiswa->load('prakerin');

            // Jika karena suatu hal data prakerin tidak ada, hentikan proses
            if (!$prakerinSiswa->prakerin) {
                \Log::warning('Prakerin not found for PrakerinSiswa', [
                    'prakerin_siswa_id' => $prakerinSiswa->id,
                    'prakerin_id' => $prakerinSiswa->prakerin_id,
                ]);
                return;
            }

            \Log::info('Generating LaporanMingguan', [
                'prakerin_id' => $prakerinSiswa->prakerin->id,
                'tanggal_mulai' => $prakerinSiswa->prakerin->tanggal_mulai,
                'tanggal_selesai' => $prakerinSiswa->prakerin->tanggal_selesai,
            ]);

            // Ambil tanggal mulai dan selesai dari jadwal prakerin utama
            $pklStartDate = Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai)->startOfDay();
            $pklEndDate = Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai)->endOfDay();

            // Inisialisasi tanggal berjalan dan nomor minggu
            $currentDate = $pklStartDate->copy();
            $weekNumber = 1;
            $createdCount = 0;

            // Lakukan perulangan selama tanggal berjalan masih dalam periode PKL
            while ($currentDate->lte($pklEndDate)) { // lte = less than or equal to

                // Tanggal mulai untuk minggu ini adalah tanggal berjalan saat ini
                $periodStartDate = $currentDate->copy();

                // Tanggal selesai untuk minggu ini adalah 6 hari dari sekarang (total 7 hari)
                $periodEndDate = $currentDate->copy()->addDays(6);

                // --- INI LOGIKA KUNCINYA ---
                // Jika tanggal selesai yang dihitung melebihi tanggal akhir PKL,
                // maka potong tanggal selesai ke tanggal akhir PKL.
                if ($periodEndDate->isAfter($pklEndDate)) {
                    $periodEndDate = $pklEndDate->copy();
                }

                // Buat record LaporanMingguan di database
                LaporanMingguan::create([
                    'prakerin_siswa_id' => $prakerinSiswa->id,
                    'siswa_id'          => $prakerinSiswa->siswa_id,
                    'minggu_ke'         => $weekNumber,
                    'tanggal_mulai_minggu' => $periodStartDate,
                    'tanggal_selesai_minggu' => $periodEndDate,
                ]);
                
                $createdCount++;

                // Pindahkan tanggal berjalan ke HARI SETELAH periode minggu ini berakhir
                $currentDate = $periodEndDate->copy()->addDay();

                // Naikkan nomor minggu untuk iterasi berikutnya
                $weekNumber++;
            }
            
            \Log::info('LaporanMingguan generation completed', [
                'prakerin_siswa_id' => $prakerinSiswa->id,
                'weeks_created' => $createdCount,
            ]);
            
        } catch (\Exception $e) {
            \Log::error('Error in PrakerinSiswaObserver', [
                'prakerin_siswa_id' => $prakerinSiswa->id,
                'error' => $e->getMessage(),
                'trace' => $e->getTraceAsString(),
            ]);
        }
    }
}
