<x-filament-panels::page>
    <div class="flex justify-between items-center mb-4">
        <div>
            <h3 class="text-xl font-bold">Input Refleksi untuk: {{ $student->name }}</h3>
            <p class="text-sm text-gray-500">
                Minggu ke-{{ $week_number }} ({{ \Carbon\Carbon::parse($start_date)->translatedFormat('d M') }} - {{ \Carbon\Carbon::parse($end_date)->translatedFormat('d M Y') }})
            </p>
        </div>
        <x-filament::button
            tag="a"
            :href="\App\Filament\Pages\PilihSiswaRefleksi::getUrl([$week_number, $start_date, $end_date])"
            icon="heroicon-o-arrow-left"
            color="gray">
            Kembali ke Pilih Siswa
        </x-filament::button>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {{-- KOLOM KIRI: DATA PENDUKUNG --}}
        <div class="lg:col-span-1 space-y-6">
            <x-filament::card>
                <x-slot name="header">
                    <h4 class="font-semibold">Absensi Minggu Ini</h4>
                </x-slot>

                <ul class="space-y-2">
                    @forelse ($attendances as $attendance)
                    <li class="flex justify-between items-center text-sm">
                        <span>{{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M') }}</span>
                        <x-filament::badge :color="match($attendance->status_kehadiran) {
                                'hadir' => 'success',
                                'sakit' => 'warning',
                                'izin' => 'info',
                                'alpa' => 'danger',
                                default => 'gray'
                            }">
                            {{ $attendance->status_kehadiran }}
                        </x-filament::badge>
                    </li>
                    @empty
                    <li class="text-sm text-gray-500">Tidak ada data absensi.</li>
                    @endforelse
                </ul>
            </x-filament::card>

            {{-- REVISI JURNAL HARIAN: MENJADI TOMBOL MODAL --}}
            <x-filament::card>
                <x-slot name="header">
                    <h4 class="font-semibold">Jurnal Harian Siswa</h4>
                </x-slot>
                <x-filament::button
                    color="gray"
                    class="w-full"
                    x-on:click="$dispatch('open-modal', { id: 'jurnal-harian-modal' })">
                    Lihat Jurnal Harian
                </x-filament::button>
            </x-filament::card>
        </div>

        {{-- KOLOM KANAN: FORM & VERIFIKASI --}}
        <div class="lg:col-span-2">
            <form wire:submit.prevent="save">
                <x-filament::card>
                    <x-slot name="header">
                        <h4 class="font-semibold">Input Refleksi Anda</h4>
                    </x-slot>

                    {{ $this->form }}

                    <div class="mt-6 flex justify-end gap-x-4">
                        <x-filament::button type="submit" :disabled="$isVerified">
                            Simpan Refleksi
                        </x-filament::button>

                        <x-filament::button
                            wire:click="verify"
                            color="success"
                            icon="heroicon-o-check-badge"
                            :disabled="$isVerified"
                            wire:loading.attr="disabled">
                            {{ $isVerified ? 'Telah Diverifikasi' : 'Verifikasi' }}
                        </x-filament::button>
                    </div>
                </x-filament::card>
            </form>
        </div>
    </div>

    {{-- KODE BARU: MODAL UNTUK JURNAL HARIAN --}}
    <x-filament::modal id="jurnal-harian-modal" width="4xl"> {{-- width="4xl" untuk modal yang lebar --}}
        <x-slot name="heading">
            Jurnal Harian - {{ $student->name }}
        </x-slot>

        {{-- Isi modal diambil dari kode yang tadi kita hapus --}}
        <div class="space-y-4">
            @forelse ($dailyJournals as $journal)
            <div class="border-b pb-3 dark:border-gray-700">
                <p class="font-semibold">{{ \Carbon\Carbon::parse($journal->tanggal)->translatedFormat('l, d M Y') }}</p>
                <p class="mt-1 text-gray-600 dark:text-gray-300 whitespace-pre-line">{{ strip_tags($journal->kegiatan) }}</p>
            </div>
            @empty
            <p>Siswa belum mengisi jurnal harian pada minggu ini.</p>
            @endforelse
        </div>
    </x-filament::modal>

</x-filament-panels::page>