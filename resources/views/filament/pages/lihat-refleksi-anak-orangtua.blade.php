@php
    use Carbon\Carbon;
    Carbon::setLocale('id');
@endphp

<x-filament-panels::page x-data="{
    showModal: false,
    selectedRefleksi: null,
    openModal(refleksi) {
        this.selectedRefleksi = refleksi;
        this.showModal = true;
    },
    closeModal() {
        this.showModal = false;
        this.selectedRefleksi = null;
    }
}">
    <div class="space-y-4">
        <!-- Informasi Anak -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-sm p-4 border-l-4 border-primary-600">
            <h3 class="text-base font-semibold text-gray-900 dark:text-white mb-3">
                Informasi Anak
            </h3>
            <div class="grid grid-cols-2 md:grid-cols-4 gap-3">
                <div>
                    <p class="text-xs text-gray-500 dark:text-gray-400">Nama</p>
                    <p class="text-sm font-semibold text-gray-900 dark:text-white">{{ $anak->nama_siswa }}</p>
                </div>
                <div>
                    <p class="text-xs text-gray-500 dark:text-gray-400">NIS</p>
                    <p class="text-sm font-semibold text-gray-900 dark:text-white">{{ $anak->nis }}</p>
                </div>
                <div>
                    <p class="text-xs text-gray-500 dark:text-gray-400">Kelas</p>
                    <p class="text-sm font-semibold text-gray-900 dark:text-white">{{ $anak->kelas?->nama_kelas ?? 'N/A' }}</p>
                </div>
                <div>
                    <p class="text-xs text-gray-500 dark:text-gray-400">Sekolah</p>
                    <p class="text-sm font-semibold text-gray-900 dark:text-white">{{ Str::limit($anak->sekolah?->nama_sekolah ?? 'N/A', 20) }}</p>
                </div>
            </div>
        </div>

        <!-- Daftar Refleksi -->
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow-sm overflow-hidden">
            <div class="px-4 py-3 border-b border-gray-200 dark:border-gray-700 flex items-center justify-between">
                <h3 class="text-base font-semibold text-gray-900 dark:text-white">
                    Refleksi Mingguan
                </h3>
                <span class="text-xs text-gray-500 dark:text-gray-400 bg-gray-100 dark:bg-gray-700 px-2 py-1 rounded">
                    {{ count($refleksis) }} refleksi
                </span>
            </div>

            @if (count($refleksis) > 0)
                <div class="divide-y divide-gray-200 dark:divide-gray-700">
                    @foreach ($refleksis as $refleksi)
                        <div class="p-4 hover:bg-gray-50 dark:hover:bg-gray-700/50 transition">
                            <!-- Header Minggu -->
                            <div class="flex items-start justify-between mb-2">
                                <div class="flex-1">
                                    <div class="flex items-center gap-2">
                                        <p class="text-sm font-semibold text-primary-600 dark:text-primary-400">
                                            Minggu ke-{{ $refleksi['minggu_ke'] }}
                                        </p>
                                        <span class="inline-flex items-center px-2 py-0.5 rounded-full text-xs font-medium {{ $refleksi['status_verifikasi'] === 'Disetujui' ? 'bg-success-100 text-success-800 dark:bg-success-900 dark:text-success-200' : 'bg-warning-100 text-warning-800 dark:bg-warning-900 dark:text-warning-200' }}">
                                            {{ $refleksi['status_verifikasi'] }}
                                        </span>
                                    </div>
                                    <p class="text-xs text-gray-500 dark:text-gray-400 mt-1">
                                        {{ Carbon::parse($refleksi['tanggal_mulai'])->isoFormat('D MMM') }} - 
                                        {{ Carbon::parse($refleksi['tanggal_akhir'])->isoFormat('D MMM Y') }}
                                    </p>
                                </div>
                            </div>

                            <!-- Isi Refleksi -->
                            <div class="bg-gray-50 dark:bg-gray-700/30 rounded p-3 mt-2">
                                <p class="text-xs text-gray-700 dark:text-gray-300 leading-relaxed line-clamp-3">
                                    {{ Str::limit($refleksi['isi_refleksi'], 150, '...') }}
                                </p>
                            </div>

                            <!-- Footer -->
                            <div class="flex items-center justify-between mt-3">
                                <p class="text-xs text-gray-400 dark:text-gray-500">
                                    {{ Carbon::parse($refleksi['created_at'])->diffForHumans() }}
                                </p>
                                <button 
                                    type="button"
                                    @click="openModal(@js($refleksi))"
                                    class="inline-flex items-center px-3 py-1.5 bg-primary-600 text-white rounded-lg hover:bg-primary-700 transition text-xs font-medium"
                                >
                                    <svg class="w-3.5 h-3.5 mr-1.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                    </svg>
                                    Detail
                                </button>
                            </div>
                        </div>
                    @endforeach
                </div>
            @else
                <div class="px-6 py-12 text-center">
                    <svg class="mx-auto h-12 w-12 text-gray-400 dark:text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z" />
                    </svg>
                    <h3 class="mt-2 text-sm font-medium text-gray-900 dark:text-white">Belum ada refleksi</h3>
                    <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">Anak Anda belum membuat refleksi mingguan apapun.</p>
                </div>
            @endif
        </div>
    </div>

    <!-- Modal Detail Refleksi -->
    <div 
        x-show="showModal" 
        x-cloak
        @click.self="closeModal()"
        class="fixed inset-0 z-50 flex items-end sm:items-center justify-center bg-black bg-opacity-50 p-0 sm:p-4"
        style="display: none;"
    >
        <div 
            @click.stop
            class="bg-white dark:bg-gray-800 rounded-t-2xl sm:rounded-lg shadow-xl w-full sm:max-w-2xl max-h-[90vh] overflow-y-auto"
            x-show="showModal"
            x-transition:enter="transition ease-out duration-300"
            x-transition:enter-start="opacity-0 transform translate-y-full sm:scale-90"
            x-transition:enter-end="opacity-100 transform translate-y-0 sm:scale-100"
            x-transition:leave="transition ease-in duration-200"
            x-transition:leave-start="opacity-100 transform translate-y-0 sm:scale-100"
            x-transition:leave-end="opacity-0 transform translate-y-full sm:scale-90"
        >
            <!-- Header Modal -->
            <div class="sticky top-0 bg-white dark:bg-gray-800 border-b border-gray-200 dark:border-gray-700 px-4 py-3 flex items-center justify-between z-10">
                <div>
                    <h3 class="text-base font-semibold text-gray-900 dark:text-white">
                        Absensi & Jurnal Harian
                    </h3>
                    <p class="text-xs text-gray-500 dark:text-gray-400" x-text="selectedRefleksi ? 'Minggu ke-' + selectedRefleksi.minggu_ke : ''"></p>
                </div>
                <button 
                    @click="closeModal()"
                    class="text-gray-400 hover:text-gray-600 dark:hover:text-gray-300 transition"
                >
                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                    </svg>
                </button>
            </div>

            <!-- Body Modal -->
            <div class="px-4 py-3 space-y-4">
                <!-- Info Periode -->
                <div class="bg-primary-50 dark:bg-primary-900/20 rounded-lg p-3 border-l-4 border-primary-500">
                    <p class="text-xs text-gray-600 dark:text-gray-400">Periode</p>
                    <p class="text-sm font-semibold text-gray-900 dark:text-white mt-0.5" x-text="selectedRefleksi ? formatTanggal(selectedRefleksi.tanggal_mulai) + ' - ' + formatTanggal(selectedRefleksi.tanggal_akhir) : ''"></p>
                </div>

                <!-- Absensi Harian -->
                <div>
                    <h4 class="text-sm font-bold text-gray-800 dark:text-gray-200 mb-2 flex items-center">
                        <svg class="w-4 h-4 mr-1.5 text-success-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                        Absensi Harian
                    </h4>
                    <div class="space-y-2" x-show="selectedRefleksi?.absensi?.length > 0">
                        <template x-for="(abs, idx) in selectedRefleksi?.absensi || []" :key="idx">
                            <div class="bg-gray-50 dark:bg-gray-700/30 rounded-lg p-3 border border-gray-200 dark:border-gray-600">
                                <div class="flex items-center justify-between mb-2">
                                    <span class="text-sm font-semibold text-gray-900 dark:text-white" x-text="formatTanggal(abs.tanggal)"></span>
                                    <span 
                                        class="px-2 py-0.5 rounded-full text-xs font-medium"
                                        :class="{
                                            'bg-success-100 text-success-800 dark:bg-success-900 dark:text-success-200': abs.status_kehadiran === 'Hadir',
                                            'bg-warning-100 text-warning-800 dark:bg-warning-900 dark:text-warning-200': abs.status_kehadiran === 'Izin' || abs.status_kehadiran === 'Sakit',
                                            'bg-danger-100 text-danger-800 dark:bg-danger-900 dark:text-danger-200': abs.status_kehadiran === 'Alpa'
                                        }"
                                        x-text="abs.status_kehadiran"
                                    ></span>
                                </div>
                                <div class="grid grid-cols-2 gap-2 text-xs">
                                    <div>
                                        <span class="text-gray-500 dark:text-gray-400">Masuk:</span>
                                        <p class="text-gray-900 dark:text-white font-medium" x-text="abs.jam_masuk || '-'"></p>
                                    </div>
                                    <div>
                                        <span class="text-gray-500 dark:text-gray-400">Pulang:</span>
                                        <p class="text-gray-900 dark:text-white font-medium" x-text="abs.jam_pulang || '-'"></p>
                                    </div>
                                </div>
                                <div x-show="abs.keterangan" class="mt-2 text-xs text-gray-600 dark:text-gray-400 bg-gray-100 dark:bg-gray-600 p-2 rounded">
                                    <span class="font-medium">Keterangan:</span> <span x-text="abs.keterangan"></span>
                                </div>
                            </div>
                        </template>
                    </div>
                    <div x-show="!selectedRefleksi?.absensi?.length" class="text-center py-3 text-gray-500 dark:text-gray-400 text-xs bg-gray-50 dark:bg-gray-700/30 rounded">
                        Tidak ada data absensi
                    </div>
                </div>

                <!-- Jurnal Harian -->
                <div>
                    <h4 class="text-sm font-bold text-gray-800 dark:text-gray-200 mb-2 flex items-center">
                        <svg class="w-4 h-4 mr-1.5 text-primary-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253" />
                        </svg>
                        Jurnal Harian
                    </h4>
                    <div class="space-y-2" x-show="selectedRefleksi?.jurnal?.length > 0">
                        <template x-for="(jur, idx) in selectedRefleksi?.jurnal || []" :key="idx">
                            <div class="bg-gray-50 dark:bg-gray-700/30 rounded-lg p-3 border border-gray-200 dark:border-gray-600">
                                <div class="text-sm font-semibold text-gray-900 dark:text-white mb-2" x-text="formatTanggal(jur.tanggal)"></div>
                                <div class="text-xs">
                                    <span class="text-gray-500 dark:text-gray-400">Kegiatan:</span>
                                    <p class="text-gray-900 dark:text-white mt-1 leading-relaxed" x-text="jur.kegiatan || '-'"></p>
                                </div>
                                <div x-show="jur.catatan_guru" class="mt-2 text-xs bg-blue-50 dark:bg-blue-900/20 p-2 rounded">
                                    <span class="text-blue-600 dark:text-blue-400 font-medium">Catatan Guru:</span>
                                    <p class="text-gray-700 dark:text-gray-200 mt-0.5" x-text="jur.catatan_guru"></p>
                                </div>
                                <div x-show="jur.catatan_dudi" class="mt-2 text-xs bg-green-50 dark:bg-green-900/20 p-2 rounded">
                                    <span class="text-green-600 dark:text-green-400 font-medium">Catatan DUDI:</span>
                                    <p class="text-gray-700 dark:text-gray-200 mt-0.5" x-text="jur.catatan_dudi"></p>
                                </div>
                                <div x-show="jur.foto_kegiatan" class="mt-2">
                                    <img :src="jur.foto_kegiatan" alt="Foto kegiatan" class="rounded-lg w-full h-auto max-h-48 object-cover border border-gray-300 dark:border-gray-600">
                                </div>
                            </div>
                        </template>
                    </div>
                    <div x-show="!selectedRefleksi?.jurnal?.length" class="text-center py-3 text-gray-500 dark:text-gray-400 text-xs">
                        Tidak ada jurnal harian
                    </div>
                </div>
            </div>

            <!-- Footer Modal -->
            <div class="sticky bottom-0 bg-gray-50 dark:bg-gray-900 border-t border-gray-200 dark:border-gray-700 px-4 py-3">
                <button 
                    @click="closeModal()"
                    class="w-full px-3 py-2 bg-gray-200 dark:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-lg hover:bg-gray-300 dark:hover:bg-gray-600 transition text-sm font-medium"
                >
                    Tutup
                </button>
            </div>
        </div>
    </div>

    @push('styles')
        <style>
            [data-filament-layout-section="heading"] {
                display: none;
            }
            [x-cloak] { display: none !important; }
        </style>
    @endpush

    @push('scripts')
        <script>
            function formatTanggal(dateStr) {
                if (!dateStr) return '-';
                const date = new Date(dateStr);
                return date.toLocaleDateString('id-ID', { day: 'numeric', month: 'long', year: 'numeric' });
            }
            
            function formatCreatedAt(dateStr) {
                if (!dateStr) return '-';
                const date = new Date(dateStr);
                return date.toLocaleString('id-ID', { 
                    day: 'numeric', 
                    month: 'long', 
                    year: 'numeric',
                    hour: '2-digit',
                    minute: '2-digit'
                });
            }
            
            // Inject ke Alpine context
            document.addEventListener('alpine:init', () => {
                Alpine.magic('formatTanggal', () => formatTanggal);
                Alpine.magic('formatCreatedAt', () => formatCreatedAt);
            });
        </script>
    @endpush
</x-filament-panels::page>
