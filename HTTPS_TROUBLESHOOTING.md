# Panduan HTTPS untuk Laragon - Jurnal PKL

## Masalah yang Diperbaiki
- POST request error saat menggunakan HTTPS
- Camera capture gagal mengirim data base64
- Geolocation tidak terdeteksi di HTTPS

## Perubahan yang Dilakukan

### 1. Environment Configuration (.env)
```env
APP_URL=https://jurnal-pkl.test
ASSET_URL=https://jurnal-pkl.test
SESSION_SECURE_COOKIE=false
SESSION_SAME_SITE=lax
```

### 2. Camera Capture Views
Updated 3 files untuk menggunakan DOM manipulation yang lebih reliable:
- `camera-capture-masuk.blade.php`
- `camera-capture-pulang.blade.php`  
- `camera-capture-izin-sakit.blade.php`

**Perubahan:**
- Menggunakan `querySelector` dengan escape proper untuk wire:model
- Trigger event `input` dan `change` untuk Livewire
- Fallback ke `$wire.set()` jika DOM method gagal
- Geolocation dengan options `enableHighAccuracy`

### 3. TrustProxies Middleware
```php
protected $proxies = '*';
```
Trust semua proxy untuk Laragon HTTPS local development.

## Cara Testing

1. **Buka aplikasi dengan HTTPS:**
   ```
   https://jurnal-pkl.test
   ```

2. **Test Absen Masuk:**
   - Login sebagai siswa
   - Klik "Absen Masuk Hari Ini"
   - Izinkan akses kamera dan lokasi
   - Ambil foto
   - Pastikan muncul "✅ Foto & Lokasi Siap!"
   - Klik "Konfirmasi Absen"
   - Check browser console (F12) untuk log:
     ```
     📸 Foto saved: data:image/jpeg;base64...
     📍 Location saved: -6.xxx, 106.xxx
     ```

3. **Test Absen Pulang:**
   - Pada baris absensi hari ini, klik "Absen Pulang"
   - Ambil foto
   - Konfirmasi
   - Check console untuk log foto pulang

4. **Test Izin/Sakit:**
   - Klik "Izin / Sakit"
   - Pilih status (Izin/Sakit)
   - Isi keterangan
   - Ambil foto (opsional) atau lewati
   - Kirim

## Troubleshooting

### Jika masih ada error POST:

1. **Check browser console (F12)** untuk error detail
2. **Pastikan Laragon SSL aktif:**
   - Menu Laragon → SSL → Enable
   - Certificate harus trusted di browser
3. **Clear browser cache dan cookies** untuk domain jurnal-pkl.test
4. **Check .env:**
   ```
   APP_URL=https://jurnal-pkl.test (bukan http)
   ```
5. **Restart Laragon** setelah enable SSL

### Jika kamera tidak jalan:

1. **Pastikan menggunakan HTTPS** (bukan HTTP)
2. **Allow camera permission** di browser
3. **Check browser support:**
   - Chrome/Edge: ✅ Full support
   - Firefox: ✅ Full support  
   - Safari: ⚠️ Perlu user interaction
4. **Jangan gunakan incognito/private** mode (camera bisa diblok)

### Jika lokasi tidak terdeteksi:

1. **Allow location permission** di browser
2. **Enable GPS** di device
3. **Check browser settings:**
   - Chrome: Settings → Privacy → Site Settings → Location
   - Pastikan jurnal-pkl.test di-allow
4. **Gunakan HTTPS** (geolocation diblok di HTTP)

### Jika data tidak tersimpan:

1. **Check Laravel logs:**
   ```
   storage/logs/laravel.log
   ```
2. **Check browser console** untuk error
3. **Test dengan foto lebih kecil** (resolusi camera)
4. **Increase PHP limits** di php.ini:
   ```ini
   upload_max_filesize = 10M
   post_max_size = 10M
   memory_limit = 256M
   ```

## Technical Notes

### Base64 Image Size
- Camera capture menghasilkan ~200-500KB base64 string
- Compressed dengan quality 0.9 (90%)
- Laravel handle max 2MB POST data (default)

### DOM vs Livewire
Method prioritas untuk HTTPS:
1. **DOM querySelector + dispatchEvent** (primary)
2. **$wire.set()** (fallback)

Kenapa DOM lebih reliable di HTTPS:
- Tidak ada size limit untuk string assignment
- Event dispatch trigger Livewire reactivity
- Bypass Livewire HTTP request yang bisa di-block CORS

### Geolocation Options
```javascript
{
    enableHighAccuracy: true,  // GPS presisi tinggi
    timeout: 10000,            // 10 detik timeout
    maximumAge: 0              // Tidak pakai cache
}
```

## Commands untuk Maintenance

```bash
# Clear all cache
php artisan config:clear
php artisan cache:clear
php artisan view:clear
php artisan route:clear

# Re-cache config
php artisan config:cache

# Check routes
php artisan route:list | grep absen

# Tail logs
tail -f storage/logs/laravel.log
```

## Security Notes

- `SESSION_SECURE_COOKIE=false` untuk local dev (Laragon self-signed cert)
- Untuk production dengan valid SSL: set `SESSION_SECURE_COOKIE=true`
- `$proxies = '*'` hanya untuk local dev, production pakai IP spesifik
- CORS sudah di-handle Laravel CSRF token

## Browser Compatibility

| Browser | Camera | Geolocation | Base64 POST |
|---------|--------|-------------|-------------|
| Chrome 90+ | ✅ | ✅ | ✅ |
| Edge 90+ | ✅ | ✅ | ✅ |
| Firefox 88+ | ✅ | ✅ | ✅ |
| Safari 14+ | ⚠️ | ✅ | ✅ |

⚠️ Safari needs user gesture to start camera

## Known Issues & Solutions

### Issue: "Tidak dapat mengakses kamera"
**Solution:** 
- Pastikan HTTPS aktif
- Browser permission granted
- Camera tidak dipakai aplikasi lain

### Issue: "Gagal mendapatkan lokasi"  
**Solution:**
- Enable GPS/Location services
- Allow browser location permission
- Check network connection

### Issue: POST error 503/419
**Solution:**
- Clear Laravel cache
- Check CSRF token
- Verify APP_KEY di .env
- Restart Laravel server

### Issue: Foto tidak tersimpan
**Solution:**  
- Check storage/app/public/absensi folder exists
- Run: `php artisan storage:link`
- Check folder permissions (775)
- Check PHP memory_limit

## Contact

Jika masih ada issue setelah mengikuti panduan ini:
1. Check Laravel logs: `storage/logs/laravel.log`
2. Check browser console (F12)
3. Screenshot error message
4. Include environment info (PHP version, Laravel version, browser)
