<x-filament-panels::page>
    {{-- Form Search --}}
    <div class="mb-6">
        <form method="GET" action="{{ request()->url() }}">
            <div class="flex gap-3 justify-end">
                <x-filament::input.wrapper>
                    <x-filament::input 
                        type="text" 
                        name="search" 
                        value="{{ request('search') }}" 
                        placeholder="Cari nama sekolah..."
                        class="w-64"
                    />
                </x-filament::input.wrapper>
                
                <x-filament::button type="submit">
                    Cari
                </x-filament::button>
                
                @if(request('search'))
                    <x-filament::button 
                        tag="a"
                        href="{{ request()->url() }}"
                        color="gray"
                    >
                        Reset
                    </x-filament::button>
                @endif
            </div>
        </form>
    </div>

    <div class="overflow-x-auto shadow-md sm:rounded-lg">
        <table class="w-full text-sm text-left text-gray-500 dark:text-gray-400">
            <thead class="text-xs text-gray-700 uppercase bg-gray-50 dark:bg-gray-700 dark:text-gray-400">
                <tr>
                    <th scope="col" class="px-6 py-3">
                        Nama Sekolah
                    </th>
                    <th scope="col" class="px-6 py-3 text-center">
                         DUDI Yang Bekerja Sama
                    </th>
                    <th scope="col" class="px-6 py-3 text-center">
                        Total Akun Terdaftar
                    </th>
                    <th scope="col" class="px-6 py-3">
                        Bonus Kuota Akun Terpakai
                    </th>
                </tr>
            </thead>
            <tbody>
                @forelse ($sekolahs as $sekolah)
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                        <th scope="row" class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                            {{ $sekolah->nama_sekolah }}
                        </th>
                        <td class="px-6 py-4 text-center">
                            {{ $sekolah->dudis_count }}
                        </td>
                        <td class="px-6 py-4 text-center">
                             {{ $sekolah->users_count }} / {{ $sekolah->batas_akun }}
                        </td>
                        <td class="px-6 py-4">
                            @php
                                $bonusTerpakai = max(0, $sekolah->users_count - $sekolah->batas_akun);
                            @endphp
                             {{ $bonusTerpakai }} / {{ $sekolah->kuota_bonus }} Akun
                        </td>
                    </tr>
                @empty
                    <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700">
                        <td colspan="4" class="px-6 py-4 text-center text-gray-500 dark:text-gray-400">
                            Tidak ada data sekolah.
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</x-filament-panels::page>