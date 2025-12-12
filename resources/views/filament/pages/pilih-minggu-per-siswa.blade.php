<x-filament-panels::page>
    <div class="flex justify-between items-center mb-4">
        <div>
            <h3 class="text-xl font-bold">Pilih Minggu untuk: {{ $student->name }}</h3>
            @if($student->siswa && $student->siswa->kelas)
                <p class="text-sm text-gray-500 dark:text-gray-400">
                    {{ $student->siswa->kelas->nama_kelas }}
                </p>
            @endif
        </div>
        <x-filament::button
            tag="a"
            href="{{ \App\Filament\Pages\PilihSiswaRefleksiUtama::getUrl() }}"
            icon="heroicon-o-arrow-left"
            color="gray">
            Kembali
        </x-filament::button>
    </div>

    <x-filament::card>
        <h4 class="font-semibold mb-4">Pilih Minggu Refleksi</h4>

        <div class="space-y-2">
            @forelse ($weeks as $week)
                <a href="{{ \App\Filament\Pages\InputRefleksi::getUrl([
                        $student->id,
                        $week['number'], 
                        $week['start_date'], 
                        $week['end_date']
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
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"/>
                    </svg>
                    <p class="mt-4 text-gray-500">Belum ada minggu refleksi untuk siswa ini.</p>
                    <p class="text-sm text-gray-400 mt-2">
                        Minggu refleksi akan otomatis dibuat saat siswa mengisi jurnal harian.
                    </p>
                </div>
            @endforelse
        </div>
    </x-filament::card>
</x-filament-panels::page>
