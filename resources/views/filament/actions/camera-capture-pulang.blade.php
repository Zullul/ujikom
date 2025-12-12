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
        try {
            if (this.$wire && this.$wire.mountedTableActionsData) {
                this.$wire.set('mountedTableActionsData.0.foto_pulang_data', this.capturedImage, false);
                console.log('📸 Foto pulang saved');
            }
        } catch (error) { console.error('Error saving photo:', error); }
        this.stopCamera();
    },
    retakePhoto() { this.capturedImage = null; this.startCamera(); },
    stopCamera() { if (this.stream) { this.stream.getTracks().forEach(track => track.stop()); this.stream = null; } }
}" class="p-4">
    <!-- Instruksi -->
    <div class="mb-4 p-3 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-700 rounded-lg">
        <h4 class="font-semibold text-red-900 dark:text-red-100 mb-2">📋 Langkah Absen Pulang:</h4>
        <ol class="list-decimal list-inside text-sm text-red-800 dark:text-red-200 space-y-1">
            <li>Ambil foto wajah Anda</li>
            <li>Klik "Konfirmasi Absen Pulang"</li>
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
            <p class="font-bold text-green-700 dark:text-green-300">✅ Foto Siap!</p>
            <p class="text-sm text-green-600 dark:text-green-400">Klik "Konfirmasi Absen Pulang" di bawah</p>
        </div>
    </div>

    <!-- Tombol Capture -->
    <div class="flex justify-center gap-3 mb-4">
        <button 
            type="button"
            @click="capturePhoto()"
            x-show="!capturedImage"
            class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold"
        >
            📷 Ambil Foto
        </button>
        
        <button 
            type="button"
            @click="retakePhoto()"
            x-show="capturedImage"
            class="px-6 py-3 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition font-semibold"
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
