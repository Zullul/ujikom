<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class PenilaianPkl extends Model
{
    use HasFactory;

    protected $table = 'penilaian_pkls';
    protected $guarded = [];

    public function prakerinSiswa(): BelongsTo
    {
        return $this->belongsTo(PrakerinSiswa::class);
    }

    public function details()
    {
        return $this->hasMany(PenilaianDetail::class);
    }

    public function getNilaiAkhirAttribute()
    {
        $scores = [];
        if ($this->skor_guru !== null) $scores[] = $this->skor_guru;
        if ($this->skor_dudi !== null) $scores[] = $this->skor_dudi;
        if (empty($scores)) return 0;
        return array_sum($scores) / count($scores);
    }

    public function getGradeAkhirAttribute()
    {
        $nilaiAkhir = $this->getNilaiAkhirAttribute();
        return match (true) { $nilaiAkhir >= 90 => 'A', $nilaiAkhir >= 80 => 'B', $nilaiAkhir >= 70 => 'C', $nilaiAkhir >= 60 => 'D', default => 'E', };
    }

    // --- MODIFIKASI DIMULAI DI SINI ---
    /**
     * Accessor untuk membuat ringkasan naratif.
     * @param string|null $namaSiswa Opsional, nama siswa untuk mengganti 'Anda'.
     */
    public function getKeteranganSiswaAttribute(?string $namaSiswa = null)
    {
        $this->loadMissing('details.tujuanPembelajaran');
        $grade = $this->grade_akhir;
        $nilai = number_format($this->nilai_akhir, 2); // Format nilai

        // Tentukan subjek kalimat
        $subjek = $namaSiswa ? "Kinerja  {$namaSiswa} " : "Kinerja Anda";
        $subjekSingkat = $namaSiswa ? " {$namaSiswa} " : "Anda";

        $kalimatPembuka = match ($grade) {
            'A' => "Secara keseluruhan, {$subjek} selama PKL  Sangat Baik  dengan nilai akhir  {$nilai} . {$subjekSingkat} telah menunjukkan penguasaan yang mumpuni di berbagai kompetensi.",
            'B' => "{$subjek} selama PKL dinilai  Baik  dengan nilai akhir  {$nilai} . {$subjekSingkat} telah memenuhi sebagian besar ekspektasi dan menunjukkan kompetensi yang solid.",
            'C' => "{$subjek} selama PKL dinilai  Cukup  dengan nilai akhir  {$nilai} . {$subjekSingkat} telah menunjukkan pemahaman dasar, namun masih ada beberapa area yang perlu ditingkatkan.",
            'D' => "{$subjek} selama PKL dinilai  Kurang  dengan nilai akhir  {$nilai} . {$subjekSingkat} perlu fokus belajar lebih giat untuk memperbaiki beberapa kompetensi inti.",
            default => "{$subjek} selama PKL dinilai  Sangat Kurang  dengan nilai akhir  {$nilai} . {$subjekSingkat} sangat disarankan untuk mengulas kembali materi dan berlatih lebih keras.",
        };

        $kekuatan = [];
        $peningkatan = [];

        foreach ($this->details as $detail) {
            if (!$detail->tujuanPembelajaran) continue;
            $scores = [];
            if ($detail->skor_guru !== null) $scores[] = $detail->skor_guru;
            if ($detail->skor_dudi !== null) $scores[] = $detail->skor_dudi;
            if (empty($scores)) continue;
            $avgSkor = array_sum($scores) / count($scores);

            $cleanedText = strip_tags($detail->tujuanPembelajaran->deskripsi);
            $decodedText = html_entity_decode($cleanedText, ENT_QUOTES | ENT_HTML5, 'UTF-8');
            $kriteriaText = preg_replace('/^[\P{L}]+/u', '', $decodedText);

            if ($avgSkor >= 80) $kekuatan[] = $kriteriaText;
            elseif ($avgSkor < 75) $peningkatan[] = $kriteriaText;
        }

        $html = "<p>{$kalimatPembuka}</p>";
        if (!empty($kekuatan)) {
            $html .= "<h4>Kompetensi yang Menonjol:</h4><ul>";
            foreach ($kekuatan as $item) $html .= "<li>{$item}</li>";
            $html .= "</ul>";
        }
        if (!empty($peningkatan)) {
            $html .= "<h4>Area yang Perlu Ditingkatkan:</h4><ul>";
            foreach ($peningkatan as $item) $html .= "<li>{$item}</li>";
            $html .= "</ul>";
        }
        return $html;
    }
    // --- AKHIR MODIFIKASI ---
}