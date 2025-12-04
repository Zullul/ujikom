<x-filament-panels::page>
    <x-filament::card>
        <div class="flex justify-between items-center mb-4">
            <div>
                <h3 class="text-xl font-bold">Pilih Siswa</h3>
                <p class="text-sm text-gray-500">
                    Untuk Refleksi Minggu ke-{{ $week_number }}
                    @if($prakerin_id)
                        <br>
                        <span class="text-xs text-gray-400">
                            Periode: {{ \App\Models\Prakerin::find($prakerin_id)?->nama_prakerin }}
                        </span>
                    @endif
                </p>
            </div>
            <x-filament::button
                tag="a"
                :href="\App\Filament\Pages\PilihMingguRefleksi::getUrl()"
                icon="heroicon-o-arrow-left"
                color="gray">
                Kembali
            </x-filament::button>
        </div>

        <div class="space-y-2">
            @forelse ($students as $student)
            @php
                $url = \App\Filament\Pages\InputRefleksi::getUrl([
                    $week_number, 
                    $start_date, 
                    $end_date, 
                    $student->id
                ]);
                if ($prakerin_id) {
                    $url .= '?prakerin_id=' . $prakerin_id;
                }
            @endphp
            <a href="{{ $url }}"
                class="block p-4 bg-gray-50 rounded-lg hover:bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-700">
                {{ $student->name }}
            </a>
            @empty
            <p>Tidak ada data siswa yang Anda bimbing.</p>
            @endforelse
        </div>
    </x-filament::card>
</x-filament-panels::page>