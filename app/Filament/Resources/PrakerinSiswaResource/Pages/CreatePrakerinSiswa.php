<?php

namespace App\Filament\Resources\PrakerinSiswaResource\Pages;

use App\Filament\Resources\PrakerinSiswaResource;
use App\Models\PrakerinSiswa;
use App\Models\Prakerin;
use App\Models\Siswa;
use App\Models\Dudi;
use App\Models\DudiPembimbing;
use App\Models\Guru;
use App\Models\Kelas;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Forms\Components\Wizard;
use Filament\Forms\Components\Wizard\Step;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class CreatePrakerinSiswa extends CreateRecord
{
    protected static string $resource = PrakerinSiswaResource::class;

    // KITA TETAP PAKAI WIZARD
    // use CreateRecord\Concerns\HasWizard;

    // KITA HAPUS BARIS 'protected static string $view = ...' DARI SINI.
    // Ini adalah perubahan KUNCI agar Filament menggunakan template standarnya
    // yang sudah otomatis mendukung tombol-tombol wizard.

    public function mount(): void
    {
        abort_unless(request()->has('dudi_id'), 404);
        parent::mount();
        $this->form->fill([
            'dudi_id' => request()->get('dudi_id'),
        ]);
    }

    // Karena tidak ada view kustom, kita tidak perlu getFormActions() lagi.
    // Filament akan menampilkannya secara otomatis.

    public function form(Form $form): Form
    {
        $sekolahId = Auth::user()->sekolah_id;
        $tahunAjaranId = session('selected_tahun_ajaran_id');

        return $form
            ->schema([
                Wizard::make([
                    Step::make('Program & Lokasi')
                        ->schema([
                            Forms\Components\Select::make('prakerin_id')
                                ->label('Pilih Program Prakerin')
                                ->options(Prakerin::where('tahun_ajaran_id', $tahunAjaranId)->where('sekolah_id', $sekolahId)->pluck('keterangan', 'id'))
                                ->searchable()->required()->reactive(),
                            Forms\Components\Select::make('dudi_id')
                                ->label('DUDI (Tempat Prakerin)')
                                ->options(Dudi::where('tahun_ajaran_id', $tahunAjaranId)->where('sekolah_id', $sekolahId)->pluck('nama_dudi', 'id'))
                                ->searchable()
                                ->required()
                                ->reactive()
                                ->disabled()
                                ->dehydrated(),
                        ]),
                    Step::make('Pembimbing')
                        ->schema([
                            Forms\Components\Select::make('guru_pembimbing_id')
                                ->label('Guru Pembimbing')
                                ->options(Guru::where('tahun_ajaran_id', $tahunAjaranId)->where('sekolah_id', $sekolahId)->pluck('nama_guru', 'id'))
                                ->searchable()->required(),
                            Forms\Components\TextInput::make('no_sk')
                                ->label('Nomor SK')
                                ->maxLength(255)
                                ->required(),
                            Forms\Components\Select::make('dudi_pembimbing_id')
                                ->label('Pembimbing DUDI')
                                ->options(function (callable $get) use ($tahunAjaranId) {
                                    $dudiId = $get('dudi_id');
                                    if (!$dudiId) return [];
                                    return DudiPembimbing::where('dudi_id', $dudiId)
                                        ->where('tahun_ajaran_id', $tahunAjaranId)
                                        ->pluck('nama_pembimbing', 'id');
                                })
                                ->searchable()->required(),
                        ]),
                    Step::make('Pilih Siswa')
                        ->schema([
                            Forms\Components\Select::make('kelas_id')
                                ->label('Filter Siswa Berdasarkan Kelas (wajib pilih kelas terlebih dahulu)')
                                ->options(
                                    Kelas::where('sekolah_id', $sekolahId)
                                        ->where('tahun_ajaran_id', $tahunAjaranId)
                                        ->pluck('nama_kelas', 'id')
                                )
                                ->searchable()
                                ->live()
                                ->required(),

                            Forms\Components\CheckboxList::make('siswa_ids')
                                ->label('Pilih Siswa yang Akan Ditempatkan')
                                ->options(function (callable $get) use ($sekolahId, $tahunAjaranId) {
                                    $kelasId = $get('kelas_id');
                                    
                                    // Hanya tampilkan siswa jika kelas sudah dipilih
                                    if (!$kelasId) {
                                        return [];
                                    }

                                    $siswaSudahDitempatkan = PrakerinSiswa::whereHas('prakerin', function ($q) use ($tahunAjaranId) {
                                        $q->where('tahun_ajaran_id', $tahunAjaranId);
                                    })->pluck('siswa_id');

                                    return Siswa::where('sekolah_id', $sekolahId)
                                        ->where('tahun_ajaran_id', $tahunAjaranId)
                                        ->where('status', 'aktif')
                                        ->where('kelas_id', $kelasId)
                                        ->whereNotIn('id', $siswaSudahDitempatkan)
                                        ->pluck('nama_siswa', 'id');
                                })
                                ->columns(3)
                                ->required()
                                ->searchable()
                                ->bulkToggleable(),
                        ]),
                ])->columnSpanFull(),
            ]);
    }

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    protected function handleRecordCreation(array $data): Model
    {
        $commonData = [
            'prakerin_id'        => $data['prakerin_id'],
            'no_sk'              => $data['no_sk'],
            'dudi_id'            => $data['dudi_id'],
            'guru_pembimbing_id' => $data['guru_pembimbing_id'],
            'dudi_pembimbing_id' => $data['dudi_pembimbing_id'],
            'status'             => 'berjalan',
        ];
        $createdCount = 0;
        $firstRecord = null;
        DB::transaction(function () use ($data, $commonData, &$createdCount, &$firstRecord) {
            if (!empty($data['siswa_ids'])) {
                foreach ($data['siswa_ids'] as $siswaId) {
                    $record = PrakerinSiswa::create(array_merge($commonData, ['siswa_id' => $siswaId]));
                    if (!$firstRecord) {
                        $firstRecord = $record;
                    }
                    $createdCount++;
                }
            }
        });
        if ($createdCount > 0) {
            Notification::make()
                ->title('Berhasil!')
                ->body("Berhasil menempatkan {$createdCount} siswa.")
                ->success()
                ->send();
        }
        return $firstRecord ?? new ($this->getModel());
    }
}
