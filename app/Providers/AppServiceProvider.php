<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Models\Siswa;
use App\Models\Guru;
use App\Models\Dudi;
use App\Models\Sekolah; // 1. Tambahkan use statement untuk Sekolah
use App\Observers\SiswaObserver;
use App\Observers\GuruObserver;
use App\Observers\DudiObserver;
use App\Observers\SekolahObserver; // 2. Tambahkan use statement untuk SekolahObserver
use App\Models\DudiPembimbing;
use App\Observers\DudiPembimbingObserver;
use App\Models\PrakerinSiswa; // Tambahkan ini
use App\Observers\PrakerinSiswaObserver; // Tambahkan ini
use Illuminate\Database\Eloquent\Builder;

class AppServiceProvider extends ServiceProvider
{
    // ...

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Siswa::observe(SiswaObserver::class);
        Guru::observe(GuruObserver::class);
        Dudi::observe(DudiObserver::class); // ✅ Aktifkan observer Dudi
        Sekolah::observe(SekolahObserver::class); // 3. Tambahkan baris ini
        DudiPembimbing::observe(DudiPembimbingObserver::class);
        PrakerinSiswa::observe(PrakerinSiswaObserver::class);
    }
}
