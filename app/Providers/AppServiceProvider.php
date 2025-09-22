<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Filament\Facades\Filament;
use App\Models\Siswa;
use App\Models\Guru;
use App\Models\Dudi;
use App\Observers\SiswaObserver;
use App\Observers\GuruObserver;
use App\Observers\DudiObserver;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Siswa::observe(SiswaObserver::class);
        Guru::observe(GuruObserver::class);
        Dudi::observe(DudiObserver::class);
    }
}
