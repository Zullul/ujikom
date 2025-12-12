<div x-data="{
    stream: null,
    capturedImage: null,
    errorMessage: '',
    async init() { await this.startCamera(); },
    async startCamera() {
        try {
            this.stream = await navigator.mediaDevices.getUserMedia({ video: { facingMode: 'user', width: { ideal: 1280 }, height: { ideal: 720 } } });
            this.$refs.video.srcObject = this.stream;
            this.errorMessage = '';
        } catch (error) {
            console.error('Error accessing camera:', error);
            this.errorMessage = 'Tidak dapat mengakses kamera. Pastikan izin akses kamera telah diberikan dan gunakan HTTPS.';
        }
    },
    capturePhoto() {
        const video = this.$refs.video;
        const canvas = this.$refs.canvas;
        const context = canvas.getContext('2d');
        canvas.width = video.videoWidth;
        canvas.height = video.videoHeight;
        context.save();
        context.scale(-1, 1);
        context.drawImage(video, -canvas.width, 0, canvas.width, canvas.height);
        context.restore();
        this.capturedImage = canvas.toDataURL('image/jpeg', 0.9);
        const hiddenFoto = document.querySelector('input[id=\'foto_masuk_data_input\']');
        if (hiddenFoto) {
            hiddenFoto.value = this.capturedImage;
            hiddenFoto.dispatchEvent(new Event('input', { bubbles: true }));
            hiddenFoto.dispatchEvent(new Event('change', { bubbles: true }));
            console.log('📸 Foto saved');
        }
        this.stopCamera();
        this.getLocation();
    },
    getLocation() {
        if (!navigator.geolocation) { this.errorMessage = 'Browser tidak mendukung Geolocation'; return; }
        navigator.geolocation.getCurrentPosition((position) => {
            const hiddenLat = document.querySelector('input[id=\'latitude_input\']');
            const hiddenLng = document.querySelector('input[id=\'longitude_input\']');
            if (hiddenLat && hiddenLng) {
                hiddenLat.value = position.coords.latitude;
                hiddenLng.value = position.coords.longitude;
                hiddenLat.dispatchEvent(new Event('input', { bubbles: true }));
                hiddenLat.dispatchEvent(new Event('change', { bubbles: true }));
                hiddenLng.dispatchEvent(new Event('input', { bubbles: true }));
                hiddenLng.dispatchEvent(new Event('change', { bubbles: true }));
                console.log('📍 Location saved');
            }
        }, (error) => {
            console.error('Geolocation error:', error);
            this.errorMessage = 'Gagal mendapatkan lokasi. Pastikan GPS aktif dan izinkan akses lokasi.';
        }, { enableHighAccuracy: true, timeout: 10000, maximumAge: 0 });
    },
    retakePhoto() { this.capturedImage = null; this.startCamera(); },
    stopCamera() { if (this.stream) { this.stream.getTracks().forEach(track => track.stop()); this.stream = null; } }
}" class="p-4">
    <!-- Instruksi -->
    <div class="mb-4 p-3 bg-blue-50 dark:bg-blue-900/20 border border-blue-200 dark:border-blue-700 rounded-lg">
        <h4 class="font-semibold text-blue-900 dark:text-blue-100 mb-2">📋 Langkah Absen Masuk:</h4>
        <ol class="list-decimal list-inside text-sm text-blue-800 dark:text-blue-200 space-y-1">
            <li>Ambil foto wajah Anda</li>
            <li>Lokasi akan terdeteksi otomatis</li>
            <li>Klik "Konfirmasi Absen"</li>
        </ol>
    </div>

    <!-- Preview Kamera -->
    <div class="mb-4">
        <video 
            x-ref="video" 
            autoplay 
            playsinline
            x-show="!capturedImage"
            class="w-full max-w-lg mx-auto rounded-lg border-2 border-gray-300 dark:border-gray-600"
            style="max-height: 400px; transform: scaleX(-1);"
        ></video>
    </div>

    <!-- Canvas tersembunyi untuk capture -->
    <canvas x-ref="canvas" style="display: none;"></canvas>

    <!-- Preview hasil foto -->
    <div x-show="capturedImage" class="mb-4">
        <img 
            :src="capturedImage" 
            class="w-full max-w-lg mx-auto rounded-lg border-2 border-green-500"
            style="max-height: 400px;"
            alt="Captured"
        >
        <div class="mt-3 p-3 bg-green-100 dark:bg-green-900/30 border border-green-500 rounded-lg text-center">
            <p class="font-bold text-green-700 dark:text-green-300">✅ Foto & Lokasi Siap!</p>
            <p class="text-sm text-green-600 dark:text-green-400">Klik "Konfirmasi Absen" di bawah</p>
        </div>
    </div>

    <!-- Tombol Capture -->
    <div class="flex justify-center gap-3 mb-4">
        <button 
            type="button"
            @click="capturePhoto()"
            x-show="!capturedImage"
            class="px-6 py-3 bg-blue-100 dark:bg-blue-700 text-blue-900 dark:text-gray-100 rounded-lg hover:bg-blue-200 dark:hover:bg-blue-600 transition font-semibold border-2 border-blue-300 dark:border-blue-600"
        >
            📷 Ambil Foto
        </button>
        
        <button 
            type="button"
            @click="retakePhoto()"
            x-show="capturedImage"
            class="px-6 py-3 bg-yellow-100 dark:bg-yellow-700 text-yellow-900 dark:text-gray-100 rounded-lg hover:bg-yellow-200 dark:hover:bg-yellow-600 transition font-semibold border-2 border-yellow-300 dark:border-yellow-600"
        >
            🔄 Foto Ulang
        </button>
    </div>

    <!-- Error message -->
    <div x-show="errorMessage" class="p-3 bg-red-100 dark:bg-red-900 border border-red-400 dark:border-red-600 text-red-700 dark:text-red-200 rounded-lg">
        <p x-text="errorMessage" class="text-sm"></p>
    </div>

    <!-- Info -->
    <div class="text-center text-sm text-gray-600 dark:text-gray-400">
        <p>📸 Pastikan wajah Anda terlihat jelas</p>
    </div>
</div>
