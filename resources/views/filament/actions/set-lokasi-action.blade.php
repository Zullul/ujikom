{{-- Load local Leaflet assets --}}
@once
<link rel="stylesheet" href="{{ asset('css/leaflet.css') }}">
<style>
    .map-container-custom {
        width: 100%;
        height: 400px !important;
        min-height: 400px !important;
        position: relative !important;
    }
    .leaflet-container { height: 100%; width: 100%; }
    .custom-marker { display: flex; align-items: center; justify-content: center; }
    .custom-marker div { width: 14px; height: 14px; border-radius: 9999px; background-color: #ef4444; box-shadow: 0 0 0 2px #ffffff; }
    .map-container-custom .leaflet-pane { position: absolute !important; }
    .map-container-custom .leaflet-overlay-pane { position: absolute !important; }
    .map-container-custom .leaflet-marker-pane { position: absolute !important; }
    .map-container-custom .leaflet-popup-pane { position: absolute !important; }
    .map-container-custom .leaflet-tile-pane { position: absolute !important; }
</style>
@endonce
<script src="{{ asset('js/leaflet.js') }}"></script>

<div 
    x-data="{
        map: null,

        // Fungsi untuk menggambar peta
        initMap() {
            console.log('🗺️ initMap() dipanggil');
            // Cek jika Leaflet (L) sudah dimuat
            if (typeof L === 'undefined') {
                console.warn('⚠️ Leaflet belum dimuat, tunggu 200ms...');
                setTimeout(() => this.initMap(), 200);
                return;
            }
            console.log('✅ Leaflet sudah dimuat');

            // Cek $wire
            if (typeof $wire === 'undefined') {
                console.error('❌ $wire tidak tersedia!');
                return;
            }
            console.log('✅ $wire tersedia');

            // Cek mountedTableActionsData
            console.log('📊 $wire.mountedTableActionsData:', $wire.mountedTableActionsData);
            
            if (!$wire.mountedTableActionsData || !$wire.mountedTableActionsData[0]) {
                console.error('❌ mountedTableActionsData[0] tidak tersedia!');
                return;
            }

            // Ambil data dari Livewire
            const latitude = $wire.mountedTableActionsData[0].latitude;
            const longitude = $wire.mountedTableActionsData[0].longitude;
            const radius = $wire.mountedTableActionsData[0].radius;

            console.log('📍 Data lokasi:', { latitude, longitude, radius });

            const mapElement = this.$refs.mapContainer;
            console.log('🎯 Map element:', mapElement);
            
            if (!mapElement) {
                console.error('❌ Map container tidak ditemukan!');
                return;
            }

            // Bersihkan peta lama dan reset Leaflet instance jika ada
            if (this.map) {
                try { this.map.remove(); } catch (e) { console.warn('Leaflet remove() warning', e); }
                this.map = null;
            }
            if (mapElement._leaflet_id) {
                delete mapElement._leaflet_id;
            }
            mapElement.innerHTML = ''; // Bersihkan peta lama
            console.log('🧹 Map container dibersihkan');

            // Jika tidak ada lat/lng, tampilkan pesan
            if (!latitude || !longitude) {
                console.warn('⚠️ Latitude atau Longitude kosong');
                mapElement.innerHTML = '<div class=&quot;flex items-center justify-center h-full text-gray-500&quot;>Ambil lokasi untuk melihat pratinjau peta</div>';
                return;
            }

            console.log('🌍 Mulai membuat peta...');
            const centerLatLng = [latitude, longitude];
            console.log('📌 Center coordinates:', centerLatLng);

            try {
                this.map = L.map(mapElement, {
                    zoomControl: true
                }).setView(centerLatLng, 17);

                L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                    maxZoom: 19,
                    attribution: '&copy; OpenStreetMap contributors'
                }).addTo(this.map);

                const markerIcon = L.divIcon({
                    className: 'custom-marker',
                    html: '<div></div>',
                    iconSize: [14, 14],
                    iconAnchor: [7, 7]
                });

                const marker = L.marker(centerLatLng, { icon: markerIcon }).addTo(this.map);
                console.log('✅ Marker dibuat');

                const circle = L.circle(centerLatLng, {
                    radius: radius,
                    color: 'rgba(59, 130, 246, 0.8)',
                    weight: 2,
                    fillColor: 'rgba(96, 165, 250, 0.25)',
                    fillOpacity: 0.25
                }).addTo(this.map);
                console.log('✅ Circle dibuat');

                // Fit ke bounds circle
                this.map.fitBounds(circle.getBounds(), { padding: [50, 50] });

                // Force invalidate size setelah 100ms
                setTimeout(() => {
                    console.log('🔄 Invalidate map size...');
                    this.map.invalidateSize();
                    console.log('📏 Invalidated map size');
                }, 100);
            } catch (error) {
                console.error('❌ Error membuat peta (Leaflet):', error);
                return;
            }
        },

        // Fungsi untuk mengambil lokasi Geolocation
        getLocation() {
            console.log('🌐 getLocation() dipanggil');
            
            if (!navigator.geolocation) {
                console.error('❌ Geolocation tidak didukung');
                new FilamentNotification().title('Geolocation tidak didukung').danger().send();
                return;
            }
            console.log('✅ Geolocation tersedia');
            new FilamentNotification().title('Mengambil lokasi...').info().send();

            navigator.geolocation.getCurrentPosition(
                (position) => {
                    const lat = position.coords.latitude;
                    const lng = position.coords.longitude;
                    console.log('📍 Lokasi ditemukan:', { lat, lng });

                    // Update data ke Livewire
                    console.log('💾 Menyimpan koordinat ke Livewire...');
                    $wire.set('mountedTableActionsData.0.latitude', lat);
                    $wire.set('mountedTableActionsData.0.longitude', lng);
                    console.log('✅ Koordinat tersimpan');

                    new FilamentNotification().title('Lokasi berhasil diambil!').success().send();

                    // Panggil initMap() untuk gambar ulang peta
                    console.log('🔄 Memanggil initMap() dalam 100ms...');
                    setTimeout(() => this.initMap(), 100);
                }, 
                (error) => {
                    console.error('❌ Error geolocation:', error);
                    let message = 'Terjadi kesalahan';
                    if (error.code === error.PERMISSION_DENIED) {
                        message = 'Anda menolak izin akses lokasi.';
                        console.error('❌ Izin lokasi ditolak');
                    } else if (error.code === error.POSITION_UNAVAILABLE) {
                        message = 'Lokasi tidak tersedia';
                        console.error('❌ Lokasi tidak tersedia');
                    } else if (error.code === error.TIMEOUT) {
                        message = 'Timeout saat mengambil lokasi';
                        console.error('❌ Timeout');
                    }
                    new FilamentNotification().title(message).danger().send();
                }
            );
        }
    }"
    x-init="
        console.log('🚀 Alpine component initialized');
        console.log('📦 Initial $wire data:', $wire);
        
        // Inisialisasi peta 300ms setelah modal dibuka
        console.log('⏰ Scheduling initMap() dalam 300ms...');
        setTimeout(() => { try { initMap(); } catch (e) { console.warn('Fallback to this.initMap()', e); this.initMap(); } }, 300);
    "
    @update-map.window="console.log('🔔 Event update-map diterima'); initMap()"
