<x-filament-panels::page>
    <x-filament::card>
        <h3 class="text-xl font-bold mb-4">Pilih Siswa Bimbingan Anda</h3>
        <p class="text-sm text-gray-500 dark:text-gray-400 mb-6">
            Pilih siswa untuk memberikan refleksi mingguan
        </p>

        <div class="space-y-2">
            @forelse ($students as $student)
                <a href="{{ \App\Filament\Pages\PilihMingguPerSiswa::getUrl([$student->id]) }}"
                    class="block p-4 bg-gray-50 rounded-lg hover:bg-gray-100 dark:bg-gray-800 dark:hover:bg-gray-700 transition-colors">
                    <div class="flex items-center justify-between">
                        <div>
                            <p class="font-medium">{{ $student->name }}</p>
                            @if($student->siswa && $student->siswa->kelas)
                                <p class="text-sm text-gray-500 dark:text-gray-400">
                                    {{ $student->siswa->kelas->nama_kelas }}
                                </p>
                            @endif
                        </div>
                        <svg class="w-5 h-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                        </svg>
                    </div>
                </a>
            @empty
                <div class="text-center py-8">
                    <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4.354a4 4 0 110 5.292M15 21H3v-1a6 6 0 0112 0v1zm0 0h6v-1a6 6 0 00-9-5.197M13 7a4 4 0 11-8 0 4 4 0 018 0z"/>
                    </svg>
                    <p class="mt-4 text-gray-500">Tidak ada siswa bimbingan yang ditemukan.</p>
                    <p class="text-sm text-gray-400 mt-2">Hubungi admin jika ini adalah kesalahan.</p>
                </div>
            @endforelse
        </div>
    </x-filament::card>
</x-filament-panels::page>
