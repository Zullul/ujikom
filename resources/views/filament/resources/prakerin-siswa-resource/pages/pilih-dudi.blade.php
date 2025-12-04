<x-filament-panels::page>
    <div class="space-y-6">
        {{-- Header Section --}}
        <div>
            <h2 class="text-xl font-semibold text-gray-950 dark:text-white">
                Langkah 1: Pilih Tempat Prakerin (DUDI)
            </h2>
            <p class="mt-1 text-sm text-gray-500 dark:text-gray-400">
                Pilih salah satu DUDI di bawah ini untuk memulai proses penempatan siswa baru.
            </p>
        </div>

        {{-- Filters Section using Filament Components --}}
        <div class="grid gap-4 md:grid-cols-3">
            <div>
                <x-filament::input.wrapper>
                    <x-filament::input
                        type="text"
                        wire:model.live="search"
                        placeholder="Cari nama DUDI, alamat, atau bidang usaha..."
                    />
                </x-filament::input.wrapper>
            </div>
            <div>
                <x-filament::input.wrapper>
                    <x-filament::input.select wire:model.live="filterAlamat">
                        <option value="">Semua Alamat</option>
                        @foreach($this->getAlamatOptions() as $alamat)
                            <option value="{{ $alamat }}">{{ $alamat }}</option>
                        @endforeach
                    </x-filament::input.select>
                </x-filament::input.wrapper>
            </div>
            <div>
                <x-filament::input.wrapper>
                    <x-filament::input.select wire:model.live="filterBidangUsaha">
                        <option value="">Semua Bidang Usaha</option>
                        @foreach($this->getBidangUsahaOptions() as $bidang)
                            <option value="{{ $bidang }}">{{ $bidang }}</option>
                        @endforeach
                    </x-filament::input.select>
                </x-filament::input.wrapper>
            </div>
        </div>

        {{-- Table Section using Filament Table Component --}}
        <x-filament-tables::container>
            <table class="fi-ta-table w-full table-auto divide-y divide-gray-200 text-start dark:divide-white/5">
                <thead class="divide-y divide-gray-200 dark:divide-white/5">
                    <tr class="bg-gray-50 dark:bg-white/5">
                        <x-filament-tables::header-cell>
                            Nama DUDI
                        </x-filament-tables::header-cell>
                        <x-filament-tables::header-cell>
                            Bidang Usaha
                        </x-filament-tables::header-cell>
                        <x-filament-tables::header-cell>
                            Alamat
                        </x-filament-tables::header-cell>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 dark:divide-white/5">
                    @forelse($this->getDudis() as $dudi)
                        <x-filament-tables::row
                            wire:key="dudi-{{ $dudi->id }}"
                            wire:click="$set('selectedDudi', {{ $dudi->id }})"
                            @class([
                                'cursor-pointer transition hover:bg-gray-50 dark:hover:bg-white/5',
                            ])
                            onclick="window.location='{{ $this->getCreateUrl($dudi->id) }}'"
                        >
                            <x-filament-tables::cell>
                                <div class="px-3 py-4">
                                    <span class="font-semibold text-gray-950 dark:text-white">
                                        {{ $dudi->nama_dudi }}
                                    </span>
                                </div>
                            </x-filament-tables::cell>
                            <x-filament-tables::cell>
                                <div class="px-3 py-4">
                                    <span class="text-sm text-gray-600 dark:text-gray-400">
                                        {{ $dudi->bidang_usaha }}
                                    </span>
                                </div>
                            </x-filament-tables::cell>
                            <x-filament-tables::cell>
                                <div class="px-3 py-4">
                                    <span class="text-sm text-gray-600 dark:text-gray-400">
                                        {{ $dudi->alamat }}
                                    </span>
                                </div>
                            </x-filament-tables::cell>
                        </x-filament-tables::row>
                    @empty
                        <x-filament-tables::empty-state
                            icon="heroicon-o-building-office-2"
                            heading="Tidak ada DUDI"
                        >
                            <x-slot name="description">
                                Tidak ada DUDI yang ditemukan sesuai dengan kriteria pencarian.
                            </x-slot>
                        </x-filament-tables::empty-state>
                    @endforelse
                </tbody>
            </table>
        </x-filament-tables::container>
    </div>
</x-filament-panels::page>