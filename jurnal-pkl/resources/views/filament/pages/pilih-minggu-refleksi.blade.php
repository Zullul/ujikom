<x-filament-panels::page>
    <x-filament::card>
        <h3 class="text-xl font-bold mb-4">Pilih Minggu untuk Memberi Refleksi</h3>

        <div class="space-y-2">
            @forelse ($weeks as $week)
            <a href="{{ \App\Filament\Pages\PilihSiswaRefleksi::getUrl([
                    $week['number'], 
                    $week['start_date'], 
                    $week['end_date']
                ]) }}"
                class="block p-4 bg-gray-50 rounded-lg hover:bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-700">
                {{ $week['label'] }}
            </a>
            @empty
            <p>Periode Prakerin belum ditentukan atau belum dimulai.</p>
            @endforelse
        </div>
    </x-filament::card>
</x-filament-panels::page>