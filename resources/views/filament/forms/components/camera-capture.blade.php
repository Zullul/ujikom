 <div>
    <div x-data="cameraCapture()" x-init="init()">
        <!-- Preview Kamera -->
        <div class="mb-4">
            <video 
                x-ref="video" 
                autoplay 
                playsinline
                class="w-full max-w-md mx-auto rounded-lg border-2 border-gray-300 dark:border-gray-600"
                style="max-height: 400px;"
            ></video>
        </div>

        <!-- Canvas tersembunyi untuk capture -->
        <canvas x-ref="canvas" style="display: none;"></canvas>

        <!-- Preview hasil foto -->
        <div x-show="capturedImage" class="mb-4">
            <img 
                :src="capturedImage" 
                class="w-full max-w-md mx-auto rounded-lg border-2 border-green-500"
                style="max-height: 400px;"
            >
        </div>

        <!-- Tombol Capture -->
        <div class="flex justify-center gap-3">
            <button 
                type="button"
                @click="capturePhoto()"
                x-show="!capturedImage"
                class="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
            >
                📷 Ambil Foto
            </button>
            
            <button 
                type="button"
                @click="retakePhoto()"
                x-show="capturedImage"
                class="px-4 py-2 bg-yellow-600 text-white rounded-lg hover:bg-yellow-700 transition"
            >
                🔄 Foto Ulang
            </button>
        </div>

        <!-- Error message -->
        <div x-show="errorMessage" class="mt-4 p-3 bg-red-100 border border-red-400 text-red-700 rounded-lg">
            <p x-text="errorMessage"></p>
        </div>
    </div>
</div>

<script>
function cameraCapture() {
    return {
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
                this.errorMessage = 'Tidak dapat mengakses kamera. Pastikan Anda telah memberikan izin akses kamera.';
            }
        },
        
        capturePhoto() {
            const video = this.$refs.video;
            const canvas = this.$refs.canvas;
            const context = canvas.getContext('2d');
            
            // Set canvas size sama dengan video
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            
            // Draw video frame ke canvas
            context.drawImage(video, 0, 0, canvas.width, canvas.height);
            
            // Convert ke base64 dengan kompresi 90%
            this.capturedImage = canvas.toDataURL('image/jpeg', 0.9);
            
            // Stop kamera setelah capture
            this.stopCamera();
            
            // Kirim data ke parent melalui wire:model
            // Cari hidden input terdekat dan set valuenya
            const form = this.$el.closest('form');
            if (form) {
                const hiddenInput = form.querySelector('input[type=\"hidden\"][id$=\"_data\"]');
                if (hiddenInput) {
                    hiddenInput.value = this.capturedImage;
                    // Trigger change event untuk Livewire
                    hiddenInput.dispatchEvent(new Event('input', { bubbles: true }));
                }
            }
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
        },
        
        destroy() {
            this.stopCamera();
        }
    }
}
</script>

<style>
video {
    transform: scaleX(-1); /* Mirror effect untuk selfie */
}
</style>
