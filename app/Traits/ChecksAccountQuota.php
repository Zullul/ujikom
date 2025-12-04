<?php

namespace App\Traits;

use App\Models\sekolah;
use App\Models\User;
use Filament\Notifications\Notification;

trait ChecksAccountQuota
{
    /**
     * Cek apakah penambahan akun melebihi kuota
     * 
     * @param int $sekolahId
     * @param int $jumlahAkanDitambah
     * @return array ['success' => bool, 'message' => string, 'warning' => bool, 'current' => int, 'limit' => int, 'remaining' => int]
     */
    public function checkAccountQuota(int $sekolahId, int $jumlahAkanDitambah): array
    {
        $sekolah = sekolah::find($sekolahId);
        
        if (!$sekolah) {
            return [
                'success' => false,
                'warning' => false,
                'message' => 'Sekolah tidak ditemukan',
                'current' => 0,
                'limit' => 0,
                'remaining' => 0
            ];
        }

        // Hitung jumlah user saat ini
        $jumlahUserSaatIni = User::where('sekolah_id', $sekolahId)->count();
        
        // Hitung batas kuota utama dan total (dengan bonus)
        $batasUtama = $sekolah->batas_akun;
        $kuotaBonus = $sekolah->kuota_bonus ?? 50; // Default 50 jika null
        $batasTotal = $batasUtama + $kuotaBonus;
        
        // Hitung total setelah ditambah
        $totalSetelahDitambah = $jumlahUserSaatIni + $jumlahAkanDitambah;
        
        // CASE 1: Melebihi batas total (batas_akun + kuota_bonus) - DITOLAK
        if ($totalSetelahDitambah > $batasTotal) {
            $sisaKuotaTotal = $batasTotal - $jumlahUserSaatIni;
            return [
                'success' => false,
                'warning' => false,
                'message' => "🚫 KUOTA HABIS!\n\n" .
                           "Anda mencoba menambahkan {$jumlahAkanDitambah} akun, tetapi kuota bonus Anda sudah habis.\n\n" .
                           "📊 Detail:\n" .
                           "• Akun saat ini: {$jumlahUserSaatIni}\n" .
                           "• Batas utama: {$batasUtama}\n" .
                           "• Kuota bonus: {$kuotaBonus}\n" .
                           "• Total maksimal: {$batasTotal}\n" .
                           "• Sisa kuota: {$sisaKuotaTotal}",
                'current' => $jumlahUserSaatIni,
                'limit' => $batasUtama,
                'limit_with_bonus' => $batasTotal,
                'remaining' => $sisaKuotaTotal,
                'attempting_to_add' => $jumlahAkanDitambah,
                'would_exceed_by' => $totalSetelahDitambah - $batasTotal
            ];
        }
        
        // CASE 2: Di antara batas utama dan batas total - DITERIMA DENGAN WARNING
        if ($totalSetelahDitambah > $batasUtama) {
            $sisaKuotaBonus = $batasTotal - $jumlahUserSaatIni;
            return [
                'success' => true,
                'warning' => true,
                'message' => "⚠️ MENGGUNAKAN KUOTA BONUS!\n\n" .
                           "{$jumlahAkanDitambah} akun akan ditambahkan menggunakan kuota bonus.\n\n" .
                           "📊 Detail:\n" .
                           "• Akun saat ini: {$jumlahUserSaatIni}\n" .
                           "• Batas utama: {$batasUtama} (sudah terlewati)\n" .
                           "• Kuota bonus tersisa: {$sisaKuotaBonus} dari {$kuotaBonus}\n" .
                           "• Setelah import: " . ($sisaKuotaBonus - $jumlahAkanDitambah) . " kuota bonus tersisa",
                'current' => $jumlahUserSaatIni,
                'limit' => $batasUtama,
                'limit_with_bonus' => $batasTotal,
                'remaining' => $sisaKuotaBonus
            ];
        }
        
        // CASE 3: Di bawah batas utama - DITERIMA TANPA WARNING
        $sisaKuota = $batasUtama - $jumlahUserSaatIni;
        return [
            'success' => true,
            'warning' => false,
            'message' => "✅ Kuota mencukupi!\n\n" .
                       "{$jumlahAkanDitambah} akun dapat ditambahkan.\n" .
                       "Sisa kuota utama: " . ($sisaKuota - $jumlahAkanDitambah) . " dari {$batasUtama}",
            'current' => $jumlahUserSaatIni,
            'limit' => $batasUtama,
            'limit_with_bonus' => $batasTotal,
            'remaining' => $sisaKuota
        ];
    }
    
    /**
     * Tampilkan notifikasi Filament untuk hasil pengecekan kuota
     */
    public function notifyQuotaCheck(array $result): void
    {
        if ($result['success']) {
            if ($result['warning']) {
                // Kuota bonus digunakan - WARNING kuning
                Notification::make()
                    ->warning()
                    ->title('⚠️ PERINGATAN: Menggunakan Kuota Bonus')
                    ->body($result['message'])
                    ->persistent()
                    ->send();
            } else {
                // Kuota normal - SUCCESS hijau
                Notification::make()
                    ->success()
                    ->title('✅ Kuota Mencukupi')
                    ->body($result['message'])
                    ->send();
            }
        } else {
            // Kuota habis - DANGER merah
            Notification::make()
                ->danger()
                ->title('🚫 KUOTA HABIS - Import Dibatalkan!')
                ->body($result['message'] . "\n\n❌ **Data CSV TIDAK akan diimport karena kuota sudah habis.**")
                ->persistent()
                ->send();
        }
    }
}
