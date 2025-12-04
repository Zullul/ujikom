<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Form;
use Filament\Forms\Components\Textarea;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;
use App\Models\User;
use App\Models\Absensi;
use App\Models\JurnalHarian;
use App\Models\LaporanMingguan;
use App\Models\PrakerinSiswa;

class InputRefleksi extends Page implements HasForms
{
    use InteractsWithForms;

    protected static string $view = 'filament.pages.input-refleksi';
    protected static bool $shouldRegisterNavigation = false;

    public ?array $data = [];
    public $student;
    public $week_number, $start_date, $end_date, $prakerin_id;
    public $attendances = [], $dailyJournals = [];
    public bool $isVerified = false;

    public function mount($week_number, $start_date, $end_date, User $student): void
    {
        $this->student = $student;
        $this->week_number = $week_number;
        $this->start_date = $start_date;
        $this->end_date = $end_date;
        $this->prakerin_id = request()->query('prakerin_id');

        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $this->student->ref_id)
            ->where('status', 'berjalan')
            ->first();
        if (!$prakerinSiswa) {
            Notification::make()->title('Siswa tidak terdaftar dalam periode prakerin aktif.')->danger()->send();
            return;
        }

        $timezone = config('app.timezone');
        $start = \Carbon\Carbon::parse($this->start_date, $timezone)->startOfDay()->toDateString();
        $end = \Carbon\Carbon::parse($this->end_date, $timezone)->endOfDay()->toDateString();

        $this->attendances = Absensi::where('siswa_id', $this->student->ref_id)
            ->whereDate('tanggal', '>=', $start)
            ->whereDate('tanggal', '<=', $end)
            ->orderBy('tanggal', 'asc')
            ->get();

        $this->dailyJournals = JurnalHarian::where('siswa_id', $this->student->ref_id)
            ->whereDate('tanggal', '>=', $start)
            ->whereDate('tanggal', '<=', $end)
            ->orderBy('tanggal', 'asc')
            ->get();

        // Catatan: tidak ada fallback lintas minggu. Tampilkan hanya jurnal dalam rentang minggu terpilih.

        $existingReport = LaporanMingguan::where('prakerin_siswa_id', $prakerinSiswa->id)
            ->where('minggu_ke', $this->week_number)
            ->first();

        $user = Auth::user();
        $reportText = '';

        if ($existingReport) {
            if ($user->role_type === 'guru') {
                $reportText = $existingReport->laporan_guru;
                $this->isVerified = $existingReport->verifikasi_guru;
            } elseif ($user->role_type === 'dudi_pembimbing') {
                $reportText = $existingReport->laporan_dudi;
                $this->isVerified = $existingReport->verifikasi_dudi;
            }
        }
        if ($user->role_type === 'admin_sekolah') {
            $this->isVerified = true; // Gunakan isVerified untuk menonaktifkan form & tombol
        }

        $this->form->fill(['reflection_text' => $reportText]);
    }

    public function form(Form $form): Form
    {
        return $form->schema([
            Textarea::make('reflection_text')->label('Catatan & Evaluasi Pembimbing')->required()->rows(8),
        ])->statePath('data')->disabled($this->isVerified);
    }

    public function save()
    {
        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $this->student->ref_id)->where('status', 'berjalan')->first();
        if (!$prakerinSiswa) {
            Notification::make()->title('Error: Data prakerin siswa tidak ditemukan.')->danger()->send();
            return;
        }

        $user = Auth::user();
        $formData = $this->form->getState();
        $reportColumn = ($user->role_type === 'guru') ? 'laporan_guru' : 'laporan_dudi';

        // --- KODE FINAL YANG SUDAH LENGKAP ---
        LaporanMingguan::updateOrCreate(
            [
                'prakerin_siswa_id' => $prakerinSiswa->id,
                'minggu_ke' => $this->week_number,
            ],
            [
                'siswa_id' => $prakerinSiswa->siswa_id,
                'tanggal_mulai_minggu' => $this->start_date, // Data tanggal mulai ditambahkan
                'tanggal_selesai_minggu' => $this->end_date,   // Data tanggal selesai ditambahkan
                $reportColumn => $formData['reflection_text'],
            ]
        );

        Notification::make()->title('Refleksi berhasil disimpan')->success()->send();
    }

    public function verify()
    {
        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $this->student->ref_id)->where('status', 'berjalan')->first();
        if (!$prakerinSiswa) {
            Notification::make()->title('Error: Data prakerin siswa tidak ditemukan.')->danger()->send();
            return;
        }

        $user = Auth::user();
        $verificationColumn = ($user->role_type === 'guru') ? 'verifikasi_guru' : 'verifikasi_dudi';

        $report = LaporanMingguan::where('prakerin_siswa_id', $prakerinSiswa->id)
            ->where('minggu_ke', $this->week_number)
            ->first();

        if ($report) {
            $report->update([$verificationColumn => 1]);
            $this->isVerified = true;
            Notification::make()->title('Refleksi berhasil diverifikasi')->success()->send();
        } else {
            Notification::make()->title('Gagal, simpan refleksi terlebih dahulu.')->danger()->send();
        }
    }

    public static function getSlug(): string
    {
        return 'refleksi-mingguan/input/{week_number}/{start_date}/{end_date}/{student}';
    }
}
