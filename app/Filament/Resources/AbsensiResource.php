<?php

namespace App\Filament\Resources;

use App\Filament\Resources\AbsensiResource\Pages;
use App\Models\Absensi;
use App\Models\PrakerinSiswa;
use Carbon\Carbon;
use Filament\Forms;
use App\Models\Scopes\TahunAjaranScope;
use Filament\Forms\Form;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Infolist;
use Filament\Notifications\Notification;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;

class AbsensiResource extends Resource
{
    protected static ?string $model = Absensi::class;
    protected static ?string $navigationIcon = 'heroicon-o-finger-print';
    protected static ?string $navigationGroup = 'Laporan';
    protected static ?string $pluralModelLabel = 'Absensi';
    protected static ?string $navigationLabel = 'Absensi';
    protected static ?int $navigationSort = 1;

    public static function shouldRegisterNavigation(): bool
    {
        $user = Auth::user();
        return $user->isSiswa();
    }

    public static function getEloquentQuery(): Builder
    {
        $user = Auth::user();
        $query = parent::getEloquentQuery();
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');

        if ($selectedTahunAjaranId) {
            $query->whereHas('prakerinSiswa.prakerin', function (Builder $query) use ($selectedTahunAjaranId) {
                $query->where('tahun_ajaran_id', $selectedTahunAjaranId);
            });
        }

        if ($user->isSiswa()) {
            return $query->where('siswa_id', $user->ref_id);
        }
        return $query->whereRaw('1 = 0');
    }

    public static function form(Form $form): Form
    {
        return $form->schema([]);
    }

