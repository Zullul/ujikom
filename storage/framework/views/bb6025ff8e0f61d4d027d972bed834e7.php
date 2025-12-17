
<?php if (! $__env->hasRenderedOnce('a466de50-c507-485e-bd07-2c58c2d53519')): $__env->markAsRenderedOnce('a466de50-c507-485e-bd07-2c58c2d53519'); ?>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/ol@v8.2.0/ol.css">
<style>
    .map-container-custom {
        width: 100%;
        height: 400px !important;
        min-height: 400px !important;
        position: relative !important;
    }
    .map-container-custom .ol-viewport {
        position: relative !important;
    }
</style>
<?php endif; ?>


<script src="https://cdn.jsdelivr.net/npm/ol@v8.2.0/dist/ol.js"></script>

<div 
    x-data="{
        map: null,

        // Fungsi untuk menggambar peta
        initMap() {
            console.log('🗺️ initMap() dipanggil');
            
            // Cek jika OpenLayers (ol) sudah dimuat
            if (typeof ol === 'undefined') {
                console.warn('⚠️ OpenLayers belum dimuat, tunggu 200ms...');
                setTimeout(() => this.initMap(), 200);
                return;
            }
            console.log('✅ OpenLayers sudah dimuat');

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

            mapElement.innerHTML = ''; // Bersihkan peta lama
            console.log('🧹 Map container dibersihkan');

            // Jika tidak ada lat/lng, tampilkan pesan
            if (!latitude || !longitude) {
                console.warn('⚠️ Latitude atau Longitude kosong');
                mapElement.innerHTML = '<div class=&quot;flex items-center justify-center h-full text-gray-500&quot;>Ambil lokasi untuk melihat pratinjau peta</div>';
                return;
            }

            console.log('🌍 Mulai membuat peta...');
            const center = ol.proj.fromLonLat([longitude, latitude]);
            console.log('📌 Center coordinates:', center);

            console.log('📍 Membuat marker feature...');
            const markerFeature = new ol.Feature({
                geometry: new ol.geom.Point(center),
            });

            // String SVG untuk marker
            const markerIcon = 'data:image/svg+xml;utf8,<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; width=&quot;24&quot; height=&quot;36&quot; viewBox=&quot;0 0 24 36&quot;><path fill=&quot;%23EF4444&quot; d=&quot;M12 0C7.03 0 3 4.03 3 9c0 7.5 9 18 9 18s9-10.5 9-18c0-4.97-4.03-9-9-9zm0 12c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z&quot;/></svg>';

            const markerStyle = new ol.style.Style({
                image: new ol.style.Icon({
                    anchor: [0.5, 1],
                    src: markerIcon,
                    scale: 1.5
                })
            });
            markerFeature.setStyle(markerStyle);
            console.log('✅ Marker feature dibuat');

            console.log('🔵 Membuat circle feature dengan radius:', radius);
            const circleFeature = new ol.Feature({
                geometry: new ol.geom.Circle(center, radius),
            });

            const circleStyle = new ol.style.Style({
                stroke: new ol.style.Stroke({ color: 'rgba(59, 130, 246, 0.8)', width: 2 }),
                fill: new ol.style.Fill({ color: 'rgba(96, 165, 250, 0.25)' }),
            });
            circleFeature.setStyle(circleStyle);
            console.log('✅ Circle feature dibuat');

            console.log('🎨 Membuat vector layer...');
            const vectorSource = new ol.source.Vector({
                features: [circleFeature, markerFeature],
            });

            const vectorLayer = new ol.layer.Vector({
                source: vectorSource,
            });
            console.log('✅ Vector layer dibuat');

            console.log('🗺️ Membuat OpenLayers Map...');
            console.log('📏 Map container dimensions:', {
                width: mapElement.offsetWidth,
                height: mapElement.offsetHeight,
                clientWidth: mapElement.clientWidth,
                clientHeight: mapElement.clientHeight
            });
            
            try {
                this.map = new ol.Map({
                    target: mapElement,
                    layers: [
                        new ol.layer.Tile({ source: new ol.source.OSM() }),
                        vectorLayer
                    ],
                    view: new ol.View({ center: center, zoom: 17 })
                });
                console.log('✅ Map berhasil dibuat!', this.map);
                
                // Force update size setelah 100ms
                setTimeout(() => {
                    console.log('🔄 Update map size...');
                    this.map.updateSize();
                    console.log('📏 Updated map size');
                }, 100);
                
            } catch (error) {
                console.error('❌ Error membuat map:', error);
                return;
            }

            console.log('📐 Fitting map ke extent...');
            const extent = circleFeature.getGeometry().getExtent();
            this.map.getView().fit(extent, { padding: [50, 50, 50, 50] });
            
            // Render ulang setelah fit
            setTimeout(() => {
                console.log('🎨 Rendering map...');
                this.map.render();
                console.log('🎉 Peta berhasil ditampilkan!');
            }, 150);
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
        setTimeout(() => initMap(), 300);
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

    <?php if (isset($component)) { $__componentOriginal6330f08526bbb3ce2a0da37da512a11f = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal6330f08526bbb3ce2a0da37da512a11f = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'filament::components.button.index','data' => ['type' => 'button','color' => 'info','icon' => 'heroicon-o-map-pin','@click' => 'console.log(\'🖱️ Button Ambil Lokasi diklik\'); getLocation()','class' => 'mb-4']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('filament::button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['type' => 'button','color' => 'info','icon' => 'heroicon-o-map-pin','@click' => 'console.log(\'🖱️ Button Ambil Lokasi diklik\'); getLocation()','class' => 'mb-4']); ?>
        Ambil Lokasi Saat Ini
     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal6330f08526bbb3ce2a0da37da512a11f)): ?>
<?php $attributes = $__attributesOriginal6330f08526bbb3ce2a0da37da512a11f; ?>
<?php unset($__attributesOriginal6330f08526bbb3ce2a0da37da512a11f); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal6330f08526bbb3ce2a0da37da512a11f)): ?>
<?php $component = $__componentOriginal6330f08526bbb3ce2a0da37da512a11f; ?>
<?php unset($__componentOriginal6330f08526bbb3ce2a0da37da512a11f); ?>
<?php endif; ?>

    <div 
        wire:ignore 
        x-ref="mapContainer" 
        class="map-container-custom rounded-lg border-2 border-gray-300 dark:border-gray-600"
        style="background: #f0f0f0;"
        x-init="console.log('🗺️ Map container mounted:', $el); console.log('📏 Container size:', $el.offsetWidth, 'x', $el.offsetHeight)"
    >
        <div style="padding: 20px; text-align: center; color: #666;">Memuat peta...</div>
    </div>

</div><?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/actions/set-lokasi-action.blade.php ENDPATH**/ ?>