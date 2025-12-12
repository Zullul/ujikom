<div x-data="{
    stream: null,
    capturedImage: null,
    errorMessage: '',
    skipped: false,
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
        const hiddenFoto = document.querySelector('input[id=\'foto_izin_sakit_data_input\']');
        if (hiddenFoto) {
            hiddenFoto.value = this.capturedImage;
            hiddenFoto.dispatchEvent(new Event('input', { bubbles: true }));
            hiddenFoto.dispatchEvent(new Event('change', { bubbles: true }));
            console.log('Foto saved:', this.capturedImage.substring(0, 30));
        } else {
            console.error('Hidden input foto_izin_sakit_data_input not found');
        }
        this.stopCamera();
    },
    retakePhoto() { this.capturedImage = null; this.skipped = false; this.startCamera(); },
    skipPhoto() { this.skipped = true; this.stopCamera(); },
    stopCamera() { if (this.stream) { this.stream.getTracks().forEach(track => track.stop()); this.stream = null; } }
}" class="p-4">
    <!-- Instruksi -->
    <div class="mb-4 p-3 bg-yellow-50 dark:bg-yellow-900/20 border border-yellow-200 dark:border-yellow-700 rounded-lg">
        <h4 class="font-semibold text-yellow-900 dark:text-yellow-100 mb-2">📋 Foto Pendukung (Opsional):</h4>
        <ol class="list-decimal list-inside text-sm text-yellow-800 dark:text-yellow-200 space-y-1">
            <li>Ambil foto bukti (surat dokter, dll) jika ada</li>
            <li>Atau klik "Lewati" jika tidak ada foto</li>
            <li>Klik "Kirim" untuk menyimpan</li>
        </ol>
    </div>

    <!-- Preview Kamera -->
    <div class="mb-4">
        <video 
            x-ref="video" 
            autoplay 
            playsinline
            x-show="!capturedImage && !skipped"
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
            <p class="text-sm text-green-600 dark:text-green-400">Klik "Kirim" di bawah</p>
        </div>
    </div>

    <!-- Preview saat skip -->
    <div x-show="skipped" class="mb-4">
        <div class="p-4 bg-gray-100 dark:bg-gray-800 rounded-lg text-center border-2 border-gray-400">
            <p class="text-gray-600 dark:text-gray-400 font-semibold">⏭️ Foto Dilewati</p>
            <p class="text-sm text-gray-500 dark:text-gray-500 mt-1">Klik "Kirim" untuk lanjut tanpa foto</p>
        </div>
    </div>

    <!-- Tombol Capture -->
    <div class="flex justify-center gap-3 mb-4">
        <button 
            type="button"
            @click="capturePhoto()"
            x-show="!capturedImage && !skipped"
            class="px-6 py-3 bg-blue-600 text-white dark:text-white rounded-lg hover:bg-blue-700 transition font-semibold"
        >
            📷 Ambil Foto
        </button>
        
        <button 
            type="button"
            @click="skipPhoto()"
            x-show="!capturedImage && !skipped"
            class="px-6 py-3 bg-gray-500 text-white dark:text-white rounded-lg hover:bg-gray-600 transition font-semibold"
        >
            ⏭️ Lewati
        </button>
        
        <button 
            type="button"
            @click="retakePhoto()"
            x-show="capturedImage || skipped"
            class="px-6 py-3 bg-yellow-600 text-white dark:text-white rounded-lg hover:bg-yellow-700 transition font-semibold"
        >
            🔄 Ulangi
        </button>
    </div>

    <!-- Error message -->
    <div x-show="errorMessage" class="p-3 bg-red-100 dark:bg-red-900 border border-red-400 dark:border-red-600 text-red-700 dark:text-red-200 rounded-lg">
        <p x-text="errorMessage" class="text-sm"></p>
    </div>

    <!-- Info -->
    <div class="text-center text-sm text-gray-600 dark:text-gray-400">
        <p>📸 Foto pendukung membantu verifikasi izin/sakit Anda</p>
    </div>
</div>
