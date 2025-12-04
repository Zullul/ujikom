<x-filament-panels::page>
    {{-- =================== PERBAIKAN KODE SEARCH DI SINI =================== --}}
    <div class="mb-4 flex justify-end">
        <div class="w-full max-w-md">
            <div class="fi-input-wrp flex rounded-lg shadow-sm ring-1 transition duration-75 bg-white dark:bg-white/5 ring-gray-950/10 dark:ring-white/20 focus-within:ring-2 focus-within:ring-primary-600 dark:focus-within:ring-primary-500">
                <div class="flex items-center gap-x-2 ps-3">
                    <svg class="fi-input-wrp-icon h-5 w-5 text-gray-400 dark:text-gray-500" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" d="M21 21l-5.197-5.197m0 0A7.5 7.5 0 105.196 5.196a7.5 7.5 0 0010.607 10.607z" />
                    </svg>
                </div>
                <input
                    type="search"
                    wire:model.live.debounce.500ms="search"
                    placeholder="Cari DUDI, Pembimbing DUDI, atau Guru Pembimbing..."
                    class="fi-input block w-full border-none bg-transparent py-1.5 text-base text-gray-950 outline-none transition duration-75 placeholder:text-gray-400 disabled:text-gray-500 disabled:[-webkit-text-fill-color:theme(colors.gray.500)] disabled:placeholder:[-webkit-text-fill-color:theme(colors.gray.400)] dark:text-white dark:placeholder:text-gray-500 dark:disabled:text-gray-400 dark:disabled:[-webkit-text-fill-color:theme(colors.gray.400)] dark:disabled:placeholder:[-webkit-text-fill-color:theme(colors.gray.500)] sm:text-sm sm:leading-6 ps-2 pe-3">
            </div>
        </div>
    </div>
    {{-- =================== PERBAIKAN SELESAI =================== --}}


    {{-- Tabel ini dibuat manual menggunakan Blade --}}
    <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">DUDI</th>
                    <th scope="col" class="px-6 py-3">Periode Prakerin</th>
                    <th scope="col" class="px-6 py-3">Pembimbing DUDI</th>
                    <th scope="col" class="px-6 py-3">Guru Pembimbing</th>
                    <th scope="col" class="px-6 py-3">No SK</th>
                    <th scope="col" class="px-6 py-3">Jumlah Siswa</th>
                    <th scope="col" class="px-6 py-3"><span class="sr-only">Aksi</span></th>
                </tr>
            </thead>
            <tbody>
                @forelse ($rombels as $key => $rombel)
                @php
                $representative = $rombel->first();
                @endphp
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {{ $representative->dudi?->nama_dudi ?? 'Data DUDI Hilang' }}
                    </th>
                    <td class="px-6 py-4">
                        {{ \Carbon\Carbon::parse($representative->prakerin?->tanggal_mulai)->format('d M Y') }} -
                        {{ \Carbon\Carbon::parse($representative->prakerin?->tanggal_selesai)->format('d M Y') }}
                    </td>
                    <td class="px-6 py-4">
                        {{ $representative->dudiPembimbing?->nama_pembimbing ?? '-' }}
                    </td>
                    <td class="px-6 py-4">
                        {{ $representative->guru?->nama_guru ?? '-' }}
                    </td>
                    <td class="px-6 py-4">
                        {{ $representative->no_sk ?? '-' }}
                    <td class="px-6 py-4">
                        <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-primary-100 text-primary-800 dark:bg-primary-900 dark:text-primary-300">
                            {{ $rombel->count() }} 
                        </span>
                    </td>
                    <td class="px-6 py-4 text-right">
                        <x-filament::button
                            wire:click="$dispatch('open-modal', { id: '{{ $key }}' })"
                            icon="heroicon-o-users"
                            size="sm">
                            Lihat Anggota
                        </x-filament::button>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="6" class="text-center py-10 text-gray-500">
                        @if (empty($this->search))
                        Tidak ada data penempatan siswa untuk tahun ajaran ini.
                        @else
                        Tidak ada data yang cocok dengan pencarian "{{ $this->search }}".
                        @endif
                    </td>
                </tr>
                @endforelse
            </tbody>
        </table>
    </div>

    {{-- Definisi Modal --}}
    @foreach ($rombels as $key => $rombel)
    <x-filament::modal id="{{ $key }}" width="4xl">
        <x-slot name="heading">
            Daftar Siswa Rombel
        </x-slot>

        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">No</th>
                    <th scope="col" class="px-6 py-3">Nama Siswa</th>
                    <th scope="col" class="px-6 py-3">NIS</th>
                    <th scope="col" class="px-6 py-3">Kelas</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($rombel as $student)
                <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                    <td class="px-6 py-4">{{ $loop->iteration }}</td>
                    <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                        {{ $student->siswa?->nama_siswa ?? 'Data Siswa Hilang' }}
                    </th>
                    <td class="px-6 py-4">{{ $student->siswa?->nis ?? '-' }}</td>
                    <td class="px-6 py-4">{{ $student->siswa?->kelas?->nama_kelas ?? '-' }}</td>
                </tr>
                @endforeach
            </tbody>
        </table>

        <x-slot name="footer">
            <x-filament::button color="gray" x-on:click="close">
                Tutup
            </x-filament::button>
        </x-slot>
    </x-filament::modal>
    @endforeach

</x-filament-panels::page>