    // --- PERUBAHAN DI FUNGSI table() ---
    public static function table(Table $table): Table
    {
        $user = Auth::user();
        $timezone = session('user_timezone', config('app.timezone'));
        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $user->ref_id)->where('status', 'berjalan')->with('prakerin')->first();
        $bisaAbsen = false;
        if ($prakerinSiswa) {
            $tanggalMulai = Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai);
            $tanggalSelesai = Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai);
            $bisaAbsen = Carbon::now($timezone)->between($tanggalMulai, $tanggalSelesai);
        }
        
        // Cache query absensi hari ini untuk menghindari query duplicate
        $sudahAbsenHariIni = Absensi::where('siswa_id', $user->ref_id)
            ->whereDate('tanggal', today($timezone))
            ->exists();

        return $table
            ->columns([
                Tables\Columns\TextColumn::make('tanggal')->date('l, d M Y')->sortable(),
                Tables\Columns\TextColumn::make('jam_masuk')->time('H:i')->label('Jam Masuk'),
                Tables\Columns\ImageColumn::make('foto_masuk')
                    ->label('Foto Masuk')
                    ->circular()
                    ->defaultImageUrl(url('/images/no-image.png'))
                    ->visible(fn ($record) => ($record?->status_kehadiran) === 'hadir'),
                Tables\Columns\TextColumn::make('jam_pulang')->time('H:i')->label('Jam Pulang'),
                Tables\Columns\ImageColumn::make('foto_pulang')
                    ->label('Foto Pulang')
                    ->circular()
                    ->defaultImageUrl(url('/images/no-image.png'))
                    ->visible(fn ($record) => ($record?->status_kehadiran) === 'hadir'),
                Tables\Columns\BadgeColumn::make('status_kehadiran')
                    ->label('Status')
                    ->colors([
                        'success' => 'hadir',
                        'warning' => 'izin',
                        'danger' => 'sakit',
                        'secondary' => 'alpha',
                    ]),
                Tables\Columns\TextColumn::make('keterangan')
                    ->label('Keterangan')
                    ->limit(50)
                    ->tooltip(fn ($record) => $record?->keterangan)
                    ->visible(fn ($record) => in_array($record?->status_kehadiran, ['izin', 'sakit'])),
                Tables\Columns\ImageColumn::make('foto_izin_sakit')
                    ->label('Foto')
                    ->circular()
                    ->defaultImageUrl(url('/images/no-image.png'))
                    ->visible(fn ($record) => in_array($record?->status_kehadiran, ['izin', 'sakit'])),
            ])
            ->headerActions([
                Tables\Actions\Action::make('absen_masuk')
                    ->label('Absen Masuk Hari Ini')
                    ->icon('heroicon-o-arrow-right-on-rectangle')
                    ->color('success')
                    ->requiresConfirmation()
                    ->modalHeading('Absen Masuk')
                    ->modalSubmitActionLabel('Konfirmasi Absen')
                    ->modalIcon('heroicon-o-finger-print')
                    ->modalWidth('4xl')
                    ->action(function (array $data, array $arguments) use ($timezone, $prakerinSiswa) {
                        // Ambil data foto dan lokasi
                        $fotoData = $data['foto_masuk_data'] ?? null;
                        $latitude = $data['latitude'] ?? null;
                        $longitude = $data['longitude'] ?? null;
                        
                        // Debug log
                        \Log::info('Absen Masuk Data:', [
                            'foto_exists' => !empty($fotoData),
                            'foto_length' => $fotoData ? strlen($fotoData) : 0,
                            'latitude' => $latitude,
                            'longitude' => $longitude,
                        ]);
                        
                        // Validasi foto wajib - lebih permisif
                        if (empty($fotoData) || strlen($fotoData) < 100) {
                            Notification::make()
                                ->title('Foto Wajib')
                                ->body('Silakan ambil foto terlebih dahulu sebelum absen.')
                                ->warning()
                                ->send();
                            return;
                        }
                        
                        if (!$latitude || !$longitude) {
                            Notification::make()
                                ->title('Gagal Absen')
                                ->body('Lokasi tidak terdeteksi. Pastikan GPS/Lokasi aktif dan izinkan akses lokasi.')
                                ->danger()
                                ->send();
                            return;
                        }
                        
                        // Ambil lokasi DUDI
                        $dudi = $prakerinSiswa->dudi;
                        
                        if (!$dudi->latitude || !$dudi->longitude) {
                            Notification::make()
                                ->title('Lokasi DUDI Belum Diatur')
                                ->body('Lokasi DUDI belum ditentukan. Hubungi pembimbing DUDI Anda.')
                                ->warning()
                                ->send();
                            return;
                        }
                        
                        // Hitung jarak menggunakan Haversine formula
                        $jarak = self::hitungJarak(
                            $latitude, 
                            $longitude, 
                            $dudi->latitude, 
                            $dudi->longitude
                        );
                        
                        $radius = $dudi->radius ?? 100; // Default 100 meter
                        
                        // Validasi radius
                        if ($jarak > $radius) {
                            Notification::make()
                                ->title('Di Luar Jangkauan')
                                ->body("Anda berada {$jarak}m dari lokasi DUDI. Radius maksimal {$radius}m. Mohon mendekat ke lokasi DUDI.")
                                ->danger()
                                ->duration(8000)
                                ->send();
                            return;
                        }
                        
                        // Proses simpan foto dari camera capture (base64)
                        $fotoMasukPath = self::simpanFotoBase64($fotoData, 'absensi/masuk');
                        
                        // Jika validasi berhasil, buat absensi
                        Absensi::create([
                            'siswa_id' => Auth::user()->ref_id,
                            'prakerin_siswa_id' => $prakerinSiswa->id,
                            'tanggal' => Carbon::now($timezone)->toDateString(),
                            'jam_masuk' => Carbon::now($timezone)->toTimeString(),
                            'status_kehadiran' => 'hadir',
                            'foto_masuk' => $fotoMasukPath,
                        ]);
                        
                        Notification::make()
                            ->title('Berhasil Absen Masuk')
                            ->body("Anda berada {$jarak}m dari lokasi DUDI. Selamat bekerja!")
                            ->success()
                            ->send();
                    })
                    ->form(function () {
                        return [
                            Forms\Components\Placeholder::make('camera_preview')
                                ->label('')
                                ->content(new \Illuminate\Support\HtmlString(view('filament.actions.camera-capture-masuk')->render())),
                            Forms\Components\Hidden::make('foto_masuk_data')
                                ->id('foto_masuk_data_input')
                                ->reactive(),
                            Forms\Components\Hidden::make('latitude')
                                ->id('latitude_input')
                                ->reactive(),
                            Forms\Components\Hidden::make('longitude')
                                ->id('longitude_input')
                                ->reactive(),
                        ];
                    })
                    ->visible(fn() => $user->isSiswa() && $bisaAbsen && !$sudahAbsenHariIni),
                
                Tables\Actions\Action::make('izin_sakit')
                    ->label('Izin / Sakit')
                    ->icon('heroicon-o-exclamation-circle')
                    ->color('warning')
                    ->requiresConfirmation()
                    ->modalHeading('Input Izin / Sakit')
                    ->modalSubmitActionLabel('Kirim')
                    ->modalWidth('5xl')
                    ->form(function () {
                        return [
                            Forms\Components\Select::make('status_kehadiran')
                                ->label('Status')
                                ->options([
                                    'izin' => 'Izin',
                                    'sakit' => 'Sakit',
                                ])
                                ->required()
                                ->native(false),
                            Forms\Components\Textarea::make('keterangan')
                                ->label('Keterangan')
                                ->required()
                                ->rows(3)
                                ->placeholder('Contoh: Izin mengurus keperluan keluarga / Demam tinggi dan flu'),
                            Forms\Components\Placeholder::make('camera_preview')
                                ->label('Foto Pendukung (Opsional)')
                                ->content(new \Illuminate\Support\HtmlString(view('filament.actions.camera-capture-izin-sakit')->render())),
                            Forms\Components\Hidden::make('foto_izin_sakit_data'),
                        ];
                    })
                    ->action(function (array $data) use ($timezone, $prakerinSiswa) {
                        // Proses simpan foto dari camera capture (base64, opsional)
                        $fotoPath = null;
                        if (isset($data['foto_izin_sakit_data']) && $data['foto_izin_sakit_data']) {
                            $fotoPath = self::simpanFotoBase64($data['foto_izin_sakit_data'], 'absensi/izin-sakit');
                        }
                        
                        Absensi::create([
                            'siswa_id' => Auth::user()->ref_id,
                            'prakerin_siswa_id' => $prakerinSiswa->id,
                            'tanggal' => Carbon::now($timezone)->toDateString(),
                            'status_kehadiran' => $data['status_kehadiran'],
                            'keterangan' => $data['keterangan'],
                            'foto_izin_sakit' => $fotoPath,
                        ]);
                        
                        $statusLabel = $data['status_kehadiran'] === 'izin' ? 'Izin' : 'Sakit';
                        
                        Notification::make()
                            ->title("Data {$statusLabel} Berhasil Dikirim")
                            ->body("Data {$statusLabel} Anda telah tersimpan.")
                            ->success()
                            ->send();
                    })
                    ->visible(fn() => $user->isSiswa() && $bisaAbsen && !$sudahAbsenHariIni),
            ])
            ->actions([
                Tables\Actions\Action::make('absen_pulang')
                    ->label('Absen Pulang')
                    ->icon('heroicon-o-arrow-left-on-rectangle')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->modalHeading('Absen Pulang')
                    ->modalSubmitActionLabel('Konfirmasi Absen Pulang')
                    ->modalIcon('heroicon-o-clock')
                    ->modalWidth('4xl')
                    ->form(function () {
                        return [
                            Forms\Components\Placeholder::make('camera_preview')
                                ->label('')
                                ->content(new \Illuminate\Support\HtmlString(view('filament.actions.camera-capture-pulang')->render())),
                            Forms\Components\Hidden::make('foto_pulang_data'),
                        ];
                    })
                    ->action(function (Absensi $record, array $data) use ($timezone) {
                        // Validasi foto wajib
                        $fotoData = $data['foto_pulang_data'] ?? null;
                        if (!$fotoData) {
                            Notification::make()
                                ->title('Foto Wajib')
                                ->body('Silakan ambil foto terlebih dahulu.')
                                ->warning()
                                ->send();
                            return;
                        }
                        
                        // Proses simpan foto dari camera capture (base64)
                        $fotoPulangPath = self::simpanFotoBase64($fotoData, 'absensi/pulang');
                        
                        // Update jam pulang dan foto
                        $record->update([
                            'jam_pulang' => Carbon::now($timezone)->toTimeString(),
                            'foto_pulang' => $fotoPulangPath,
                        ]);
                        
                        Notification::make()
                            ->title('Berhasil Absen Pulang')
                            ->body('Selamat beristirahat!')
                            ->success()
                            ->send();
                    })
                    ->visible(fn($record) => $user->isSiswa() && $record && $record->tanggal->isToday($timezone) && $record->status_kehadiran === 'hadir' && is_null($record->jam_pulang)),
            ])
            ->defaultSort('tanggal', 'desc');
    }
    // --- AKHIR PERUBAHAN ---

    /**
     * Hitung jarak antara dua koordinat GPS menggunakan Haversine formula
     * @return int Jarak dalam meter
     */
    protected static function hitungJarak($lat1, $lon1, $lat2, $lon2): int
    {
        $earthRadius = 6371000; // Radius bumi dalam meter
        
        $latFrom = deg2rad($lat1);
        $lonFrom = deg2rad($lon1);
        $latTo = deg2rad($lat2);
        $lonTo = deg2rad($lon2);
        
        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;
        
        $a = sin($latDelta / 2) * sin($latDelta / 2) +
             cos($latFrom) * cos($latTo) *
             sin($lonDelta / 2) * sin($lonDelta / 2);
        
        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        
        $distance = $earthRadius * $c;
        
        return round($distance); // Return dalam meter (integer)
    }

    /**
     * Simpan foto dari base64 data (dari camera capture)
     * @param string $base64Data Base64 encoded image data
     * @param string $path Path folder penyimpanan
     * @return string|null Path file yang tersimpan
     */
    protected static function simpanFotoBase64(string $base64Data, string $path = 'absensi'): ?string
    {
        try {
            // Extract base64 string (remove data:image/jpeg;base64, prefix)
            if (strpos($base64Data, 'data:image') === 0) {
                $base64Data = substr($base64Data, strpos($base64Data, ',') + 1);
            }
            
            // Decode base64
            $imageData = base64_decode($base64Data);
            if ($imageData === false) {
                return null;
            }
            
            // Generate filename
            $filename = uniqid() . '_' . time() . '.jpg';
            $storagePath = storage_path('app/public/' . $path);
            
            // Buat folder jika belum ada
            if (!file_exists($storagePath)) {
                mkdir($storagePath, 0755, true);
            }
            
            $fullPath = $storagePath . '/' . $filename;
            
            // Load image dari string
            $image = imagecreatefromstring($imageData);
            if ($image === false) {
                return null;
            }
            
            // Simpan dengan kompresi 90%
            imagejpeg($image, $fullPath, 90);
            imagedestroy($image);
            
            return $path . '/' . $filename;
        } catch (\Exception $e) {
            logger()->error('Error saving base64 image: ' . $e->getMessage());
            return null;
        }
    }

    /**
     * Kompresi foto dengan quality 90% dan simpan ke storage
     * @param \Illuminate\Http\UploadedFile|string $file File yang diupload
     * @param string $path Path folder penyimpanan
     * @return string Path file yang tersimpan
     */
    protected static function kompresiFoto($file, string $path = 'absensi'): string
    {
        // Jika file sudah berupa string (path), return langsung
        if (is_string($file)) {
            return $file;
        }

        $extension = $file->getClientOriginalExtension();
        $filename = uniqid() . '_' . time() . '.' . $extension;
        $storagePath = storage_path('app/public/' . $path);
        
        // Buat folder jika belum ada
        if (!file_exists($storagePath)) {
            mkdir($storagePath, 0755, true);
        }
        
        $fullPath = $storagePath . '/' . $filename;
        
        // Load gambar berdasarkan tipe
        $image = null;
        switch (strtolower($extension)) {
            case 'jpg':
            case 'jpeg':
                $image = imagecreatefromjpeg($file->getRealPath());
                break;
            case 'png':
                $image = imagecreatefrompng($file->getRealPath());
                break;
            default:
                // Jika format tidak didukung, simpan langsung
                $file->move($storagePath, $filename);
                return $path . '/' . $filename;
        }
        
        if ($image) {
            // Kompres dengan quality 90%
            if (strtolower($extension) === 'png') {
                // PNG compression (0-9, 9 = maksimal kompresi)
                imagepng($image, $fullPath, 1); // 1 = kompresi tinggi
            } else {
                // JPEG compression (0-100, 90 = quality tinggi dengan kompresi)
                imagejpeg($image, $fullPath, 90);
            }
            
            imagedestroy($image);
        }
        
        return $path . '/' . $filename;
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListAbsensis::route('/'),
        ];
    }
}