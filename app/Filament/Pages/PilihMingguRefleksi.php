<?php

namespace App\Filament\Pages;

use App\Models\LaporanMingguan;
use App\Models\PrakerinSiswa;
use App\Models\Prakerin;
use Carbon\Carbon;
use Filament\Pages\Page;
use Filament\Forms\Components\Select;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Illuminate\Support\Facades\Auth;

class PilihMingguRefleksi extends Page implements HasForms
{
    use InteractsWithForms;
    
    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-bottom-center-text';
    protected static string $view = 'filament.pages.pilih-minggu-refleksi';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?int $navigationSort = 3;

    public $weeks = [];
    public $prakerin_id = null;
    public $data = [];

    public static function getNavigationLabel(): string
    {
        $user = Auth::user();
        if ($user && $user->isAdminSekolah()) {
            return 'Laporan Refleksi Mingguan';
        }
        return 'Input Refleksi Mingguan';
    }

    public static function canAccess(): bool
    {
        $user = Auth::user();
        return $user->isAdminSekolah() || $user->isGuru() || $user->isDudiPembimbing();
    }
    
    public function form(Form $form): Form
    {
        $user = Auth::user();
        
        // Hanya tampilkan form untuk Admin Sekolah
        if (!$user->isAdminSekolah()) {
            return $form->schema([]);
        }
        
        return $form
            ->schema([
                Select::make('prakerin_id')
                    ->label('Pilih Periode Prakerin')
                    ->options(function () use ($user) {
                        return Prakerin::where('sekolah_id', $user->sekolah_id)
                            ->with('tahunAjaran')
                            ->orderBy('tanggal_mulai', 'desc')
                            ->get()
                            ->pluck('nama_prakerin', 'id')
                            ->toArray();
                    })
                    ->placeholder('-- Pilih Periode Prakerin --')
                    ->required()
                    ->searchable()
                    ->native(false),
            ])
            ->statePath('data');
    }

    public function mount(): void
    {
        $user = Auth::user();
        
        // Untuk Admin Sekolah, cek apakah sudah pilih periode
        if ($user->isAdminSekolah()) {
            $this->form->fill();
            
            // Jika belum pilih periode, jangan load weeks
            if (!$this->prakerin_id) {
                $this->weeks = [];
                return;
            }
        }
        
        $this->loadWeeks();
    }
    
    public function submitPeriode(): void
    {
        $user = Auth::user();
        
        if (!$user->isAdminSekolah()) {
            return;
        }
        
        $data = $this->form->getState();
        $this->prakerin_id = $data['prakerin_id'] ?? null;
        
        $this->loadWeeks();
    }
    
    public function loadWeeks(): void
    {
        $user = Auth::user();
        $prakerinSiswaIds = collect();

        if ($user->isAdminSekolah()) {
            $query = PrakerinSiswa::where('status', 'berjalan')
                ->whereHas('siswa', function ($query) use ($user) {
                    $query->where('sekolah_id', $user->sekolah_id);
                });
            
            // Filter berdasarkan periode prakerin jika dipilih
            if ($this->prakerin_id) {
                $query->where('prakerin_id', $this->prakerin_id);
            }
            
            $prakerinSiswaIds = $query->pluck('id');
        } else {
            $prakerinSiswaIds = PrakerinSiswa::where('status', 'berjalan')
                ->where(function ($query) use ($user) {
                    $query->where('guru_pembimbing_id', $user->ref_id)
                        ->orWhere('dudi_pembimbing_id', $user->ref_id);
                })
                ->pluck('id');
        }

        if ($prakerinSiswaIds->isEmpty()) {
            $this->weeks = [];
            return;
        }

        $weeksData = LaporanMingguan::whereIn('prakerin_siswa_id', $prakerinSiswaIds)
            ->select('minggu_ke', 'tanggal_mulai_minggu', 'tanggal_selesai_minggu')
            ->distinct()
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
                'prakerin_id' => $this->prakerin_id, // Tambahkan prakerin_id
            ];
        })->all();
    }
}
