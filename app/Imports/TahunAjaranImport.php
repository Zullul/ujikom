<?php

namespace App\Imports;

use App\Models\tahun_ajaran;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;
use Maatwebsite\Excel\Concerns\WithValidation;
use Maatwebsite\Excel\Concerns\Importable;
use Maatwebsite\Excel\Concerns\SkipsErrors;
use Maatwebsite\Excel\Concerns\SkipsFailures;
use Maatwebsite\Excel\Concerns\SkipsOnError;
use Maatwebsite\Excel\Concerns\SkipsOnFailure;

class TahunAjaranImport implements ToModel, WithHeadingRow, WithValidation, SkipsOnError, SkipsOnFailure
{
    use Importable, SkipsErrors, SkipsFailures;

    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function model(array $row)
    {
        return new tahun_ajaran([
            'tahun_ajaran' => $row['tahun_ajaran'],
            'sekolah_id' => $row['sekolah_id'],
        ]);
    }

    /**
     * @return array
     */
    public function rules(): array
    {
        return [
            'tahun_ajaran' => 'required|string',
            'sekolah_id' => 'required|integer|exists:sekolahs,id',
        ];
    }

    /**
     * @return array
     */
    public function customValidationMessages()
    {
        return [
            'tahun_ajaran.required' => 'Tahun ajaran wajib diisi.',
            'tahun_ajaran.string' => 'Tahun ajaran harus berupa teks.',
            'sekolah_id.required' => 'ID sekolah wajib diisi.',
            'sekolah_id.integer' => 'ID sekolah harus berupa angka.',
            'sekolah_id.exists' => 'Sekolah tidak ditemukan.',
        ];
    }
}
