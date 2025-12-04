<x-filament-widgets::widget>
    @if($dudi)
        <x-filament::section>
            <x-slot name="heading">
                Informasi DUDI
            </x-slot>

            <div class="grid gap-4 md:grid-cols-3">
                <div>
                    <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Nama DUDI</dt>
                    <dd class="mt-1 text-sm font-semibold text-gray-900 dark:text-white">{{ $dudi->nama_dudi }}</dd>
                </div>
                <div>
                    <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Bidang Usaha</dt>
                    <dd class="mt-1 text-sm text-gray-900 dark:text-white">{{ $dudi->bidang_usaha }}</dd>
                </div>
                <div>
                    <dt class="text-sm font-medium text-gray-500 dark:text-gray-400">Alamat</dt>
                    <dd class="mt-1 text-sm text-gray-900 dark:text-white">{{ $dudi->alamat }}</dd>
                </div>
            </div>
        </x-filament::section>
    @endif
</x-filament-widgets::widget>
