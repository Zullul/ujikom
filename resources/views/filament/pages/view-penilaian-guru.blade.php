<x-filament-panels::page>
    @php
        $penilaian = $this->record;
        $siswa = $penilaian->prakerinSiswa->siswa;
        $dudi = $penilaian->prakerinSiswa->dudi;
        $user = Auth::user();
    @endphp

    <div class="space-y-6">
        {{-- Header Info Siswa --}}
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6">
            <h2 class="text-2xl font-bold text-gray-900 dark:text-white mb-6">Detail Penilaian PKL</h2>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-3">
                    <div>
                        <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Nama Siswa</span>
                        <p class="text-base font-semibold text-gray-900 dark:text-white">{{ $siswa->nama_siswa }}</p>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-500 dark:text-gray-400">NIS</span>
                        <p class="text-base font-semibold text-gray-900 dark:text-white">{{ $siswa->nis }}</p>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Kelas</span>
                        <p class="text-base font-semibold text-gray-900 dark:text-white">{{ $siswa->kelas->nama_kelas ?? '-' }}</p>
                    </div>
                </div>
                <div class="space-y-3">
                    <div>
                        <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Tempat PKL</span>
                        <p class="text-base font-semibold text-gray-900 dark:text-white">{{ $dudi->nama_dudi }}</p>
                    </div>
                    <div>
                        <span class="text-sm font-medium text-gray-500 dark:text-gray-400">Alamat DUDI</span>
                        <p class="text-base font-semibold text-gray-900 dark:text-white">{{ $dudi->alamat ?? $dudi->alamat_dudi ?? '-' }}</p>
                    </div>
                </div>
            </div>
        </div>

        {{-- Hasil Penilaian Akhir --}}
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6">
            <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-6">Hasil Penilaian Akhir</h3>
            
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <div class="bg-primary-50 dark:bg-primary-900/20 rounded-lg p-4 text-center">
                    <div class="text-sm text-gray-600 dark:text-gray-400 mb-2">Nilai Akhir</div>
                    <div class="text-3xl font-bold text-primary-600 dark:text-primary-400">
                        {{ number_format($penilaian->nilai_akhir, 2) }}
                    </div>
                </div>
                
                <div class="bg-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-50 dark:bg-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-900/20 rounded-lg p-4 text-center">
                    <div class="text-sm text-gray-600 dark:text-gray-400 mb-2">Grade</div>
                    <div class="text-3xl font-bold text-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-600 dark:text-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-400">
                        {{ $penilaian->grade_akhir }}
                    </div>
                </div>

                <div class="bg-info-50 dark:bg-info-900/20 rounded-lg p-4 text-center">
                    <div class="text-sm text-gray-600 dark:text-gray-400 mb-2">Predikat</div>
                    <div class="text-3xl font-bold text-info-600 dark:text-info-400">
                        @if($penilaian->nilai_akhir >= 90)
                            Sangat Baik
                        @elseif($penilaian->nilai_akhir >= 80)
                            Baik
                        @elseif($penilaian->nilai_akhir >= 70)
                            Cukup
                        @elseif($penilaian->nilai_akhir >= 60)
                            Kurang
                        @else
                            Sangat Kurang
                        @endif
                    </div>
                </div>

                <!-- <div class="bg-gray-100 dark:bg-gray-700 rounded-lg p-4 text-center">
                    <div class="text-sm text-gray-600 dark:text-gray-400 mb-2">Status</div>
                    <div class="text-3xl font-bold text-gray-900 dark:text-white">
                        {{ ucfirst($penilaian->prakerinSiswa->status ?? 'N/A') }}
                    </div>
                </div> -->
            </div>
        </div>

        {{-- Penilaian Guru Pembimbing --}}
        @if($penilaian->skor_guru)
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-xl font-bold text-gray-900 dark:text-white">Penilaian Guru Pembimbing</h3>
                <div class="flex items-center gap-4">
                    <span class="text-sm text-gray-600 dark:text-gray-400">
                        Nilai: <span class="font-bold text-blue-600">{{ number_format($penilaian->skor_guru, 2) }}</span>
                    </span>
                    <span class="px-3 py-1 rounded-full text-sm font-semibold bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
                        Grade: {{ $penilaian->grade_guru }}
                    </span>
                </div>
            </div>
            
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                    <thead class="bg-gray-50 dark:bg-gray-900">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">No</th>
                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Kriteria Penilaian</th>
                            <th class="px-4 py-3 text-center text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Skor</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                        @foreach($penilaian->details->where('skor_guru', '!=', null) as $index => $detail)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900 dark:text-white">{{ $index + 1 }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900 dark:text-white">
                                {{ strip_tags(html_entity_decode($detail->tujuanPembelajaran->deskripsi)) }}
                            </td>
                            <td class="px-4 py-3 text-center">
                                <span class="px-3 py-1 inline-flex text-sm font-semibold rounded-full bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
                                    {{ $detail->skor_guru }}
                                </span>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        @endif

        {{-- Penilaian DUDI Pembimbing --}}
        @if($penilaian->skor_dudi)
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6">
            <div class="flex items-center justify-between mb-4">
                <h3 class="text-xl font-bold text-gray-900 dark:text-white">Penilaian Pembimbing DUDI</h3>
                <div class="flex items-center gap-4">
                    <span class="text-sm text-gray-600 dark:text-gray-400">
                        Nilai: <span class="font-bold text-green-600">{{ number_format($penilaian->skor_dudi, 2) }}</span>
                    </span>
                    <span class="px-3 py-1 rounded-full text-sm font-semibold bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
                        Grade: {{ $penilaian->grade_dudi }}
                    </span>
                </div>
            </div>
            
            <div class="overflow-x-auto">
                <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                    <thead class="bg-gray-50 dark:bg-gray-900">
                        <tr>
                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">No</th>
                            <th class="px-4 py-3 text-left text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Kriteria Penilaian</th>
                            <th class="px-4 py-3 text-center text-xs font-medium text-gray-500 dark:text-gray-400 uppercase">Skor</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                        @foreach($penilaian->details->where('skor_dudi', '!=', null) as $index => $detail)
                        <tr>
                            <td class="px-4 py-3 text-sm text-gray-900 dark:text-white">{{ $index + 1 }}</td>
                            <td class="px-4 py-3 text-sm text-gray-900 dark:text-white">
                                {{ strip_tags(html_entity_decode($detail->tujuanPembelajaran->deskripsi)) }}
                            </td>
                            <td class="px-4 py-3 text-center">
                                <span class="px-3 py-1 inline-flex text-sm font-semibold rounded-full bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
                                    {{ $detail->skor_dudi }}
                                </span>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        @endif

        {{-- Catatan/Keterangan --}}
        <div class="bg-white dark:bg-gray-800 rounded-lg shadow p-6">
            <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-4">Catatan Penilaian</h3>
            <div class="bg-gray-50 dark:bg-gray-900 rounded-lg p-4">
                <div class="text-base text-gray-900 dark:text-white leading-relaxed">
                    {!! $penilaian->keterangan_siswa ?? '<em class="text-gray-500 dark:text-gray-400">Tidak ada catatan.</em>' !!}
                </div>
            </div>
        </div>
    </div>
</x-filament-panels::page>
