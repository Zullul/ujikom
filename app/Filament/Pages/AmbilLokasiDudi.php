<?php

namespace App\Filament\Pages;

use Filament\Pages\Page;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Notifications\Notification;
use Illuminate\Support\Facades\Auth;
use App\Models\Dudi;
use App\Models\DudiPembimbing;
use Filament\Support\Facades\FilamentAsset;
use Filament\Support\Assets\Css;
use Filament\Support\Assets\Js;
use Illuminate\Support\HtmlString; // <-- Pastikan ini ada

class AmbilLokasiDudi extends Page implements Forms\Contracts\HasForms
{
    use Forms\Concerns\InteractsWithForms;
    
    protected static ?string $navigationIcon = 'heroicon-o-map-pin';
    
    protected static ?string $navigationLabel = 'Ambil Lokasi DUDI';
    
    protected static ?string $title = 'Ambil Lokasi DUDI';
    
    protected static string $view = 'filament.pages.ambil-lokasi-dudi';
    
    protected static ?string $navigationGroup = 'Lokasi';
    
    protected static ?int $navigationSort = 1;
    
    public ?array $data = [];
    public $dudi;
    public bool $showMap = false; // "Saklar" untuk peta, default mati
    
    public static function shouldRegisterNavigation(): bool
    {
        return false;
    }
    
    public function mount(): void
    {
        // Daftarkan aset (CSS/JS) OpenLayers
        FilamentAsset::register([
            Css::make('openlayers-css', 'https://cdn.jsdelivr.net/npm/ol@v8.2.0/ol.css'),
            Js::make('openlayers-js', 'https://cdn.jsdelivr.net/npm/ol@v8.2.0/dist/ol.js'),
        ]);

        $user = Auth::user();
        $dudiPembimbing = DudiPembimbing::find($user->ref_id);
        
        $formData = ['latitude' => null, 'longitude' => null, 'radius' => 100];

        if ($dudiPembimbing && $dudiPembimbing->dudi) {
            $this->dudi = $dudiPembimbing->dudi;
            
            // Siapkan data untuk form
            $formData['latitude'] = $this->dudi->latitude;
            $formData['longitude'] = $this->dudi->longitude;
            $formData['radius'] = $this->dudi->radius ?? 100;
        }
        
        // Isi form dengan data yang ada
        $this->form->fill($formData);
        
        // Pastikan peta TIDAK tampil saat load, sesuai permintaan Anda
        $this->showMap = false;
    }
    
    public function form(Form $form): Form
    {
        return $form
            ->schema([
                // === AWAL DARI PANDUAN PENGGUNA ===
                Forms\Components\Section::make('Panduan Penggunaan')
                    ->description('Cara mengatur lokasi absensi untuk siswa PKL')
                    ->icon('heroicon-o-book-open')
                    ->schema([
                        Forms\Components\Placeholder::make('langkah_langkah')
                            ->label('Ikuti langkah-langkah mudah ini:')
                            ->content(new HtmlString(
                                '<ol class="list-decimal list-inside space-y-2 text-sm text-gray-600 dark:text-gray-300">' .
                                '<li>Berdirilah di titik pusat lokasi DUDI Anda (contoh: lobi atau pintu masuk utama).</li>' .
                                '<li>Klik tombol <strong>"Ambil Lokasi Saat Ini"</strong>. Pastikan Anda mengizinkan (Allow) browser untuk mengakses lokasi.</li>' .
                                '<li>Koordinat <strong>Latitude</strong> dan <strong>Longitude</strong> akan terisi otomatis.</li>' .
                                '<li>Sebuah pratinjau peta akan <strong>muncul</strong> di bawah.</li>' .
                                '<li>Atur <strong>Radius Absensi</strong> (dalam meter). Ini adalah jarak toleransi (contoh: 100 meter).</li>' .
                                '<li>Jika semua sudah benar, klik tombol <strong>"Simpan Lokasi"</strong>.</li>' .
                                '</ol>'
                            )),
                    ])
                    ->collapsible() // Dibuat bisa dilipat
                    ->collapsed(false), // Dibuat langsung terbuka
                // === AKHIR DARI PANDUAN PENGGUNA ===

                Forms\Components\Section::make('Informasi DUDI')
                    ->schema([
                        Forms\Components\Placeholder::make('nama_dudi')
                            ->label('Nama DUDI')
                            ->content(fn () => $this->dudi?->nama_dudi ?? '-'),
                        
                        Forms\Components\Placeholder::make('alamat')
                            ->label('Alamat')
                            ->content(fn () => $this->dudi?->alamat ?? '-'),
                    ])
                    ->columns(2),
                
                Forms\Components\Section::make('Lokasi DUDI')
                    ->description('Klik tombol "Ambil Lokasi Saat Ini" untuk mengambil koordinat lokasi Anda saat ini')
                    ->schema([
                        Forms\Components\TextInput::make('latitude')
                            ->label('Latitude')
                            ->numeric()
                            ->disabled(),
                            // Hapus ->reactive()
                        
                        Forms\Components\TextInput::make('longitude')
                            ->label('Longitude')
                            ->numeric()
                            ->disabled(),
                            // Hapus ->reactive()
                        
                        Forms\Components\TextInput::make('radius')
                            ->label('Radius Absensi (meter)')
                            ->required()
                            ->numeric()
                            ->default(100)
                            ->minValue(10)
                            ->maxValue(1000)
                            ->suffix('meter')
                            ->helperText('Jarak maksimal siswa dapat melakukan absensi dari lokasi DUDI (10-1000 meter)'),
                            // Hapus ->reactive() dan afterStateUpdated()
                    ])
                    ->columns(3),
            ])
            ->statePath('data');
    }
    
    public function simpanLokasi(): void
    {
        if (!$this->dudi) {
            Notification::make()
                ->title('DUDI tidak ditemukan')
                ->danger()
                ->send();
            return;
        }
        
        // Ambil data dari $this->data (yang sudah diisi oleh form)
        $formData = $this->form->getState();
        $latitude = $formData['latitude'] ?? null;
        $longitude = $formData['longitude'] ?? null;
        $radius = $formData['radius'] ?? null;

        // Validasi data
        if (!$latitude || !$longitude) {
            Notification::make()
                ->title('Lokasi belum diambil')
                ->body('Silakan klik tombol "Ambil Lokasi Saat Ini" terlebih dahulu')
                ->warning()
                ->send();
            return;
        }
        
        if (!$radius || $radius < 10 || $radius > 1000) {
            Notification::make()
                ->title('Radius tidak valid')
                ->body('Radius harus antara 10-1000 meter')
                ->warning()
                ->send();
            return;
        }
        
        try {
            $this->dudi->update([
                'latitude' => $latitude,
                'longitude' => $longitude,
                'radius' => $radius,
            ]);
            
            Notification::make()
                ->title('Lokasi berhasil disimpan')
                ->body('Data lokasi DUDI telah diperbarui')
                ->success()
                ->send();
                
            // Tampilkan peta lagi setelah disimpan
            $this->showMap = true;
                
        } catch (\Exception $e) {
            Notification::make()
                ->title('Gagal menyimpan lokasi')
                ->body($e.getMessage())
                ->danger()
                ->send();
        }
    }
}