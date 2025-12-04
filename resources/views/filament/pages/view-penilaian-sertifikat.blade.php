<x-filament-panels::page>
    @php
        $penilaian = $this->record;
        $siswa = $penilaian->prakerinSiswa->siswa;
        $dudi = $penilaian->prakerinSiswa->dudi;
        $user = Auth::user();
    @endphp

    <div class="w-full mx-auto bg-white dark:bg-gray-800 shadow-2xl rounded-lg overflow-hidden print:shadow-none" style="max-width: 1400px;">
        {{-- Header Sertifikat --}}
        <div class="bg-gradient-to-r from-primary-600 to-primary-800 text-white p-12 text-center">
            <div class="mb-6">
                <svg class="w-20 h-20 mx-auto" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z"/>
                </svg>
            </div>
            <h1 class="text-4xl font-bold mb-3">LAPORAN PENILAIAN</h1>
            <h2 class="text-2xl font-semibold">PRAKTIK KERJA LAPANGAN (PKL)</h2>
            <div class="mt-5 text-lg opacity-90">
                {{ $siswa->sekolah->nama_sekolah ?? 'SEKOLAH' }}
            </div>
        </div>

        {{-- Informasi Siswa --}}
        <div class="p-8 border-b dark:border-gray-700" style="padding-left: 15px; padding-right: 15px; margin-top: 20px;">
            <h3 class="text-xl font-bold text-gray-900 dark:text-gray-100 mb-6 flex items-center">
                <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"/>
                </svg>
                Data Peserta Didik
            </h3>
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6" style="margin-top: 10px; margin-bottom: 20px;">
                <div class="space-y-4">
                    <div class="flex">
                        <span class="text-gray-600 dark:text-gray-400 w-36 text-base">Nama</span>
                        <span class="font-semibold text-gray-900 dark:text-gray-100 text-base">: {{ $siswa->nama_siswa }}</span>
                    </div>
                    <div class="flex">
                        <span class="text-gray-600 dark:text-gray-400 w-36 text-base">Kelas</span>
                        <span class="font-semibold text-gray-900 dark:text-gray-100 text-base">: {{ $siswa->kelas->nama_kelas ?? '-' }}</span>
                    </div>
                </div>
                <div class="space-y-4">
                    <div class="flex">
                        <span class="text-gray-600 dark:text-gray-400 w-36 text-base">Tempat PKL</span>
                        <span class="font-semibold text-gray-900 dark:text-gray-100 text-base">: {{ $dudi->nama_dudi }}</span>
                    </div>
                    <div class="flex">
                        <span class="text-gray-600 dark:text-gray-400 w-36 text-base">Alamat</span>
                        <span class="font-semibold text-gray-900 dark:text-gray-100 text-base">: {{ $dudi->alamat ?? $dudi->alamat_dudi ?? '-' }}</span>
                    </div>
                </div>
            </div>
        </div>

        {{-- Hasil Penilaian Akhir --}}
        <div class="p-8 bg-gray-50 dark:bg-gray-900" style="margin-top: 10px; margin-bottom: 20px;">
            <h3 class="text-xl font-bold text-gray-900 dark:text-gray-100 mb-6 flex items-center">
                <svg class="w-6 h-6 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                </svg>
                Hasil Penilaian Akhir
            </h3>
            
            <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6" style="padding:15px;">
                {{-- Nilai Akhir --}}
                <div class="bg-white dark:bg-gray-800 rounded-lg p-8 text-center shadow-md border-2 border-primary-200 dark:border-primary-700">
                    <div class="text-base text-gray-600 dark:text-gray-400 mb-3">Nilai Akhir</div>
                    <div class="text-5xl font-bold text-primary-600 dark:text-primary-400">
                        {{ number_format($penilaian->nilai_akhir, 2) }}
                    </div>
                </div>
                
                {{-- Grade --}}
                <div class="bg-white dark:bg-gray-800 rounded-lg p-8 text-center shadow-md border-2 border-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-200">
                    <div class="text-base text-gray-600 dark:text-gray-400 mb-3">Grade</div>
                    <div class="text-6xl font-bold text-{{ $penilaian->grade_akhir === 'A' ? 'success' : ($penilaian->grade_akhir === 'B' ? 'primary' : ($penilaian->grade_akhir === 'C' ? 'warning' : 'danger')) }}-600">
                        {{ $penilaian->grade_akhir }}
                    </div>
                </div>
                
                {{-- Predikat --}}
                <div class="bg-white dark:bg-gray-800 rounded-lg p-8 text-center shadow-md border-2 border-gray-200 dark:border-gray-700 flex flex-col justify-center">
                    <div class="text-base text-gray-600 dark:text-gray-400 mb-3">Predikat</div>
                    <div class="text-4xl font-bold text-gray-900 dark:text-gray-100">
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
            </div>

            {{-- Keterangan Narasi --}}
            <div class="bg-white dark:bg-gray-800 rounded-lg p-6 shadow-md">
                <h4 class="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4">Catatan:</h4>
                <div class="text-base text-gray-900 dark:text-white leading-relaxed">
                    {!! $user->isAdminSekolah() 
                        ? $penilaian->getKeteranganSiswaAttribute($siswa->nama_siswa) 
                        : $penilaian->keterangan_siswa 
                    !!}
                </div>
            </div>
        </div>

        {{-- Detail Penilaian (untuk Admin dan Siswa) --}}
        @if($user->isAdminSekolah() || $user->isSiswa())
        <div class="p-8 border-t dark:border-gray-700" style="padding-left: 15px; padding-right: 15px; margin-bottom: 20px;">
            <h3 class="text-xl font-bold text-gray-900 dark:text-gray-100 mb-6">Rincian Penilaian</h3>
            
            {{-- Grid Layout untuk Guru dan DUDI side by side --}}
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                {{-- Penilaian Guru --}}
                @if($penilaian->skor_guru)
                <div class="bg-white dark:bg-gray-800 rounded-lg p-6 shadow-sm">
                    <h4 class="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4 flex items-center flex-wrap">
                        <span class="bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200 px-3 py-1 rounded-full text-base mr-3">
                            Guru Pembimbing
                        </span>
                        <span class="text-gray-600 dark:text-gray-400 text-base">
                            Nilai: {{ number_format($penilaian->skor_guru, 2) }} | Grade: {{ $penilaian->grade_guru }}
                        </span>
                    </h4>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                            <thead class="bg-gray-50 dark:bg-gray-900">
                                <tr>
                                    <th class="px-4 py-3 text-left text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">Kriteria Penilaian</th>
                                    <th class="px-4 py-3 text-center text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider" style="width: 80px;">Skor</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                                @foreach($penilaian->details->where('skor_guru', '!=', null) as $index => $detail)
                                <tr>
                                    <td class="px-4 py-4 text-sm text-gray-900 dark:text-gray-100">
                                        {{ strip_tags(html_entity_decode($detail->tujuanPembelajaran->deskripsi)) }}
                                    </td>
                                    <td class="px-4 py-4 whitespace-nowrap text-center" style="width: 80px;">
                                        <span class="px-2 py-1 inline-flex text-sm leading-5 font-semibold rounded-full bg-blue-100 dark:bg-blue-900 text-blue-800 dark:text-blue-200">
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

                {{-- Penilaian DUDI --}}
                @if($penilaian->skor_dudi)
                <div class="bg-white dark:bg-gray-800 rounded-lg p-6 shadow-sm">
                    <h4 class="text-lg font-semibold text-gray-900 dark:text-gray-100 mb-4 flex items-center flex-wrap">
                        <span class="bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 px-3 py-1 rounded-full text-base mr-3">
                            Pembimbing DUDI
                        </span>
                        <span class="text-gray-600 dark:text-gray-400 text-base">
                            Nilai: {{ number_format($penilaian->skor_dudi, 2) }} | Grade: {{ $penilaian->grade_dudi }}
                        </span>
                    </h4>
                    <div class="overflow-x-auto">
                        <table class="min-w-full divide-y divide-gray-200 dark:divide-gray-700">
                            <thead class="bg-gray-50 dark:bg-gray-900">
                                <tr>
                                    <th class="px-4 py-3 text-left text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider">Kriteria Penilaian</th>
                                    <th class="px-4 py-3 text-center text-sm font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider" style="width: 80px;">Skor</th>
                                </tr>
                            </thead>
                            <tbody class="bg-white dark:bg-gray-800 divide-y divide-gray-200 dark:divide-gray-700">
                                @foreach($penilaian->details->where('skor_dudi', '!=', null) as $index => $detail)
                                <tr>
                                    <td class="px-4 py-4 text-sm text-gray-900 dark:text-gray-100">
                                        {{ strip_tags(html_entity_decode($detail->tujuanPembelajaran->deskripsi)) }}
                                    </td>
                                    <td class="px-4 py-4 whitespace-nowrap text-center" style="width: 80px;">
                                        <span class="px-2 py-1 inline-flex text-sm leading-5 font-semibold rounded-full bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200">
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
            </div>
        </div>
        @endif

        {{-- Footer --}}
        <div class="p-8 bg-gray-50 dark:bg-gray-900 text-center border-t dark:border-gray-700">
            <div class="text-base text-gray-600 dark:text-gray-400 mb-2">
                Diterbitkan pada: {{ now()->translatedFormat('d F Y') }}
            </div>
            @if($user->isAdminSekolah())
            <button onclick="printClean()" class="mt-4 px-8 py-3 bg-primary-600 hover:bg-primary-700 text-white rounded-lg font-semibold text-base print:hidden">
                <svg class="w-5 h-5 inline-block mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17 17h2a2 2 0 002-2v-4a2 2 0 00-2-2H5a2 2 0 00-2 2v4a2 2 0 002 2h2m2 4h6a2 2 0 002-2v-4a2 2 0 00-2-2H9a2 2 0 00-2 2v4a2 2 0 002 2zm8-12V5a2 2 0 00-2-2H9a2 2 0 00-2 2v4h10z"/>
                </svg>
                Cetak Laporan
            </button>
            @endif
        </div>
    </div>

    @push('scripts')
    <script>
        function printClean() {
            var printContent = document.querySelector('.w-full.mx-auto.bg-white').cloneNode(true);
            var printWindow = window.open('', '_blank');
            
            printWindow.document.open();
            printWindow.document.write('<!DOCTYPE html>');
            printWindow.document.write('<html><head>');
            printWindow.document.write('<title>Laporan Penilaian PKL - {{ $siswa->nama_siswa }}</title>');
            printWindow.document.write('<meta charset="utf-8">');
            printWindow.document.write('<script src="https:\/\/cdn.tailwindcss.com"><\/script>');
            printWindow.document.write('<style>');
            printWindow.document.write('@page { size: A4 portrait; margin: 10mm; }');
            printWindow.document.write('body { margin: 0; padding: 0; font-family: system-ui, -apple-system, sans-serif; print-color-adjust: exact; -webkit-print-color-adjust: exact; }');
            printWindow.document.write('* { print-color-adjust: exact; -webkit-print-color-adjust: exact; }');
            printWindow.document.write('.p-8 { padding: 0.75rem !important; }');
            printWindow.document.write('.p-6 { padding: 0.5rem !important; }');
            printWindow.document.write('.p-12 { padding: 1rem !important; }');
            printWindow.document.write('.mb-6, .mb-8 { margin-bottom: 0.5rem !important; }');
            printWindow.document.write('.gap-6 { gap: 0.5rem !important; }');
            printWindow.document.write('.bg-gradient-to-r, .grid > div, table, .rounded-lg { page-break-inside: avoid; break-inside: avoid; }');
            printWindow.document.write('thead { display: table-header-group; }');
            printWindow.document.write('.text-4xl { font-size: 1.5rem !important; }');
            printWindow.document.write('.text-3xl { font-size: 1.25rem !important; }');
            printWindow.document.write('.text-2xl { font-size: 1.125rem !important; }');
            printWindow.document.write('.text-xl { font-size: 1rem !important; }');
            printWindow.document.write('.text-lg { font-size: 0.95rem !important; }');
            printWindow.document.write('.text-base { font-size: 0.875rem !important; }');
            printWindow.document.write('.text-5xl { font-size: 2rem !important; }');
            printWindow.document.write('.text-6xl { font-size: 2.5rem !important; }');
            printWindow.document.write('.print\\:hidden { display: none !important; }');
            printWindow.document.write('.shadow-2xl, .shadow-sm { box-shadow: none !important; }');
            printWindow.document.write('<\/style>');
            printWindow.document.write('<\/head><body>');
            printWindow.document.write(printContent.outerHTML);
            printWindow.document.write('<\/body><\/html>');
            printWindow.document.close();
            
            setTimeout(function() {
                printWindow.print();
                printWindow.close();
            }, 500);
        }
    </script>
    @endpush
</x-filament-panels::page>
