<x-filament-panels::page>
    @if(!$prakerin_id)
            {{-- Tampilkan form pilih periode jika belum dipilih --}}
            <x-filament::card>
                <div class="text-center py-6">
                    <div class="mx-auto flex items-center justify-center h-12 w-12 rounded-full bg-primary-100 dark:bg-primary-900 mb-4">
                        <svg class="h-6 w-6 text-primary-600 dark:text-primary-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                        </svg>
                    </div>
                    <h3 class="text-lg font-semibold mb-2">Pilih Periode Prakerin</h3>
                    <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">Silakan pilih periode prakerin untuk melihat daftar minggu refleksi</p>
                </div>

                <form wire:submit="submitPeriode">
                    {{ $this->form }}
                    
                    <div class="mt-6 flex justify-center">
                        <x-filament::button type="submit" size="lg">
                            Tampilkan Minggu Refleksi
                        </x-filament::button>
                    </div>
                </form>
            </x-filament::card>
        @else
            {{-- Tampilkan daftar minggu setelah periode dipilih --}}
            <x-filament::card class="mb-4">
                <div class="flex items-center justify-between">
                    <div>
                        <h3 class="text-sm font-medium text-gray-500 dark:text-gray-400">Periode Prakerin Terpilih</h3>
                        <p class="text-lg font-semibold mt-1">
                            {{ \App\Models\Prakerin::find($prakerin_id)?->nama_prakerin }}
                        </p>
                    </div>
                    <x-filament::button wire:click="$set('prakerin_id', null)" color="gray" size="sm">
                        Ganti Periode
                    </x-filament::button>
                </div>
            </x-filament::card>

            <x-filament::card>
                <h3 class="text-xl font-bold mb-4">Pilih Minggu untuk Memberi Refleksi</h3>

                <div class="space-y-2">
                    @forelse ($weeks as $week)
                    <a href="{{ \App\Filament\Pages\LihatRefleksiMingguan::getUrl([
                            'week_number' => $week['number'], 
                            'start_date' => $week['start_date'], 
                            'end_date' => $week['end_date'],
                            'prakerin_id' => $week['prakerin_id'] ?? null
                        ]) }}"
                        class="block p-4 bg-gray-50 rounded-lg hover:bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-700 transition-colors">
                        <div class="flex items-center justify-between">
                            <span class="font-medium">{{ $week['label'] }}</span>
                            <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                            </svg>
                        </div>
                    </a>
                    @empty
                    <div class="text-center py-8">
                        <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12h6m-6 4h6m2 5H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"/>
                        </svg>
                        <p class="mt-4 text-gray-500">Tidak ada minggu refleksi untuk periode prakerin ini.</p>
                    </div>
                    @endforelse
                </div>
            </x-filament::card>
        @endif

    <x-filament-actions::modals />
</x-filament-panels::page>