<?php

namespace App\Imports;

use App\Models\Guru;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\WithBatchInserts;
use Maatwebsite\Excel\Concerns\WithChunkReading;

class GuruImport implements ToModel, WithHeadingRow, WithValidation, SkipsOnFailure, WithBatchInserts, WithChunkReading
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
        if (empty($row['nama_guru']) || empty($row['nip'])) {
            return null;
        }

        return new Guru([
            'nama_guru' => $row['nama_guru'],
            'nip' => (string) $row['nip'],
            'kontak' => $row['kontak'] ?? '',
            'jabatan' => $row['jabatan'] ?? '',
            'sekolah_id' => $this->sekolah_id,
        ]);
    }

    public function rules(): array
    {
        return [
            'nama_guru' => 'required|string|max:255',
            'nip' => 'required|string|max:45',
            'kontak' => 'nullable|string|max:255',
            'jabatan' => 'nullable|string|max:255',
        ];
    }

    public function headingRow(): int
    {
        return 1;
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
