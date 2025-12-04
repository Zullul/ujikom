<?php

namespace App\Filament\Resources\GuruResource\Pages;

use App\Filament\Resources\GuruResource; // <-- Pastikan ini ada
use App\Imports\GuruImport;
use Filament\Actions;
use Filament\Actions\Action;
use Filament\Forms;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Traits\ChecksAccountQuota;
use Maatwebsite\Excel\HeadingRowImport;

class ListGurus extends ListRecords
{
    use ChecksAccountQuota;
    
    protected static string $resource = GuruResource::class;

    protected function getHeaderActions(): array
    {
        // --- PERBAIKAN DIMULAI DI SINI ---
        // 1. Generate URL template di luar form
        $templateGuruUrl = asset('templates/template_guru.csv');

        // 2. Susun string Markdown dengan URL yang sudah jadi
        $markdownPetunjukGuru = <<<MARKDOWN
**PERHATIAN!** Mohon siapkan file CSV Anda sesuai dengan aturan berikut sebelum mengunggah:

1.  **Format File**: Pastikan file Anda berformat `.csv`.
2.  **Header**: Baris pertama file CSV **wajib** berisi *header* dengan nama kolom berikut (huruf kecil semua):
    - `nama_guru` (Wajib)
    - `nip` (Wajib)
    - `kontak` (Wajib - Nomor telepon/HP)
    - `jabatan` (Wajib - Contoh: 'Guru Produktif', 'Wali Kelas', 'Guru Normatif', dll)

3.  **Pemisah**: Gunakan koma (`,`) sebagai pemisah antar kolom.

**Kesalahan format dapat menyebabkan data gagal diimpor.**

➡️ [**Unduh Template CSV Guru di Sini**]({$templateGuruUrl})
MARKDOWN;
        // --- AKHIR PERBAIKAN ---

        return [
            Actions\CreateAction::make(),
            Action::make('importGuru')
                ->label('Impor CSV Guru')
                ->color('success')
                ->icon('heroicon-o-arrow-up-tray')
                ->form([
                    Forms\Components\MarkdownEditor::make('instructions')
                        ->label('Petunjuk Penting!')
                        ->disabled()
                        // 3. Gunakan variabel yang berisi Markdown
                        ->default($markdownPetunjukGuru),
                    Forms\Components\FileUpload::make('attachment')
                        ->label('Unggah File CSV')
                        ->required()
                        ->acceptedFileTypes(['text/csv']),
                ])
                ->action(function (array $data) {
                    try {
                        $user = Auth::user();
                        $sekolahId = $user->sekolah_id;
                        $tahunAjaranId = session('selected_tahun_ajaran_id');

                        // Get full path dari storage
                        $filePath = storage_path('app/public/' . $data['attachment']);

                        // STEP 1: Hitung jumlah baris dalam CSV (tanpa header)
                        $array = Excel::toArray(new GuruImport($sekolahId, $tahunAjaranId), $filePath);
                        $jumlahDataImport = count($array[0] ?? []); // Jumlah baris data (sudah exclude header karena WithHeadingRow)
                        
                        // Debug: Log jumlah data
                        \Log::info("Jumlah guru yang akan diimport: {$jumlahDataImport}");
                        
                        // STEP 2: Validasi kuota SEBELUM import
                        $quotaCheck = $this->checkAccountQuota($sekolahId, $jumlahDataImport);
                        
                        if (!$quotaCheck['success']) {
                            // Jika melebihi kuota, batalkan dan tampilkan notifikasi
                            $this->notifyQuotaCheck($quotaCheck);
                            return; // Stop execution
                        }

                        // STEP 3: Jika kuota mencukupi, lanjutkan import
                        Excel::import(new GuruImport($sekolahId, $tahunAjaranId), $filePath);

                        // Hitung berapa guru yang benar-benar berhasil diimport
                        $guruCount = \App\Models\Guru::where('sekolah_id', $sekolahId)
                            ->where('tahun_ajaran_id', $tahunAjaranId)
                            ->count();
                        
                        \Log::info("Total guru setelah import: {$guruCount}");

                        Notification::make()
                            ->title('Impor Berhasil')
                            ->body("Data guru telah berhasil diimpor. {$jumlahDataImport} data diproses. Sisa kuota: " . ($quotaCheck['remaining'] - $jumlahDataImport))
                            ->success()
                            ->send();
                    } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
                        $failures = $e->failures(); $errorMessages = [];
                        foreach ($failures as $failure) { $errorMessages[] = "Baris {$failure->row()}: " . implode(', ', $failure->errors()); }
                        Notification::make()->title('Impor Gagal: Error Validasi')->body("Terdapat kesalahan pada data CSV Anda: \n" . implode("\n", $errorMessages))->danger()->persistent()->send();
                    } catch (\Exception $e) {
                        \Log::error('Import Guru Error: ' . $e->getMessage());
                        \Log::error($e->getTraceAsString());
                        Notification::make()->title('Impor Gagal')->body('Terjadi kesalahan. Pastikan format file CSV dan data di dalamnya sudah benar. Error: ' . $e->getMessage())->danger()->send();
                    }
                }),
        ];
    }
}