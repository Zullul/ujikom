<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AbsensiPembimbingResource\Pages;
use App\Models\Absensi; // Tambahkan use Absensi
use App\Models\PrakerinSiswa;
use Carbon\Carbon; // Tambahkan use Carbon
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification; // Tambahkan use Notification
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth; // Tambahkan use Auth

class AbsensiPembimbingResource extends Resource
{
    protected static ?string $model = PrakerinSiswa::class; // Tetap pakai PrakerinSiswa

    // Pengaturan Navigasi
    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';
    protected static ?string $navigationLabel = 'Absensi Siswa Bimbingan';
    protected static ?string $pluralModelLabel = 'Absensi Siswa Bimbingan';
    protected static ?string $navigationGroup = 'Laporan'; // Sesuaikan grup
    protected static ?int $navigationSort = 1; // Urutan di navigasi

    // Hanya tampil untuk Dudi Pembimbing
    public static function shouldRegisterNavigation(): bool
    {
        return Auth::user()->isDudiPembimbing();
    }

    // Filter data: Hanya siswa bimbingan Dudi yang login
    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        $query = parent::getEloquentQuery()->with(['siswa.kelas', 'prakerin']); // Eager load relasi siswa & prakerin

        if ($user->isDudiPembimbing()) {
            // Filter berdasarkan ID pembimbing DUDI yang login
            $query->where('dudi_pembimbing_id', $user->ref_id)
                  // Hanya tampilkan siswa yang status prakerinnya 'berjalan'
                  ->where('status', 'berjalan');
        } else {
            // Jika bukan Dudi Pembimbing, jangan tampilkan data
            $query->whereRaw('1 = 0');
        }

        return $query;
    }

    // Kita tidak pakai form di sini, hanya tabel dan aksi
    public static function form(Form $form): Form
    {
        return $form->schema([]);
    }

    // Definisi Tabel
    public static function table(Table $table): Table
    {
        $timezone = session('user_timezone', config('app.timezone'));
        $today = Carbon::now($timezone)->toDateString();

        return $table
            ->columns([
                Tables\Columns\TextColumn::make('siswa.nama_siswa')
                    ->label('Nama Siswa')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('siswa.kelas.nama_kelas')
                    ->label('Kelas')
                    ->sortable(),
                // Kolom untuk menampilkan status absensi hari ini
                Tables\Columns\TextColumn::make('status_absensi_hari_ini')
                    ->label('Status Hari Ini')
                    ->getStateUsing(function (PrakerinSiswa $record) use ($today) {
                        // Cari data absensi siswa ini untuk hari ini
                        $absensi = Absensi::where('prakerin_siswa_id', $record->id)
                            ->whereDate('tanggal', $today)
                            ->first();

                        if ($absensi) {
                            if ($absensi->status_kehadiran === 'hadir') {
                                return 'Hadir (Masuk: ' . ($absensi->jam_masuk ? Carbon::parse($absensi->jam_masuk)->format('H:i') : '-') .
                                       ($absensi->jam_pulang ? ', Pulang: ' . Carbon::parse($absensi->jam_pulang)->format('H:i') : '') . ')';
                            } else {
                                return ucfirst($absensi->status_kehadiran) . ($absensi->keterangan ? ': ' . $absensi->keterangan : '');
                            }
                        }
                        return 'Belum Absen'; // Jika tidak ada record absensi
                    })
                    ->badge()
                    ->color(fn (string $state): string => match (strtolower(explode(' ', $state)[0])) {
                        'hadir' => 'success',
                        'izin' => 'warning',
                        'sakit' => 'danger',
                        'belum' => 'gray',
                        default => 'gray',
                    }),
            ])
            ->actions([
                // Aksi 1: Tandai Hadir
                Tables\Actions\Action::make('tandai_hadir')
                    ->label('Hadir')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->action(function (PrakerinSiswa $record) use ($timezone, $today) {
                        Absensi::updateOrCreate(
                            [ // Kondisi pencarian
                                'prakerin_siswa_id' => $record->id,
                                'tanggal' => $today,
                            ],
                            [ // Data yang diupdate atau dibuat
                                'siswa_id' => $record->siswa_id,
                                'jam_masuk' => Carbon::now($timezone)->toTimeString(),
                                'status_kehadiran' => 'hadir',
                                'keterangan' => null, // Hapus keterangan jika sebelumnya izin/sakit
                                'jam_pulang' => null, // Reset jam pulang jika diabsenkan hadir lagi
                            ]
                        );
                        Notification::make()->title('Berhasil')->body("{$record->siswa->nama_siswa} ditandai Hadir.")->success()->send();
                    })
                    ->visible(function (PrakerinSiswa $record) use ($today) {
                                            // Cek apakah SUDAH ADA record absensi APAPUN untuk hari ini
                                            $absensiExists = Absensi::where('prakerin_siswa_id', $record->id)
                                                                ->whereDate('tanggal', $today)
                                                                ->exists(); // Cukup cek 'exists()'

                                            // Tombol hadir hanya muncul jika BELUM ADA absensi sama sekali
                                            return !$absensiExists;
                    })
                    ->requiresConfirmation(),

                // Aksi 2: Tandai Izin/Sakit
                Tables\Actions\Action::make('tandai_izin_sakit')
                    ->label('Izin/Sakit')
                    ->icon('heroicon-o-exclamation-circle')
                    ->color('warning')
                    ->form([
                        Forms\Components\Select::make('status_kehadiran')
                            ->label('Status')
                            ->options([
                                'izin' => 'Izin',
                                'sakit' => 'Sakit',
                            ])
                            ->required(),
                        Forms\Components\Textarea::make('keterangan')
                            ->label('Alasan')
                            ->required()
                            ->maxLength(255),
                    ])
                    ->action(function (PrakerinSiswa $record, array $data) use ($timezone, $today) {
                        Absensi::updateOrCreate(
                            [ // Kondisi pencarian
                                'prakerin_siswa_id' => $record->id,
                                'tanggal' => $today,
                            ],
                            [ // Data yang diupdate atau dibuat
                                'siswa_id' => $record->siswa_id,
                                'status_kehadiran' => $data['status_kehadiran'],
                                'keterangan' => $data['keterangan'],
                                'jam_masuk' => null, // Reset jam masuk
                                'jam_pulang' => null, // Reset jam pulang
                            ]
                        );
                        Notification::make()->title('Berhasil')->body("{$record->siswa->nama_siswa} ditandai " . ucfirst($data['status_kehadiran']))->success()->send();
                    })
                    ->visible(function (PrakerinSiswa $record) use ($today) {
                                            // Cek apakah SUDAH ADA record absensi APAPUN untuk hari ini
                                            $absensiExists = Absensi::where('prakerin_siswa_id', $record->id)
                                                                ->whereDate('tanggal', $today)
                                                                ->exists(); // Cukup cek 'exists()'

                                            // Tombol hadir hanya muncul jika BELUM ADA absensi sama sekali
                                            return !$absensiExists;
                                        })
            ])
            ->bulkActions([]); // Tidak perlu bulk actions
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAbsensiPembimbings::route('/'),
            // Hapus route create dan edit jika tidak diperlukan
        ];
    }
}