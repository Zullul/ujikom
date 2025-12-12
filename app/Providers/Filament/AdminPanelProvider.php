<?php

namespace App\Providers\Filament;

use App\Filament\Pages\Auth\Login;
use App\Livewire\TimezoneHandler;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Pages;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Support\Facades\FilamentView;
use Filament\Widgets;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\AuthenticateSession;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\Support\Facades\Blade;
use Illuminate\View\Middleware\ShareErrorsFromSession;
use Livewire\Livewire;
use App\Filament\Pages\EditProfile;
use App\Filament\Resources\UserResource;
use Filament\Navigation\NavigationItem;
use Illuminate\Support\Facades\Auth;
use App\Http\Middleware\EnsureTahunAjaranIsSelected;
use Filament\Navigation\MenuItem; // <-- Tambahkan ini di atas
use App\Http\Middleware\CheckSchoolStatus;
use Filament\Support\Facades\FilamentAsset;
use Filament\Support\Assets\Css;
use Filament\Support\Assets\Js;


class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->id('admin')
            ->path('')
            ->login(Login::class)
            ->colors([
                'primary' => Color::Amber,
            ])
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\\Filament\\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\\Filament\\Pages')
            ->pages([
                Pages\Dashboard::class,
            ])
            ->userMenuItems([
                MenuItem::make()
                    ->label('Ganti Tahun Ajaran')
                    ->icon('heroicon-o-calendar-days')
                    ->url(fn(): string => route('filament.admin.pages.pilih-tahun-ajaran'))
                    ->visible(function (): bool {
                        $user = auth()->user();
                        
                        // Admin Sekolah: Selalu tampilkan
                        if ($user->isAdminSekolah()) {
                            return true;
                        }
                        
                        // Cek jumlah tahun ajaran yang dimiliki untuk guru dan dudi pembimbing
                        $tahunAjaranCount = 0;
                        
                        if ($user->isGuru()) {
                            $tahunAjaranCount = \App\Models\Guru::withoutGlobalScope(\App\Models\Scopes\TahunAjaranScope::class)
                                ->where('nama_guru', $user->name)
                                ->pluck('tahun_ajaran_id')
                                ->unique()
                                ->count();
                        } elseif ($user->isDudiPembimbing()) {
                            $tahunAjaranCount = \App\Models\DudiPembimbing::withoutGlobalScope(\App\Models\Scopes\TahunAjaranScope::class)
                                ->where('nama_pembimbing', $user->name)
                                ->pluck('tahun_ajaran_id')
                                ->unique()
                                ->count();
                        } 
                        
                        // Hanya tampil jika punya lebih dari 1 tahun ajaran
                        return $tahunAjaranCount > 1;
                    }),
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\\Filament\\Widgets')
            ->widgets([
                Widgets\AccountWidget::class,
                Widgets\FilamentInfoWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                VerifyCsrfToken::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->authMiddleware([
                Authenticate::class,
                CheckSchoolStatus::class,
                EnsureTahunAjaranIsSelected::class,
            ])
            ->navigationGroups([
                'Manajemen Sekolah',
                'Manajemen Data',
                'Manajemen Prakerin',
                'Laporan',
                'Pengaturan',
            ])
            ->navigationItems([
                // Tambahkan item navigasi 'Edit Profil' secara kondisional
                NavigationItem::make('Edit Profil')
                    ->url(fn(): string => EditProfile::getUrl())
                    ->icon('heroicon-o-user-circle')
                    ->visible(function (): bool {
                        $user = Auth::user();
                        return $user && ($user->isSiswa() || $user->isGuru() || $user->isDudiPembimbing());
                    }),
            ])
            // Mendaftarkan komponen Livewire untuk selalu aktif
            ->renderHook('panels::body.end', fn(): string => Blade::render('@livewire(\'timezone-handler\')'))
            ->assets([
            // Daftarkan CSS OpenLayers
            Css::make('openlayers-css', 'https://cdn.jsdelivr.net/npm/ol@v8.2.0/ol.css'),
            // Daftarkan JS OpenLayers
            Js::make('openlayers-js', 'https://cdn.jsdelivr.net/npm/ol@v8.2.0/dist/ol.js'),
        ]);
            
    }

    /**
     * Daftarkan semua komponen atau skrip yang dibutuhkan oleh panel.
     */
    public function boot(): void
    {
        // Daftarkan komponen Livewire TimezoneHandler
        Livewire::component('timezone-handler', TimezoneHandler::class);

        // Daftarkan skrip JavaScript untuk mendeteksi timezone
        FilamentView::registerRenderHook('panels::body.end', fn(): string => Blade::render('
            <script>
                document.addEventListener("DOMContentLoaded", () => {
                    // Gunakan sessionStorage agar timezone hanya dikirim sekali per sesi tab browser
                    if (!sessionStorage.getItem("timezone_sent")) {
                        const timezone = Intl.DateTimeFormat().resolvedOptions().timeZone;
                        Livewire.dispatch("setTimezone", { timezone: timezone });
                        sessionStorage.setItem("timezone_sent", "true");
                    }
                });
            </script>
        '));
    }
}
