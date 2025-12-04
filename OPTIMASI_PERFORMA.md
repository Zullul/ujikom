# Panduan Optimasi Performa Filament v3 - Jurnal PKL

## 🚀 Masalah yang Dihadapi
- Load halaman lambat setelah login
- Transisi antar halaman lambat
- Create, Update, Delete terasa lambat

## ✅ Solusi Optimasi (Tanpa Mengubah Struktur Code)

### 1. **PERBAIKAN URGENT - Duplikasi Class**
Ada duplikasi class `RefleksiMingguan` yang harus diperbaiki terlebih dahulu:

**Lokasi file yang bentrok:**
- `app/Filament/Pages/RefleksiMingguan.php`
- `app/Filament/Pages/Auth/RefleksiMingguan.php`

**Solusi:** Rename salah satu class atau hapus yang tidak terpakai.

---

### 2. **Cache Laravel (WAJIB)**

```powershell
# Clear cache dulu
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan cache:clear
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan config:clear
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan route:clear
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan view:clear

# Kemudian cache semua (setelah duplikasi class diperbaiki)
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan config:cache
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan route:cache
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan view:cache
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan filament:cache-components
```

---

### 3. **Optimasi Database**

#### A. Tambahkan Index pada Tabel yang Sering Di-query

Buat migration baru untuk menambah index:

```powershell
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan make:migration add_indexes_for_performance
```

Isi migration dengan:

```php
public function up()
{
    Schema::table('prakerin_siswas', function (Blueprint $table) {
        $table->index('siswa_id');
        $table->index('guru_pembimbing_id');
        $table->index('dudi_pembimbing_id');
        $table->index('status');
        $table->index(['siswa_id', 'status']);
    });
    
    Schema::table('penilaian_pkls', function (Blueprint $table) {
        $table->index('prakerin_siswa_id');
    });
    
    Schema::table('penilaian_pkl_details', function (Blueprint $table) {
        $table->index('penilaian_pkl_id');
    });
    
    Schema::table('jurnal_harians', function (Blueprint $table) {
        $table->index('prakerin_siswa_id');
        $table->index('tanggal');
        $table->index(['prakerin_siswa_id', 'tanggal']);
    });
    
    Schema::table('absensis', function (Blueprint $table) {
        $table->index('prakerin_siswa_id');
        $table->index('tanggal');
        $table->index(['prakerin_siswa_id', 'tanggal']);
    });
}
```

#### B. Eager Loading di Resources

Sudah ada di code Anda, pastikan semua Resource menggunakan eager loading:

```php
// Contoh di PenilaianPklResource
public static function getEloquentQuery(): Builder
{
    return parent::getEloquentQuery()
        ->with([
            'prakerinSiswa.siswa.kelas',
            'prakerinSiswa.siswa.jurusan',
            'prakerinSiswa.dudi',
            'details.tujuanPembelajaran'
        ]);
}
```

---

### 4. **Optimasi Composer (Autoloader)**

```powershell
# Optimize autoloader
composer dump-autoload -o

# Update composer dengan optimasi
composer install --optimize-autoloader --no-dev
```

**CATATAN:** `--no-dev` hanya untuk production, untuk development gunakan:
```powershell
composer install --optimize-autoloader
```

---

### 5. **Konfigurasi PHP (php.ini)**

Edit file: `C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.ini`

Tingkatkan nilai berikut:

```ini
memory_limit = 512M  ; dari 256M
max_execution_time = 120  ; dari 60
opcache.enable = 1
opcache.memory_consumption = 256
opcache.interned_strings_buffer = 16
opcache.max_accelerated_files = 20000
opcache.revalidate_freq = 60
opcache.fast_shutdown = 1
realpath_cache_size = 4096K
realpath_cache_ttl = 600
```

Setelah edit, restart Laragon.

---

### 6. **Optimasi Filament Spesifik**

#### A. Lazy Load Widgets

Edit di `FilamentPanelProvider` atau di Dashboard page:

```php
// Jangan load semua widget sekaligus
protected function getHeaderWidgets(): array
{
    return [
        // Widget::make()->lazy() // tambahkan ->lazy()
    ];
}
```

#### B. Pagination

Di setiap Resource, set default per page lebih kecil:

```php
protected static ?string $recordTitleAttribute = 'name';
public static function table(Table $table): Table
{
    return $table
        ->defaultPaginationPageOption(10) // dari 25 atau 50
        ->poll('30s') // jangan terlalu sering polling
        ->deferLoading();
}
```

