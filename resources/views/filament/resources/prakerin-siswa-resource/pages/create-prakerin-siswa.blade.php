<x-filament-panels::page>
    {{-- Cek apakah DUDI sudah dipilih dari URL --}}
    @if (!request()->get('dudi_id'))

    {{-- Jika BELUM, tampilkan kartu pilihan DUDI --}}
    <div>
        <div class="mb-6">
            <h2 class="text-2xl font-bold tracking-tight text-gray-900 dark:text-white">
                Langkah 1: Pilih Tempat Prakerin (DUDI)
            </h2>
            <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Pilih salah satu DUDI di bawah ini untuk memulai proses penempatan siswa baru.
            </p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            @foreach($this->getDudis() as $dudi)
            <a href="?dudi_id={{ $dudi->id }}"
                class="block p-6 bg-white border border-gray-200 rounded-lg shadow hover:bg-gray-100 dark:bg-gray-800 dark:border-gray-700 dark:hover:bg-gray-700 transition-all duration-200">
                <div class="flex justify-between items-start">
                    <h5 class="mb-2 text-xl font-bold tracking-tight text-gray-900 dark:text-white">{{ $dudi->nama_dudi }}</h5>
                </div>
                <p class="font-normal text-gray-700 dark:text-gray-400">{{ $dudi->alamat }}</p>
            </a>
            @endforeach
        </div>
    </div>

    @else

    {{-- Jika SUDAH, tampilkan form wizard --}}
    <div class="mb-4">
        <a href="{{ static::getUrl() }}" class="flex items-center gap-2 text-sm font-medium text-gray-600 hover:text-gray-900 dark:text-gray-400 dark:hover:text-gray-200">
            <svg class="w-4 h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0-0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M12.79 5.23a.75.75 0 01-.02 1.06L8.832 10l3.938 3.71a.75.75 0 11-1.04 1.08l-4.5-4.25a.75.75 0 010-1.08l4.5-4.25a.75.75 0 011.06.02z" clip-rule="evenodd" />
            </svg>
            Kembali untuk Pilih DUDI
        </a>
    </div>

    {{-- CUKUP PANGGIL INI. Tidak perlu tag <form> atau yang lain. --}}
    {{ $this->form }}

    @endif
</x-filament-panels::page>