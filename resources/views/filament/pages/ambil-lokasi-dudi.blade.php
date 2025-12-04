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
    <script>
        // --- FUNGSI UTAMA ---
        function initMapWithCircle() {
            if (typeof ol === 'undefined') {
                setTimeout(initMapWithCircle, 300);
                return;
            }
            const mapElement = document.getElementById('map');
            if (!mapElement) {
                return;
            }

            // Ambil data TERBARU langsung dari komponen Livewire
            const latitude = @this.get('data.latitude');
            const longitude = @this.get('data.longitude');
            const radius = @this.get('data.radius') ?? 100; // Ambil radius dari form

            if (!latitude || !longitude) {
                return;
            }

            mapElement.innerHTML = ''; 
            
            const center = ol.proj.fromLonLat([longitude, latitude]);
            
            const markerFeature = new ol.Feature({
                geometry: new ol.geom.Point(center),
            });
            
            const markerStyle = new ol.style.Style({
                image: new ol.style.Icon({
                    anchor: [0.5, 1],
                    src: 'data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="36" viewBox="0 0 24 36"><path fill="%23EF4444" d="M12 0C7.03 0 3 4.03 3 9c0 7.5 9 18 9 18s9-10.5 9-18c0-4.97-4.03-9-9-9zm0 12c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/></svg>',
                    scale: 1.5
                })
            });
            markerFeature.setStyle(markerStyle);
            
            const circleFeature = new ol.Feature({
                geometry: new ol.geom.Circle(center, radius),
            });
            
            const circleStyle = new ol.style.Style({
                stroke: new ol.style.Stroke({
                    color: 'rgba(59, 130, 246, 0.8)',
                    width: 2,
                }),
                fill: new ol.style.Fill({
                    color: 'rgba(96, 165, 250, 0.25)',
                }),
            });
            circleFeature.setStyle(circleStyle);
            
            const vectorSource = new ol.source.Vector({
                features: [circleFeature, markerFeature],
            });
            
            const vectorLayer = new ol.layer.Vector({
                source: vectorSource,
            });
            
            const map = new ol.Map({
                target: 'map',
                layers: [
                    new ol.layer.Tile({
                        source: new ol.source.OSM()
                    }),
                    vectorLayer
                ],
                view: new ol.View({
                    center: center,
                    zoom: 17
                })
            });
            
            const extent = circleFeature.getGeometry().getExtent();
            map.getView().fit(extent, { padding: [50, 50, 50, 50] });
            
            const popup = new ol.Overlay({
                element: document.getElementById('popup'),
                positioning: 'bottom-center',
                stopEvent: false,
            });
            map.addOverlay(popup);
            
            map.on('click', function(evt) {
                const feature = map.forEachFeatureAtPixel(evt.pixel, function(feature) { return feature; });
                if (feature === markerFeature) {
                    const coordinates = feature.getGeometry().getCoordinates();
                    popup.setPosition(coordinates);
                    const popupElement = popup.getElement();
                    popupElement.innerHTML = `
                        <div style="background: white; padding: 12px; border-radius: 8px; box-shadow: 0 4px 6px rgba(0,0,0,0.1); min-width: 200px; color: #1f2937;">
                            <h3 style="font-weight: bold; margin-bottom: 8px;">📍 Lokasi DUDI</h3>
                            <p style="margin: 4px 0; font-size: 12px; color: #4b5563;">Lat: ${latitude.toFixed(6)}</p>
                            <p style="margin: 4px 0; font-size: 12px; color: #4b5563;">Lng: ${longitude.toFixed(6)}</p>
                            <p style="margin: 4px 0; font-size: 12px; color: #3b82f6; font-weight: 600;">Radius: ${radius} meter</p>
                        </div>
                    `;
                    popupElement.style.display = 'block';
                } else {
                    popup.getElement().style.display = 'none';
                }
            });
        }

        // --- EVENT LISTENERS ---
        document.addEventListener('livewire:init', () => {
            // HANYA dengarkan event 'lokasiDiambil'
            @this.on('lokasiDiambil', () => {
                // Panggil initMapWithCircle HANYA saat tombol diklik
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
            
            // Set state di $data
            @this.set('data.latitude', latitude);
            @this.set('data.longitude', longitude);
            
            // "Nyalakan saklar" untuk tampilkan peta
            @this.set('showMap', true); 
            
            // Kirim event ke listener 'lokasiDiambil'
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