<x-filament-panels::page>
    @if(!$prakerinSiswa || !$siswa)
        <x-filament::card>
            <div class="text-center py-8">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                </svg>
                <p class="mt-4 text-gray-500">Tidak ada periode PKL aktif.</p>
            </div>
        </x-filament::card>
    @else
        <div class="space-y-4">
            {{-- Info Card --}}
            <x-filament::card>
                <div class="flex items-center justify-between">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100">
                            Jurnal Harian PKL
                        </h3>
                        <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">
                            Total {{ $jurnalHarian->count() }} jurnal harian
                        </p>
                        <p class="text-sm text-gray-500 dark:text-gray-400">
                            Periode: {{ \Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai)->translatedFormat('d M Y') }} - 
                            {{ \Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai)->translatedFormat('d M Y') }}
                        </p>
                    </div>
                    <x-filament::button onclick="printJurnal()" color="primary" icon="heroicon-o-printer">
                        Cetak Jurnal
                    </x-filament::button>
                </div>
            </x-filament::card>

            {{-- Preview Card --}}
            <div id="jurnal-content" class="hidden">
                {{-- Halaman 1: Cover --}}
                <div class="page-break bg-white" style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center; padding: 2rem;">
                    <div class="text-center">
                        {{-- Logo Sekolah --}}
                        @if($siswa->sekolah->logo ?? false)
                            <img src="{{ asset('storage/' . $siswa->sekolah->logo) }}" alt="Logo" class="w-32 h-32 mx-auto mb-8 object-contain">
                        @else
                            <div class="w-32 h-32 mx-auto mb-8 bg-primary-100 dark:bg-primary-900 rounded-full flex items-center justify-center">
                                <svg class="w-20 h-20 text-primary-600 dark:text-primary-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z"/>
                                </svg>
                            </div>
                        @endif

                        <h1 class="text-4xl font-bold text-gray-900 mb-4">JURNAL HARIAN</h1>
                        <h2 class="text-3xl font-semibold text-gray-800 mb-6">PRAKTIK KERJA LAPANGAN</h2>
                        
                        <div class="mt-12 space-y-4">
                            <div class="text-2xl font-semibold text-gray-900">{{ $siswa->nama_siswa }}</div>
                            <div class="text-xl text-gray-700">{{ $siswa->kelas->nama_kelas ?? '-' }}</div>
                            <div class="text-lg text-gray-600 mt-8">{{ $siswa->sekolah->nama_sekolah ?? 'SEKOLAH' }}</div>
                        </div>
                    </div>
                </div>

                {{-- Halaman 2: Informasi Siswa --}}
                <div class="page-break bg-white p-12">
                    <h2 class="text-3xl font-bold text-gray-900 mb-8 text-center">INFORMASI PESERTA DIDIK</h2>
                    
                    <div class="space-y-6 max-w-3xl mx-auto">
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Nama Lengkap</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $siswa->nama_siswa }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Kelas</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $siswa->kelas->nama_kelas ?? '-' }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Tempat, Tanggal Lahir</div>
                            <div class="col-span-2 font-semibold text-gray-900">
                                : {{ $siswa->tempat_lahir ?? '-' }}, 
                                {{ $siswa->tanggal_lahir ? \Carbon\Carbon::parse($siswa->tanggal_lahir)->translatedFormat('d F Y') : '-' }}
                            </div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Tempat PKL (DUDI)</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $prakerinSiswa->dudi->nama_dudi ?? '-' }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Alamat DUDI</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $prakerinSiswa->dudi->alamat ?? $prakerinSiswa->dudi->alamat_dudi ?? '-' }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Pembimbing DUDI</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $prakerinSiswa->dudiPembimbing->nama_pembimbing ?? '-' }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Guru Pembimbing</div>
                            <div class="col-span-2 font-semibold text-gray-900">: {{ $prakerinSiswa->guru->nama_guru ?? '-' }}</div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Periode PKL</div>
                            <div class="col-span-2 font-semibold text-gray-900">
                                : {{ \Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai)->translatedFormat('d F Y') }} - 
                                {{ \Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai)->translatedFormat('d F Y') }}
                            </div>
                        </div>
                    </div>
                </div>

                {{-- Halaman 3+: Jurnal Harian --}}
                @foreach($jurnalHarian as $index => $jurnal)
                    <div class="page-break bg-white p-12">
                        <div class="border-b-4 border-primary-600 pb-4 mb-6">
                            <div>
                                <h3 class="text-2xl font-bold text-gray-900">Jurnal Hari ke-{{ $index + 1 }}</h3>
                                <p class="text-lg text-gray-600 mt-1">
                                    {{ \Carbon\Carbon::parse($jurnal->tanggal)->locale('id')->isoFormat('dddd, D MMMM YYYY') }}
                                </p>
                            </div>
                        </div>

                        <div class="prose prose-lg max-w-none">
                            <h4 class="text-xl font-semibold text-gray-800 mb-4">Kegiatan:</h4>
                            <div class="text-gray-700 whitespace-pre-line leading-relaxed text-justify">
                                {{ strip_tags($jurnal->kegiatan) }}
                            </div>
                        </div>

                        {{-- Footer --}}
                        <div class="mt-12 pt-6 border-t border-gray-300 text-sm text-gray-500 text-right">
                            Halaman {{ $index + 3 }} dari {{ $jurnalHarian->count() + 2 }}
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @endif

    @push('scripts')
    <script>
        function printJurnal() {
            var printContent = document.getElementById('jurnal-content').cloneNode(true);
            printContent.classList.remove('hidden');
            
            var printWindow = window.open('', '_blank');
            
            printWindow.document.open();
            printWindow.document.write('<!DOCTYPE html>');
            printWindow.document.write('<html><head>');
            printWindow.document.write('<title>Jurnal Harian PKL - {{ $siswa->nama_siswa }}</title>');
            printWindow.document.write('<meta charset="utf-8">');
            printWindow.document.write('<script src="https:\/\/cdn.tailwindcss.com"><\/script>');
            printWindow.document.write('<style>');
            printWindow.document.write('@page { size: A4 portrait; margin: 15mm; }');
            printWindow.document.write('body { margin: 0; padding: 0; font-family: "Times New Roman", Times, serif; }');
            printWindow.document.write('* { print-color-adjust: exact; -webkit-print-color-adjust: exact; }');
            printWindow.document.write('.page-break { page-break-after: always; break-after: page; }');
            printWindow.document.write('.page-break:last-child { page-break-after: avoid; }');
            printWindow.document.write('@media print { .page-break { page-break-after: always; } }');
            printWindow.document.write('h1, h2, h3, h4 { page-break-after: avoid; }');
            printWindow.document.write('table, img { page-break-inside: avoid; }');
            printWindow.document.write('<\/style>');
            printWindow.document.write('<\/head><body class="bg-white">');
            printWindow.document.write(printContent.innerHTML);
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