>

    <div class="mb-4 p-4 border rounded-lg bg-gray-50 dark:bg-gray-800">
        <h4 class="font-semibold text-gray-900 dark:text-gray-100">Panduan Mengatur Lokasi</h4>
        <ol class="list-decimal list-inside space-y-1 text-sm text-gray-600 dark:text-gray-300 mt-2">
            <li>Klik tombol <strong>"Ambil Lokasi Saat Ini"</strong>.</li>
            <li>Izinkan (Allow) browser untuk mengakses lokasi Anda.</li>
            <li>Form Latitude & Longitude akan terisi otomatis.</li>
            <li>Peta akan muncul di bawah untuk pratinjau.</li>
            <li>Ubah radius jika perlu, peta akan update otomatis.</li>
            <li>Klik "Simpan & Tutup" jika sudah selesai.</li>
        </ol>
    </div>

    <x-filament::button
        type="button"
        color="info"
        icon="heroicon-o-map-pin"
        @click="console.log('🖱️ Button Ambil Lokasi diklik'); getLocation()"
        class="mb-4"
    >
        Ambil Lokasi Saat Ini
    </x-filament::button>

    <div 
        wire:ignore 
        x-ref="mapContainer" 
        class="map-container-custom rounded-lg border-2 border-gray-300 dark:border-gray-600"
        style="background: #f0f0f0;"
        x-init="console.log('🗺️ Map container mounted:', $el); console.log('📏 Container size:', $el.offsetWidth, 'x', $el.offsetHeight)"
    >
        <div style="padding: 20px; text-align: center; color: #666;">Memuat peta...</div>
    </div>

</div>