#### C. Disable Polling di Table

Jika tidak butuh real-time update:

```php
public static function table(Table $table): Table
{
    return $table
        ->poll(null) // disable polling
        ->deferLoading(); // defer loading untuk performa
}
```

---

### 7. **Session & Cache Driver**

Edit `.env`:

```env
# Dari file ke database atau redis (lebih cepat)
SESSION_DRIVER=database  # atau redis jika ada
CACHE_DRIVER=file  # atau redis jika tersedia
QUEUE_CONNECTION=database  # atau redis
```

Jika menggunakan database untuk session, jalankan:

```powershell
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan session:table
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan migrate
```

---

### 8. **Browser Caching**

Tambahkan di `public/.htaccess` (jika menggunakan Apache):

```apache
<IfModule mod_expires.c>
    ExpiresActive On
    ExpiresByType image/jpg "access plus 1 year"
    ExpiresByType image/jpeg "access plus 1 year"
    ExpiresByType image/gif "access plus 1 year"
    ExpiresByType image/png "access plus 1 year"
    ExpiresByType image/svg+xml "access plus 1 year"
    ExpiresByType text/css "access plus 1 month"
    ExpiresByType application/javascript "access plus 1 month"
    ExpiresByType application/pdf "access plus 1 month"
</IfModule>

<IfModule mod_deflate.c>
    AddOutputFilterByType DEFLATE text/plain
    AddOutputFilterByType DEFLATE text/html
    AddOutputFilterByType DEFLATE text/xml
    AddOutputFilterByType DEFLATE text/css
    AddOutputFilterByType DEFLATE application/xml
    AddOutputFilterByType DEFLATE application/xhtml+xml
    AddOutputFilterByType DEFLATE application/rss+xml
    AddOutputFilterByType DEFLATE application/javascript
    AddOutputFilterByType DEFLATE application/x-javascript
</IfModule>
```

---

### 9. **Vite Build untuk Production**

```powershell
npm run build
```

Ini akan minify dan bundle semua assets.

---

### 10. **Query Optimization - Tambahan**

Buat Service Provider untuk global query optimization:

```powershell
C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe artisan make:provider OptimizationServiceProvider
```

Di `app/Providers/OptimizationServiceProvider.php`:

```php
<?php

namespace App\Providers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\ServiceProvider;

class OptimizationServiceProvider extends ServiceProvider
{
    public function boot()
    {
        // Prevent lazy loading di production
        Model::preventLazyLoading(! app()->isProduction());
        
        // Prevent silently discarding attributes
        Model::preventSilentlyDiscardingAttributes(! app()->isProduction());
        
        // Prevent accessing missing attributes
        Model::preventAccessingMissingAttributes(! app()->isProduction());
    }
}
```

Daftarkan di `config/app.php`:

```php
'providers' => [
    // ...
    App\Providers\OptimizationServiceProvider::class,
],
```

---

### 11. **Monitoring Performance**

Install Laravel Debugbar untuk development:

```powershell
composer require barryvdh/laravel-debugbar --dev
```

Lihat query yang lambat dan optimize.

---

## 📋 Checklist Eksekusi

- [ ] 1. Perbaiki duplikasi class RefleksiMingguan
- [ ] 2. Clear semua cache
- [ ] 3. Jalankan cache:config, route:cache, view:cache
- [ ] 4. Buat migration untuk index database
- [ ] 5. Jalankan `composer dump-autoload -o`
- [ ] 6. Edit php.ini untuk opcache
- [ ] 7. Restart Laragon
- [ ] 8. Tambahkan ->deferLoading() di table
- [ ] 9. Set pagination default ke 10
- [ ] 10. Jalankan `npm run build`
- [ ] 11. Test performa

---

## 🎯 Expected Results

Setelah optimasi:
- Login → Dashboard: **< 2 detik**
- Pindah halaman: **< 1 detik**
- Load table data: **< 1 detik**
- Create/Update/Delete: **< 1 detik**

---

## ⚠️ PENTING - Urutan Eksekusi

1. **WAJIB** perbaiki duplikasi class dulu
2. Clear cache
3. Tambah index database
4. Cache ulang
5. Optimize composer
6. Edit php.ini
7. Restart server
8. Test!

---

## 📞 Troubleshooting

Jika masih lambat:
1. Cek query dengan Debugbar
2. Cek N+1 query problem
3. Tambah index di tabel yang sering di-query
4. Gunakan Redis jika memungkinkan
5. Consider using Queue untuk proses berat
