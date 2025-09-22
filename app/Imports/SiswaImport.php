<?php

namespace App\Imports;

use App\Models\Siswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Carbon\Carbon;

class SiswaImport implements ToModel, WithHeadingRow, WithValidation, SkipsOnFailure, WithBatchInserts, WithChunkReading
{
    use SkipsFailures;

    protected $sekolah_id;

    public function __construct($sekolah_id)
    {
        $this->sekolah_id = $sekolah_id;
    }

    public function model(array $row)
    {
        // Skip rows yang kosong atau header tambahan
        if (empty($row['Nama']) || empty($row['NIPD']) || $row['Nama'] == 'Nama') {
            return null;
        }

        // Parse tanggal lahir dengan berbagai format
        $tanggal_lahir = null;
        if (!empty($row['Tanggal Lahir'])) {
            try {
                // Coba format M/d/yyyy (seperti 4/21/2008)
                $tanggal_lahir = Carbon::createFromFormat('n/j/Y', $row['Tanggal Lahir'])->format('Y-m-d');
            } catch (\Exception $e) {
                try {
                    // Coba format M/d/Y (seperti 4/21/08)
                    $tanggal_lahir = Carbon::createFromFormat('n/j/y', $row['Tanggal Lahir'])->format('Y-m-d');
                } catch (\Exception $e) {
                    try {
                        // Coba format standar Y-m-d
                        $tanggal_lahir = Carbon::createFromFormat('Y-m-d', $row['Tanggal Lahir'])->format('Y-m-d');
                    } catch (\Exception $e) {
                        try {
                            // Coba parse otomatis
                            $tanggal_lahir = Carbon::parse($row['Tanggal Lahir'])->format('Y-m-d');
                        } catch (\Exception $e) {
                            $tanggal_lahir = null;
                        }
                    }
                }
            }
        }

        return new Siswa([
            'nama_siswa' => $row['Nama'],
            'nis' => (string) $row['NIPD'], // Pastikan NIS sebagai string
            'tanggal_lahir' => $tanggal_lahir,
            'tempat_lahir' => $row['Tempat Lahir'] ?? '',
            'sekolah_id' => $this->sekolah_id,
        ]);
    }

    public function rules(): array
    {
        return [
            'Nama' => 'required|string|max:255',
            'NIPD' => 'required|max:45',
            'Tempat Lahir' => 'nullable|string|max:255',
            'Tanggal Lahir' => 'nullable',
        ];
    }

    public function headingRow(): int
    {
        return 1; // Header ada di baris pertama
    }

    public function batchSize(): int
    {
        return 50;
    }

    public function chunkSize(): int
    {
        return 50;
    }
}
