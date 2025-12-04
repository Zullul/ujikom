<?php

namespace App\Filament\Resources\SiswaResource\Pages;

use App\Filament\Resources\SiswaResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Actions\Action;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\MarkdownEditor;
use App\Imports\SiswaImportCSV; // Pastikan nama import class sesuai
use App\Imports\SiswaImport;    // Pastikan nama import class sesuai
use Maatwebsite\Excel\Facades\Excel;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;
use App\Models\tahun_ajaran; // Sesuaikan dengan model Anda
use App\Models\Kelas;
use App\Traits\ChecksAccountQuota;
use Maatwebsite\Excel\HeadingRowImport;

class ListSiswas extends ListRecords
{
    use ChecksAccountQuota;
    
    protected static string $resource = SiswaResource::class;

    protected function getHeaderActions(): array
    {
        // --- PERBAIKAN DIMULAI DI SINI ---
        // 1. Generate URL template di luar form
        $templateSiswaUrl = asset('templates/template_siswa.csv');

        // 2. Susun string Markdown dengan URL yang sudah jadi
        $markdownPetunjukSiswa = <<<MARKDOWN
**PERHATIAN!** Mohon siapkan file CSV Anda sesuai dengan aturan berikut sebelum mengunggah:

1.  **Format File**: Pastikan file Anda berformat `.csv`.
2.  **Header**: Baris pertama file CSV **wajib** berisi *header* dengan nama kolom berikut (huruf kecil semua):
    - `nama_siswa` (Wajib)
    - `nis` (Wajib)
    - `tempat_lahir` (Wajib)
    - `tanggal_lahir` (Wajib, format: YYYY-MM-DD, contoh: 2005-01-01)
    - `kelas` (Wajib, isi dengan **nama kelas** yang sudah ada di sistem, contoh: 'XII RPL 1')
3.  **Pemisah**: Gunakan koma (`,`) sebagai pemisah antar kolom.

**Kesalahan format dapat menyebabkan data gagal diimpor.**

➡️ [**Unduh Template CSV Siswa di Sini**]({$templateSiswaUrl})
MARKDOWN;
        // --- AKHIR PERBAIKAN ---

        return [
            Actions\CreateAction::make(),
            Action::make('importSiswa')
                ->label('Impor CSV Siswa')
                ->color('success')
                ->icon('heroicon-o-arrow-up-tray')
                ->form([
                    MarkdownEditor::make('instructions')
                        ->label('Petunjuk Penting!')
                        ->disabled()
                        // 3. Gunakan variabel yang berisi Markdown
                        ->default($markdownPetunjukSiswa),
                    FileUpload::make('attachment')
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
                        $array = Excel::toArray(new SiswaImport($sekolahId, $tahunAjaranId, []), $filePath);
                        $jumlahDataImport = count($array[0] ?? []); // Jumlah baris data (sudah exclude header karena WithHeadingRow)
                        
                        // Debug: Log jumlah data
                        \Log::info("Jumlah data yang akan diimport: {$jumlahDataImport}");
                        
                        // STEP 2: Validasi kuota SEBELUM import
                        $quotaCheck = $this->checkAccountQuota($sekolahId, $jumlahDataImport);
                        
                        if (!$quotaCheck['success']) {
                            // Jika melebihi kuota, batalkan dan tampilkan notifikasi
                            $this->notifyQuotaCheck($quotaCheck);
                            return; // Stop execution
                        }

                        // STEP 3: Jika kuota mencukupi, lanjutkan import
                        // Buat mapping: nama_kelas (normalized) => id
                        $kelasMapping = [];
                        $kelasList = Kelas::where('sekolah_id', $sekolahId)
                            ->where('tahun_ajaran_id', $tahunAjaranId)
                            ->get();
                        
                        foreach ($kelasList as $kelas) {
                            $normalized = strtolower(trim($kelas->nama_kelas));
                            $kelasMapping[$normalized] = $kelas->id;
                        }

                        // Log kelas mapping
                        \Log::info('Kelas Mapping:', $kelasMapping);

                        Excel::import(new SiswaImport($sekolahId, $tahunAjaranId, $kelasMapping), $filePath);

                        // Hitung berapa siswa yang benar-benar berhasil diimport
                        $siswaCount = \App\Models\Siswa::where('sekolah_id', $sekolahId)
                            ->where('tahun_ajaran_id', $tahunAjaranId)
                            ->count();
                        
                        \Log::info("Total siswa setelah import: {$siswaCount}");

                        Notification::make()
                            ->title('Impor Berhasil')
                            ->body("Data siswa telah berhasil diimpor. {$jumlahDataImport} data diproses. Sisa kuota: " . ($quotaCheck['remaining'] - $jumlahDataImport))
                            ->success()
                            ->send();
                    } catch (\Maatwebsite\Excel\Validators\ValidationException $e) {
                         $failures = $e->failures(); $errorMessages = [];
                         foreach ($failures as $failure) { $errorMessages[] = "Baris {$failure->row()}: " . implode(', ', $failure->errors()); }
                         Notification::make()->title('Impor Gagal: Error Validasi')->body("Terdapat kesalahan pada data CSV Anda: \n" . implode("\n", $errorMessages))->danger()->persistent()->send();
                    } catch (\Exception $e) {
                        \Log::error('Import Error: ' . $e->getMessage());
                        \Log::error($e->getTraceAsString());
                        Notification::make()->title('Impor Gagal')->body('Terjadi kesalahan. Pastikan format file CSV dan data di dalamnya sudah benar. Error: ' . $e->getMessage())->danger()->send();
                    }
                }),
        ];
    }
}