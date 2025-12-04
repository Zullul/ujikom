<x-filament-panels::page>
    <div class="space-y-6">
        {{-- Tombol Kembali --}}
        <div class="mb-4">
            <x-filament::button
                tag="a"
                href="{{ \App\Filament\Pages\PilihMingguRefleksi::getUrl() }}"
                color="gray"
                icon="heroicon-o-arrow-left"
                size="sm"
            >
                Kembali ke Daftar Minggu
            </x-filament::button>
        </div>

        {{-- Info Card --}}
        <x-filament::card>
            <div class="flex items-center gap-4">
                <div class="flex-shrink-0">
                    <div class="w-12 h-12 rounded-full bg-primary-100 dark:bg-primary-900 flex items-center justify-center">
                        <svg class="w-6 h-6 text-primary-600 dark:text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                    </div>
                </div>
                <div class="flex-1">
                    <h3 class="text-sm font-medium text-gray-500 dark:text-gray-400">Periode Refleksi</h3>
                    <p class="text-lg font-semibold mt-1">
                        Minggu ke-{{ $week_number }} ({{ \Carbon\Carbon::parse($start_date)->translatedFormat('d F Y') }} - {{ \Carbon\Carbon::parse($end_date)->translatedFormat('d F Y') }})
                    </p>
                </div>
            </div>
        </x-filament::card>

        {{-- Table --}}
        {{ $this->table }}
    </div>
</x-filament-panels::page>
