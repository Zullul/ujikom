<?php

namespace App\Imports;

use App\Models\Siswa;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithStartRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;
use Carbon\Carbon;
use Illuminate\Support\Facades\Log;

class SiswaImportCSV implements ToModel, WithStartRow, WithValidation, SkipsOnFailure, WithBatchInserts, WithChunkReading
{
    use SkipsFailures;

    protected $sekolah_id;

    public function __construct($sekolah_id)
    {
        $this->sekolah_id = $sekolah_id;
    }

    public function startRow(): int
    {
        return 2; // Mulai dari baris 2 (setelah header)
    }

    public function model(array $row)
    {
        // Log untuk debugging
        Log::info('Processing row: ' . json_encode($row));

        // Skip jika baris kosong atau tidak valid
        if (empty($row[1]) || empty($row[2])) {
            Log::info('Skipping empty row - missing nama or nis');
            return null;
        }

        // Bersihkan NIS dari karakter "V" di akhir dan whitespace
        $nis = trim($row[2]);
        // Hapus huruf "V" di akhir NIS jika ada
        if (substr($nis, -1) === 'V') {
            $nis = substr($nis, 0, -1);
        }
        Log::info('Cleaned NIS: ' . $nis);

        // Parse tanggal lahir
        $tanggal_lahir = null;
        if (!empty($row[4])) {
            $tanggal_string = trim($row[4]);
            Log::info('Parsing date: ' . $tanggal_string);

            try {
                // Coba format M/d/Y terlebih dahulu (sesuai format CSV: 4/21/2008)
                if (preg_match('/^(\d{1,2})\/(\d{1,2})\/(\d{4})$/', $tanggal_string, $matches)) {
                    $month = intval($matches[1]);
                    $day = intval($matches[2]);
                    $year = intval($matches[3]);

                    // Validasi tanggal
                    if (checkdate($month, $day, $year)) {
                        $tanggal_lahir = Carbon::createFromDate($year, $month, $day)->format('Y-m-d');
                        Log::info('Successfully parsed date: ' . $tanggal_lahir);
                    } else {
                        Log::warning('Invalid date values: ' . $tanggal_string);
                    }
                } else {
                    // Fallback ke parsing otomatis Carbon
                    $parsed_date = Carbon::parse($tanggal_string);
                    $tanggal_lahir = $parsed_date->format('Y-m-d');
                    Log::info('Fallback parsing successful: ' . $tanggal_lahir);
                }
            } catch (\Exception $e) {
                Log::warning('Failed to parse date: ' . $tanggal_string . ' - Error: ' . $e->getMessage());
                // Skip record jika tanggal tidak bisa diparsing
                return null;
            }
        } else {
            Log::warning('Empty birth date field');
            // Skip record jika tanggal lahir kosong
            return null;
        }

        // Pastikan tanggal lahir tidak null sebelum membuat record
        if ($tanggal_lahir === null) {
            Log::warning('Birth date is null, skipping record for: ' . $row[1]);
            return null;
        }

        $siswa = new Siswa([
            'nama_siswa' => trim($row[1]),           // Kolom Nama
            'nis' => $nis,                           // Kolom NIPD (sudah dibersihkan dari V)
            'tempat_lahir' => trim($row[3]) ?? '',   // Kolom Tempat Lahir
            'tanggal_lahir' => $tanggal_lahir,       // Kolom Tanggal Lahir
            'sekolah_id' => $this->sekolah_id,
        ]);

        Log::info('Created siswa: ' . json_encode($siswa->toArray()));

        return $siswa;
    }

    public function rules(): array
    {
        return [
            1 => 'required|string|max:255',     // Nama
            2 => 'required|string|max:45',      // NIPD/NIS
            3 => 'nullable|string|max:255',     // Tempat Lahir
            4 => 'required|string',             // Tanggal Lahir (required)
        ];
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
