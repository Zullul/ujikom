<div x-data="{
    stream: null,
    capturedImage: null,
    errorMessage: '',
    init() {
        this.startCamera();
    },
    async startCamera() {
        try {
            this.stream = await navigator.mediaDevices.getUserMedia({ 
                video: { 
                    facingMode: 'user',
                    width: { ideal: 1280 },
                    height: { ideal: 720 }
                } 
            });
            this.$refs.video.srcObject = this.stream;
            this.errorMessage = '';
        } catch (error) {
            console.error('Error accessing camera:', error);
            this.errorMessage = 'Tidak dapat mengakses kamera. Pastikan Anda telah memberikan izin akses kamera dan gunakan HTTPS.';
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
            if (this.$wire.mountedTableActionsData !== undefined) {
                this.$wire.set('mountedTableActionsData.0.foto_pulang_data', this.capturedImage, false);
                console.log('📸 Foto pulang saved to Livewire');
            }
        } catch (error) {
            console.error('Error saving photo:', error);
        }
        
        this.stopCamera();
    },
    retakePhoto() {
        this.capturedImage = null;
        this.startCamera();
    },
    stopCamera() {
        if (this.stream) {
            this.stream.getTracks().forEach(track => track.stop());
            this.stream = null;
        }
    }
}" class="p-4">
    <div class="mb-4 p-3 bg-red-50 dark:bg-red-900/20 border border-red-200 dark:border-red-700 rounded-lg text-center">
        <p class="font-semibold text-red-900 dark:text-red-100">📸 Ambil Foto Absen Pulang</p>
    </div>
    <video x-ref="video" autoplay playsinline x-show="!capturedImage" class="w-full max-w-lg mx-auto rounded-lg border-2 border-gray-300 dark:border-gray-600 mb-4" style="max-height: 400px; transform: scaleX(-1);"></video>
    <canvas x-ref="canvas" style="display: none;"></canvas>
    <div x-show="capturedImage" class="mb-4">
        <img :src="capturedImage" class="w-full max-w-lg mx-auto rounded-lg border-2 border-green-500" style="max-height: 400px;" alt="Captured">
    </div>
    <div class="flex justify-center gap-3 mb-4">
        <button type="button" @click="capturePhoto()" x-show="!capturedImage" class="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition font-semibold">📷 Ambil Foto</button>
        <button type="button" @click="retakePhoto()" x-show="capturedImage" class="px-6 py-3 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition font-semibold">🔄 Foto Ulang</button>
    </div>
    <div x-show="errorMessage" class="p-3 bg-red-100 dark:bg-red-900 border border-red-400 dark:border-red-600 text-red-700 dark:text-red-200 rounded-lg">
        <p x-text="errorMessage" class="text-sm"></p>
    </div>
</div>
