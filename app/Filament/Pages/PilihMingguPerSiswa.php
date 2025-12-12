<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use App\Models\User;
use App\Models\LaporanMingguan;
use App\Models\PrakerinSiswa;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class PilihMingguPerSiswa extends Page
{
    protected static bool $shouldRegisterNavigation = false;
    protected static string $view = 'filament.pages.pilih-minggu-per-siswa';

    public $student;
    public $weeks = [];

    public function mount(User $student): void
    {
        $user = Auth::user();
        $this->student = $student;

        // Verifikasi bahwa siswa ini dibimbing oleh user yang login
        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $this->student->ref_id)
            ->where('status', 'berjalan')
            ->where(function ($query) use ($user) {
                $query->where('guru_pembimbing_id', $user->ref_id)
                      ->orWhere('dudi_pembimbing_id', $user->ref_id);
            })
            ->first();

        if (!$prakerinSiswa) {
            abort(403, 'Anda tidak membimbing siswa ini.');
        }

        // Ambil minggu-minggu yang ada untuk siswa ini
        $weeksData = LaporanMingguan::where('prakerin_siswa_id', $prakerinSiswa->id)
            ->select('minggu_ke', 'tanggal_mulai_minggu', 'tanggal_selesai_minggu')
            ->orderBy('minggu_ke', 'asc')
            ->get();

        $this->weeks = $weeksData->map(function ($week) {
            $startDate = Carbon::parse($week->tanggal_mulai_minggu);
            $endDate = Carbon::parse($week->tanggal_selesai_minggu);
            return [
                'number' => $week->minggu_ke,
                'start_date' => $startDate->toDateString(),
                'end_date' => $endDate->toDateString(),
                'label' => 'Minggu ke-' . $week->minggu_ke . ' (' . $startDate->translatedFormat('d M') . ' - ' . $endDate->translatedFormat('d M Y') . ')',
            ];
        })->all();
    }

    public static function getSlug(): string
    {
        return 'refleksi-mingguan/pilih-minggu/{student}';
    }
}
