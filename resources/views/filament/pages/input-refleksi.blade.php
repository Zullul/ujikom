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
            href="{{ \App\Filament\Pages\PilihMingguPerSiswa::getUrl([$student->id]) }}"
            icon="heroicon-o-arrow-left"
            color="gray">
            Kembali ke Pilih Minggu
        </x-filament::button>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-3 gap-6">
        {{-- KOLOM KIRI: DATA PENDUKUNG --}}
        <div class="lg:col-span-1 space-y-6">
            <x-filament::card>
                <x-slot name="header">
                    <h4 class="font-semibold">Absensi Minggu Ini</h4>
                </x-slot>

                <ul class="space-y-3">
                    @forelse ($attendances as $attendance)
                    <li class="text-sm border-b pb-2 dark:border-gray-700">
                            {{-- Baris Pertama: Tanggal & Badge Status --}}
                            <div class="flex justify-between items-center mb-2">
                                <span class="font-medium">{{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M') }}</span>
                                <x-filament::badge :color="match($attendance->status_kehadiran) {
                                    'hadir' => 'success',
                                    'sakit' => 'warning',
                                    'izin' => 'warning',
                                    'alpa' => 'gray',
                                    default => 'gray'
                                }">
                                    {{ $attendance->status_kehadiran }}
                                </x-filament::badge>
                            </div>

                            {{-- Baris Kedua: Tombol Foto & Alasan --}}
                            <div class="flex flex-wrap items-center gap-2">
                                {{-- Tombol Foto Masuk --}}
                                @if ($attendance->status_kehadiran === 'hadir' && !empty($attendance->foto_masuk))
                                    <x-filament::button
                                        size="xs"
                                        color="info"
                                        icon="heroicon-o-camera"
                                        x-on:click="$dispatch('open-modal', { id: 'foto-masuk-{{ $attendance->id }}' })"
                                        title="Klik untuk melihat foto masuk">
                                        Masuk
                                    </x-filament::button>
                                @endif

                                {{-- Tombol Foto Pulang --}}
                                @if ($attendance->status_kehadiran === 'hadir' && !empty($attendance->foto_pulang))
                                    <x-filament::button
                                        size="xs"
                                        color="warning"
                                        icon="heroicon-o-camera"
                                        x-on:click="$dispatch('open-modal', { id: 'foto-pulang-{{ $attendance->id }}' })"
                                        title="Klik untuk melihat foto pulang">
                                        Pulang
                                    </x-filament::button>
                                @endif

                                {{-- Tombol Foto Bukti (Izin/Sakit) --}}
                                @if (in_array($attendance->status_kehadiran, ['izin', 'sakit']) && !empty($attendance->foto_izin_sakit))
                                    <x-filament::button
                                        size="xs"
                                        color="danger"
                                        icon="heroicon-o-camera"
                                        x-on:click="$dispatch('open-modal', { id: 'foto-bukti-{{ $attendance->id }}' })"
                                        title="Klik untuk melihat foto bukti">
                                        Bukti
                                    </x-filament::button>
                                @endif

                                {{-- Tombol Alasan (Izin/Sakit) --}}
                                @if (in_array($attendance->status_kehadiran, ['izin', 'sakit']) && !empty($attendance->keterangan))
                                    <x-filament::button
                                        size="xs"
                                        color="gray"
                                        icon="heroicon-o-eye"
                                        x-on:click="$dispatch('open-modal', { id: 'alasan-modal-{{ $attendance->id }}' })">
                                        Alasan
                                    </x-filament::button>
                                @endif
                            </div>
                        </li>
                    @empty
                    <li class="text-sm text-gray-500">Tidak ada data absensi.</li>
                    @endforelse
                </ul>
            </x-filament::card>

            {{-- JURNAL HARIAN: DENGAN TOMBOL PER HARI --}}
            <x-filament::card>
                <x-slot name="header">
                    <h4 class="font-semibold">Jurnal Harian Siswa</h4>
                </x-slot>

                <ul class="space-y-2">
                    @forelse ($dailyJournals as $journal)
                    <li class="flex justify-between items-center text-sm">
                        <span>{{ \Carbon\Carbon::parse($journal->tanggal)->translatedFormat('l, d M') }}</span>
                        <x-filament::button
                            size="xs"
                            color="info"
                            icon="heroicon-o-document-text"
                            x-on:click="$dispatch('open-modal', { id: 'jurnal-modal-{{ $journal->id }}' })">
                            Lihat Jurnal
                        </x-filament::button>
                    </li>
                    @empty
                    <li class="text-sm text-gray-500">Belum ada jurnal harian.</li>
                    @endforelse
                </ul>
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

                    @if(auth()->user()->role_type !== 'admin_sekolah')
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
                    @endif
                </x-filament::card>
            </form>
        </div>
    </div>

    {{-- MODAL UNTUK SETIAP JURNAL HARIAN (PER HARI) --}}
    @foreach ($dailyJournals as $journal)
        <x-filament::modal id="jurnal-modal-{{ $journal->id }}" width="3xl">
            <x-slot name="heading">
                Jurnal Harian - {{ \Carbon\Carbon::parse($journal->tanggal)->translatedFormat('l, d M Y') }}
            </x-slot>

            <div class="prose dark:prose-invert max-w-full overflow-x-hidden">
                <p class="whitespace-pre-line break-words text-gray-700 dark:text-gray-300">{{ strip_tags($journal->kegiatan) }}</p>
            </div>

            <x-slot name="footer">
                <x-filament::button color="gray" x-on:click="close">
                    Tutup
                </x-filament::button>
            </x-slot>
        </x-filament::modal>
    @endforeach
    @foreach ($attendances as $attendance)
        @if (in_array($attendance->status_kehadiran, ['izin', 'sakit']) && !empty($attendance->keterangan))
            <x-filament::modal id="alasan-modal-{{ $attendance->id }}" width="lg"> {{-- Ukuran modal bisa disesuaikan (lg, xl, dll) --}}
                <x-slot name="heading">
                    Alasan {{ ucfirst($attendance->status_kehadiran) }} - {{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M Y') }}
                </x-slot>

                {{-- Tampilkan alasan/keterangan --}}
                <div class="prose dark:prose-invert max-w-none">
                    <p>{{ $attendance->keterangan }}</p>
                </div>

                {{-- Tombol tutup modal --}}
                <x-slot name="footer">
                    <x-filament::button color="gray" x-on:click="close">
                        Tutup
                    </x-filament::button>
                </x-slot>
            </x-filament::modal>
        @endif
    @endforeach

    {{-- MODAL FOTO MASUK / PULANG / BUKTI UNTUK SETIAP ABSENSI --}}
    @foreach ($attendances as $attendance)
        @if ($attendance->status_kehadiran === 'hadir')
            @if (!empty($attendance->foto_masuk))
                <x-filament::modal id="foto-masuk-{{ $attendance->id }}" width="3xl">
                    <x-slot name="heading">
                        Foto Masuk - {{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M Y') }}
                    </x-slot>
                    <div class="w-full">
                        <img src="{{ asset('storage/' . $attendance->foto_masuk) }}" alt="Foto Masuk" class="max-w-full h-auto rounded-md" />
                    </div>
                    <x-slot name="footer">
                        <x-filament::button color="gray" x-on:click="close">Tutup</x-filament::button>
                    </x-slot>
                </x-filament::modal>
            @endif

            @if (!empty($attendance->foto_pulang))
                <x-filament::modal id="foto-pulang-{{ $attendance->id }}" width="3xl">
                    <x-slot name="heading">
                        Foto Pulang - {{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M Y') }}
                    </x-slot>
                    <div class="w-full">
                        <img src="{{ asset('storage/' . $attendance->foto_pulang) }}" alt="Foto Pulang" class="max-w-full h-auto rounded-md" />
                    </div>
                    <x-slot name="footer">
                        <x-filament::button color="gray" x-on:click="close">Tutup</x-filament::button>
                    </x-slot>
                </x-filament::modal>
            @endif
        @endif

        {{-- Modal Foto Bukti Izin/Sakit --}}
        @if (in_array($attendance->status_kehadiran, ['izin', 'sakit']) && !empty($attendance->foto_izin_sakit))
            <x-filament::modal id="foto-bukti-{{ $attendance->id }}" width="3xl">
                <x-slot name="heading">
                    Foto Bukti {{ ucfirst($attendance->status_kehadiran) }} - {{ \Carbon\Carbon::parse($attendance->tanggal)->translatedFormat('l, d M Y') }}
                </x-slot>
                <div class="w-full">
                    <img src="{{ asset('storage/' . $attendance->foto_izin_sakit) }}" alt="Foto Bukti" class="max-w-full h-auto rounded-md" />
                </div>
                <x-slot name="footer">
                    <x-filament::button color="gray" x-on:click="close">Tutup</x-filament::button>
                </x-slot>
            </x-filament::modal>
        @endif
    @endforeach

</x-filament-panels::page>