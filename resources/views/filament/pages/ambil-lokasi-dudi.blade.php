<x-filament-panels::page>
    
    <div>
        <form wire:submit="simpanLokasi">
            {{ $this->form }}
        
            <div class="mt-6 flex gap-3">
                <x-filament::button
                    type="button"
                    onclick="getLocation()"
                    color="info"
                >
                    <x-heroicon-o-map-pin class="w-5 h-5 mr-2"/>
                    Ambil Lokasi Saat Ini
                </x-filament::button>
                
                <x-filament::button
                    type="submit"
                    color="success"
                >
                    <x-heroicon-o-check class="w-5 h-5 mr-2"/>
                    Simpan Lokasi
                </x-filament::button>
            </div>
        </form>
        
        {{-- Peta HANYA AKAN MUNCUL JIKA $showMap BERNILAI true --}}
        @if($showMap && $data['latitude'] && $data['longitude'])
        <div class="mt-6">
            <x-filament::section>
                <x-slot name="heading">
                    Pratinjau Peta & Radius Absensi
                </x-slot>
                
                <x-slot name="description">
                    Lokasi DUDI dengan area radius absensi {{ $data['radius'] ?? 100 }} meter
                </x-slot>
                
                <div class="w-full h-96 rounded-lg overflow-hidden border border-gray-200 dark:border-gray-700 mb-4" id="map"></div>
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="p-4 bg-gray-50 dark:bg-gray-900/20 rounded-lg border border-gray-200 dark:border-gray-700">
                        <h4 class="font-semibold text-sm text-gray-900 dark:text-gray-100 mb-3">📍 Koordinat Lokasi</h4>
                        <div class="space-y-2 text-sm">
                            <div class="flex justify-between">
                                <span class="text-gray-600 dark:text-gray-400">Latitude:</span>
                                <span class="font-medium text-gray-900 dark:text-gray-100">{{ number_format($data['latitude'], 6) }}</span>
                            </div>
                            <div class="flex justify-between">
                                <span class="text-gray-600 dark:text-gray-400">Longitude:</span>
                                <span class="font-medium text-gray-900 dark:text-gray-100">{{ number_format($data['longitude'], 6) }}</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="p-4 bg-blue-50 dark:bg-blue-900/20 rounded-lg border border-blue-200 dark:border-blue-700">
                        <h4 class="font-semibold text-sm text-blue-900 dark:text-blue-100 mb-3">🔵 Area Radius Absensi</h4>
                        <div class="space-y-2 text-sm">
                            <div class="flex justify-between items-center">
                                <span class="text-blue-600 dark:text-blue-400">Radius:</span>
                                <span class="font-bold text-lg text-blue-900 dark:text-blue-100">{{ $data['radius'] ?? 100 }} meter</span>
                            </div>
                            <div class="mt-3 pt-3 border-t border-blue-200 dark:border-blue-700">
                                <p class="text-xs text-blue-800 dark:text-blue-200">
                                    Siswa harus berada dalam jarak <strong>{{ $data['radius'] ?? 100 }} meter</strong> dari titik lokasi ini untuk dapat melakukan absensi.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                
            </x-filament::section>
            
            <div id="popup" style="display: none;"></div>
        </div>
        @endif
        
    </div> {{-- SEMUA SCRIPT ADA DI SINI, DI LUAR <div> --}}
    @push('scripts')
    <link rel="stylesheet" href="{{ asset('css/leaflet.css') }}">
    <script src="{{ asset('js/leaflet.js') }}"></script>
    <script>
        // --- FUNGSI UTAMA (Leaflet) ---
        function initMapWithCircle() {
            if (typeof L === 'undefined') {
                setTimeout(initMapWithCircle, 200);
                return;
            }
            const mapElement = document.getElementById('map');
            if (!mapElement) {
                return;
            }

            const latitude = @this.get('data.latitude');
            const longitude = @this.get('data.longitude');
            const radius = @this.get('data.radius') ?? 100;

            if (!latitude || !longitude) {
                return;
            }

            mapElement.innerHTML = '';

            const center = [latitude, longitude];

            const map = L.map('map', { zoomControl: true }).setView(center, 17);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                maxZoom: 19,
                attribution: '&copy; OpenStreetMap contributors'
            }).addTo(map);

            const markerIcon = L.divIcon({
                className: 'custom-marker',
                html: '<div></div>',
                iconSize: [14, 14],
                iconAnchor: [7, 7]
            });

            const marker = L.marker(center, { icon: markerIcon }).addTo(map);

            const circle = L.circle(center, {
                radius: radius,
                color: 'rgba(59, 130, 246, 0.8)',
                weight: 2,
                fillColor: 'rgba(96, 165, 250, 0.25)',
                fillOpacity: 0.25
            }).addTo(map);

            map.fitBounds(circle.getBounds(), { padding: [50, 50] });

            marker.bindPopup(`
                <div style="min-width: 200px; color: #1f2937;">
                    <h3 style="font-weight: bold; margin-bottom: 8px;">📍 Lokasi DUDI</h3>
                    <p style="margin: 4px 0; font-size: 12px; color: #4b5563;">Lat: ${latitude.toFixed(6)}</p>
                    <p style="margin: 4px 0; font-size: 12px; color: #4b5563;">Lng: ${longitude.toFixed(6)}</p>
                    <p style="margin: 4px 0; font-size: 12px; color: #3b82f6; font-weight: 600;">Radius: ${radius} meter</p>
                </div>
            `);

            marker.on('click', () => marker.openPopup());
        }

        // --- EVENT LISTENERS ---
        document.addEventListener('livewire:init', () => {
            @this.on('lokasiDiambil', () => {
                setTimeout(initMapWithCircle, 50);
            });
        });
    </script>
    
    <script>
        // --- FUNGSI GEOLOCATION ---
        function getLocation() {
            if (navigator.geolocation) {
                new FilamentNotification()
                    .title('Mengambil lokasi...')
                    .body('Mohon tunggu sebentar')
                    .info()
                    .send();
                navigator.geolocation.getCurrentPosition(showPosition, showError);
            } else {
                new FilamentNotification()
                    .title('Geolocation tidak didukung')
                    .body('Browser Anda tidak mendukung Geolocation API.')
                    .danger()
                    .send();
            }
        }
        
        function showPosition(position) {
            const latitude = position.coords.latitude;
            const longitude = position.coords.longitude;
            
            @this.set('data.latitude', latitude);
            @this.set('data.longitude', longitude);
            @this.set('showMap', true); 
            @this.dispatch('lokasiDiambil');
            
            new FilamentNotification()
                .title('Lokasi berhasil diambil!')
                .body('Koordinat: ' + latitude.toFixed(6) + ', ' + longitude.toFixed(6))
                .success()
                .duration(5000)
                .send();
        }
        
        function showError(error) {
            let message = '';
            switch(error.code) {
                case error.PERMISSION_DENIED:
                    message = "Anda menolak permintaan untuk mengakses lokasi. Silakan izinkan akses lokasi di pengaturan browser.";
                    break;
                case error.POSITION_UNAVAILABLE:
                    message = "Informasi lokasi tidak tersedia. Pastikan GPS/lokasi aktif di perangkat Anda.";
                    break;
                case error.TIMEOUT:
                    message = "Permintaan untuk mendapatkan lokasi timeout. Silakan coba lagi.";
                    break;
                case error.UNKNOWN_ERROR:
                    message = "Terjadi kesalahan yang tidak diketahui saat mengambil lokasi.";
                    break;
            }
            
            new FilamentNotification()
                .title('Gagal mengambil lokasi')
                .body(message)
                .danger()
                .send();
        }
    </script>
    @endpush

</x-filament-panels::page>