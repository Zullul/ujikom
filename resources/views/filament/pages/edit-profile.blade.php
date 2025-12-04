<x-filament-panels::page>
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">

        {{-- Kolom Kiri: Kartu Informasi Profil --}}
        <div class="lg:col-span-1">
            <div class="bg-white p-6 rounded-lg shadow-md dark:bg-gray-800">
                <div class="flex flex-col items-center text-center">
                    {{-- Placeholder untuk Avatar/Foto Profil --}}
                    <div class="w-24 h-24 bg-gray-200 dark:bg-gray-700 rounded-full mb-4 flex items-center justify-center ring-4 ring-gray-300 dark:ring-gray-600">
                        <svg class="w-16 h-16 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" d="M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z" clip-rule="evenodd"></path>
                        </svg>
                    </div>

                    {{-- Menampilkan Nama, Email, dan Role dari Class --}}
                    <h2 class="text-xl font-bold text-gray-900 dark:text-white">{{ $this->name }}</h2>
                    <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">{{ $this->email }}</p>
                    <span class="mt-3 bg-primary-100 text-primary-800 text-xs font-medium px-2.5 py-0.5 rounded-full dark:bg-primary-900 dark:text-primary-300">
                        {{ $this->role_type }}
                    </span>
                </div>
            </div>
        </div>

        {{-- Kolom Kanan: Kartu Form Edit --}}
        <div class="lg:col-span-2">
            <div class="bg-white p-6 rounded-lg shadow-md dark:bg-gray-800">
                <h3 class="text-lg font-medium text-gray-900 dark:text-white mb-4">Ubah Data Akun</h3>

                {{-- Form untuk menyimpan perubahan --}}
                <form wire:submit="save">
                    {{-- Ini akan merender field username dan password --}}
                    {{ $this->form }}

                    <div class="mt-6 text-right">
                        <x-filament::button type="submit" icon="heroicon-m-check-circle">
                            Simpan Perubahan
                        </x-filament::button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</x-filament-panels::page>