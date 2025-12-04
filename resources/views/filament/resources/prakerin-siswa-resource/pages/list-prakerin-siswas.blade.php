<x-filament-panels::page>

    {{-- Bagian Header dengan Tombol --}}
    <div class="mb-4 flex justify-end">
        @if (request()->get('dudi_id'))
        {{-- Tombol Kembali saat melihat detail DUDI --}}
        <a href="{{ static::getUrl() }}" class="flex items-center gap-2 text-sm font-medium text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200">
            <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" />
            </svg>
            Kembali ke Daftar DUDI
        </a>
        @else
        {{-- Tombol "Tempatkan Siswa Baru" --}}
        <a href="{{ static::getResource()::getUrl('pilih-dudi') }}" class="filament-button filament-button-size-md inline-flex items-center justify-center py-1 gap-1 font-medium rounded-lg border transition-colors focus:outline-none focus:ring-offset-2 focus:ring-2 focus:ring-inset dark:focus:ring-offset-0 min-h-[2.25rem] px-4 text-sm text-white shadow focus:ring-white border-transparent bg-primary-600 hover:bg-primary-500 focus:bg-primary-700 focus:ring-offset-primary-700">
            Tempatkan Siswa Baru
        </a>
        @endif
    </div>

    {{-- Logika Tampilan: Kartu atau Tabel --}}
    @if (request()->get('dudi_id'))
    {{-- Tampilan tabel siswa jika dudi dipilih --}}
    {{ $this->table }}
    @else
    {{-- Tampilan kartu DUDI --}}
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
        @foreach($this->getDudisWithSiswaCount() as $dudi)
        <a href="?dudi_id={{ $dudi->id }}" class="block p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 transition-all duration-200">
            <div class="flex justify-between items-start">
                <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">{{ $dudi->nama_dudi }}</h5>
                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-primary-100 text-primary-800">
                    {{ $dudi->prakerin_siswas_count }} Siswa
                </span>
            </div>
            <p class="font-normal text-gray-700 dark:text-gray-400">{{ $dudi->alamat }}</p>
        </a>
        @endforeach
    </div>
    @endif
</x-filament-panels::page>