<div x-data="{
    status: 'idle',
    statusMessage: 'Klik tombol untuk mengambil lokasi...',
    coordinates: '',
    
    get statusClass() {
        const classes = {
            'idle': 'bg-gray-50 dark:bg-gray-800 border-gray-200 dark:border-gray-700',
            'loading': 'bg-blue-50 dark:bg-blue-900/20 border-blue-200 dark:border-blue-700',
            'success': 'bg-green-50 dark:bg-green-900/20 border-green-200 dark:border-green-700',
            'error': 'bg-red-50 dark:bg-red-900/20 border-red-200 dark:border-red-700'
        };
        return classes[this.status] || classes.idle;
    },
    
    getLocation() {
        console.log('📍 Memulai pengambilan lokasi...');
        
        if (!navigator.geolocation) {
            this.status = 'error';
            this.statusMessage = 'Browser Anda tidak mendukung Geolocation';
            console.error('❌ Geolocation tidak didukung');
            return;
        }
        
        this.status = 'loading';
        this.statusMessage = 'Mengambil lokasi Anda...';
        
        navigator.geolocation.getCurrentPosition(
            (position) => {
                const lat = position.coords.latitude;
                const lng = position.coords.longitude;
                
                console.log('✅ Lokasi berhasil diambil:', { lat, lng });
                
                // Set ke Livewire form - untuk table actions gunakan mountedTableActionsData
                try {
                    // Cek apakah ini table action atau header action
                    if (this.$wire.mountedTableActionsData !== undefined) {
                        // Table action (absen_pulang)
                        this.$wire.set('mountedTableActionsData.0.latitude', lat, false);
                        this.$wire.set('mountedTableActionsData.0.longitude', lng, false);
                        console.log('📍 Set via mountedTableActionsData.* (table action)');
                    } else if (this.$wire.mountedActionsData !== undefined) {
                        // Header action (absen_masuk)
                        this.$wire.set('mountedActionsData.0.latitude', lat, false);
                        this.$wire.set('mountedActionsData.0.longitude', lng, false);
                        console.log('📍 Set via mountedActionsData.* (header action)');
                    } else {
                        // Fallback ke data biasa
                        this.$wire.set('data.latitude', lat, false);
                        this.$wire.set('data.longitude', lng, false);
                        console.log('📍 Set via data.* (fallback)');
                    }
                } catch (error) {
                    console.error('❌ Error setting wire data:', error);
                }
                
                this.status = 'success';
                this.statusMessage = '✓ Lokasi berhasil terdeteksi!';
                this.coordinates = `Koordinat: ${lat.toFixed(6)}, ${lng.toFixed(6)}`;
                
                console.log('💾 Koordinat disimpan:', { lat, lng });
            },
            (error) => {
                console.error('❌ Error geolocation:', error);
                
                this.status = 'error';
                
                switch(error.code) {
                    case error.PERMISSION_DENIED:
                        this.statusMessage = 'Akses lokasi ditolak. Izinkan akses lokasi di pengaturan browser.';
                        break;
                    case error.POSITION_UNAVAILABLE:
                        this.statusMessage = 'Lokasi tidak tersedia. Pastikan GPS aktif.';
                        break;
                    case error.TIMEOUT:
                        this.statusMessage = 'Timeout. Coba lagi.';
                        break;
                    default:
                        this.statusMessage = 'Gagal mengambil lokasi.';
                }
            },
            {
                enableHighAccuracy: true,
                timeout: 10000,
                maximumAge: 0
            }
        );
    }
}" x-init="$nextTick(() => getLocation())">
    <div class="space-y-4">
        {{-- Status Lokasi --}}
        <div class="p-4 rounded-lg border" :class="statusClass">
            <div class="flex items-center gap-3">
                <div class="flex-shrink-0">
                    <svg x-show="status === 'loading'" class="animate-spin h-6 w-6 text-blue-600" fill="none" viewBox="0 0 24 24">
                        <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                        <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
                    </svg>
                    
                    <svg x-show="status === 'success'" class="h-6 w-6 text-green-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    
                    <svg x-show="status === 'error'" class="h-6 w-6 text-red-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                    </svg>
                    
                    <svg x-show="status === 'idle'" class="h-6 w-6 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"></path>
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"></path>
                    </svg>
                </div>
                
                <div class="flex-1">
                    <p class="font-medium" x-text="statusMessage"></p>
                    <p x-show="coordinates" class="text-xs text-gray-600 dark:text-gray-400 mt-1" x-text="coordinates"></p>
                </div>
            </div>
        </div>
        
        {{-- Informasi --}}
        <div class="bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-700 rounded-lg p-4">
            <div class="flex gap-3">
                <svg class="flex-shrink-0 w-5 h-5 text-blue-600 dark:text-blue-400 mt-0.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 16h-1v-4h-1m1-4h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"></path>
                </svg>
                <div class="text-sm text-blue-800 dark:text-blue-200">
                    <p class="font-medium mb-1">Informasi Absensi Lokasi:</p>
                    <ul class="list-disc list-inside space-y-1 text-xs">
                        <li>Lokasi GPS akan otomatis terdeteksi</li>
                        <li>Pastikan Anda berada di area DUDI</li>
                        <li>Izinkan akses lokasi saat diminta browser</li>
                        <li>GPS harus aktif di perangkat Anda</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
