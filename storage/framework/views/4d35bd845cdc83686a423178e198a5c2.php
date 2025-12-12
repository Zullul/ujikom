<?php if (isset($component)) { $__componentOriginal166a02a7c5ef5a9331faf66fa665c256 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal166a02a7c5ef5a9331faf66fa665c256 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'filament-panels::components.page.index','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('filament-panels::page'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
    <!--[if BLOCK]><![endif]--><?php if(!$prakerinSiswa): ?>
        <?php if (isset($component)) { $__componentOriginal9b945b32438afb742355861768089b04 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal9b945b32438afb742355861768089b04 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'filament::components.card','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('filament::card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
            <div class="text-center py-8">
                <svg class="mx-auto h-12 w-12 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 9v2m0 4h.01m-6.938 4h13.856c1.54 0 2.502-1.667 1.732-3L13.732 4c-.77-1.333-2.694-1.333-3.464 0L3.34 16c-.77 1.333.192 3 1.732 3z"/>
                </svg>
                <p class="mt-4 text-gray-500">Tidak ada periode PKL aktif.</p>
            </div>
         <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal9b945b32438afb742355861768089b04)): ?>
<?php $attributes = $__attributesOriginal9b945b32438afb742355861768089b04; ?>
<?php unset($__attributesOriginal9b945b32438afb742355861768089b04); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal9b945b32438afb742355861768089b04)): ?>
<?php $component = $__componentOriginal9b945b32438afb742355861768089b04; ?>
<?php unset($__componentOriginal9b945b32438afb742355861768089b04); ?>
<?php endif; ?>
    <?php else: ?>
        <div class="space-y-4">
            
            <?php if (isset($component)) { $__componentOriginal9b945b32438afb742355861768089b04 = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal9b945b32438afb742355861768089b04 = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'filament::components.card','data' => []] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('filament::card'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes([]); ?>
                <div class="flex items-center justify-between">
                    <div>
                        <h3 class="text-lg font-semibold text-gray-900 dark:text-gray-100">
                            Jurnal Harian PKL
                        </h3>
                        <p class="text-sm text-gray-500 dark:text-gray-400 mt-1">
                            Total <?php echo e($jurnalHarian->count()); ?> jurnal harian
                        </p>
                        <p class="text-sm text-gray-500 dark:text-gray-400">
                            Periode: <?php echo e(\Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai)->translatedFormat('d M Y')); ?> - 
                            <?php echo e(\Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai)->translatedFormat('d M Y')); ?>

                        </p>
                    </div>
                    <?php if (isset($component)) { $__componentOriginal6330f08526bbb3ce2a0da37da512a11f = $component; } ?>
<?php if (isset($attributes)) { $__attributesOriginal6330f08526bbb3ce2a0da37da512a11f = $attributes; } ?>
<?php $component = Illuminate\View\AnonymousComponent::resolve(['view' => 'filament::components.button.index','data' => ['onclick' => 'printJurnal()','color' => 'primary','icon' => 'heroicon-o-printer']] + (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag ? (array) $attributes->getIterator() : [])); ?>
<?php $component->withName('filament::button'); ?>
<?php if ($component->shouldRender()): ?>
<?php $__env->startComponent($component->resolveView(), $component->data()); ?>
<?php if (isset($attributes) && $attributes instanceof Illuminate\View\ComponentAttributeBag && $constructor = (new ReflectionClass(Illuminate\View\AnonymousComponent::class))->getConstructor()): ?>
<?php $attributes = $attributes->except(collect($constructor->getParameters())->map->getName()->all()); ?>
<?php endif; ?>
<?php $component->withAttributes(['onclick' => 'printJurnal()','color' => 'primary','icon' => 'heroicon-o-printer']); ?>
                        Cetak Jurnal
                     <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal6330f08526bbb3ce2a0da37da512a11f)): ?>
<?php $attributes = $__attributesOriginal6330f08526bbb3ce2a0da37da512a11f; ?>
<?php unset($__attributesOriginal6330f08526bbb3ce2a0da37da512a11f); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal6330f08526bbb3ce2a0da37da512a11f)): ?>
<?php $component = $__componentOriginal6330f08526bbb3ce2a0da37da512a11f; ?>
<?php unset($__componentOriginal6330f08526bbb3ce2a0da37da512a11f); ?>
<?php endif; ?>
                </div>
             <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal9b945b32438afb742355861768089b04)): ?>
<?php $attributes = $__attributesOriginal9b945b32438afb742355861768089b04; ?>
<?php unset($__attributesOriginal9b945b32438afb742355861768089b04); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal9b945b32438afb742355861768089b04)): ?>
<?php $component = $__componentOriginal9b945b32438afb742355861768089b04; ?>
<?php unset($__componentOriginal9b945b32438afb742355861768089b04); ?>
<?php endif; ?>

            
            <div id="jurnal-content" class="hidden">
                
                <div class="page-break bg-white" style="min-height: 100vh; display: flex; flex-direction: column; justify-content: center; align-items: center; padding: 2rem;">
                    <div class="text-center">
                        
                        <!--[if BLOCK]><![endif]--><?php if($siswa->sekolah->logo ?? false): ?>
                            <img src="<?php echo e(asset('storage/' . $siswa->sekolah->logo)); ?>" alt="Logo" class="w-32 h-32 mx-auto mb-8 object-contain">
                        <?php else: ?>
                            <div class="w-32 h-32 mx-auto mb-8 bg-primary-100 dark:bg-primary-900 rounded-full flex items-center justify-center">
                                <svg class="w-20 h-20 text-primary-600 dark:text-primary-400" fill="currentColor" viewBox="0 0 20 20">
                                    <path d="M10.394 2.08a1 1 0 00-.788 0l-7 3a1 1 0 000 1.84L5.25 8.051a.999.999 0 01.356-.257l4-1.714a1 1 0 11.788 1.838L7.667 9.088l1.94.831a1 1 0 00.787 0l7-3a1 1 0 000-1.838l-7-3zM3.31 9.397L5 10.12v4.102a8.969 8.969 0 00-1.05-.174 1 1 0 01-.89-.89 11.115 11.115 0 01.25-3.762zM9.3 16.573A9.026 9.026 0 007 14.935v-3.957l1.818.78a3 3 0 002.364 0l5.508-2.361a11.026 11.026 0 01.25 3.762 1 1 0 01-.89.89 8.968 8.968 0 00-5.35 2.524 1 1 0 01-1.4 0zM6 18a1 1 0 001-1v-2.065a8.935 8.935 0 00-2-.712V17a1 1 0 001 1z"/>
                                </svg>
                            </div>
                        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->

                        <h1 class="text-4xl font-bold text-gray-900 mb-4">JURNAL HARIAN</h1>
                        <h2 class="text-3xl font-semibold text-gray-800 mb-6">PRAKTIK KERJA LAPANGAN</h2>
                        
                        <div class="mt-12 space-y-4">
                            <div class="text-2xl font-semibold text-gray-900"><?php echo e($siswa->nama_siswa); ?></div>
                            <div class="text-xl text-gray-700"><?php echo e($siswa->kelas->nama_kelas ?? '-'); ?></div>
                            <div class="text-lg text-gray-600 mt-8"><?php echo e($siswa->sekolah->nama_sekolah ?? 'SEKOLAH'); ?></div>
                        </div>
                    </div>
                </div>

                
                <div class="page-break bg-white p-12">
                    <h2 class="text-3xl font-bold text-gray-900 mb-8 text-center">INFORMASI PESERTA DIDIK</h2>
                    
                    <div class="space-y-6 max-w-3xl mx-auto">
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Nama Lengkap</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($siswa->nama_siswa); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Kelas</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($siswa->kelas->nama_kelas ?? '-'); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Tempat, Tanggal Lahir</div>
                            <div class="col-span-2 font-semibold text-gray-900">
                                : <?php echo e($siswa->tempat_lahir ?? '-'); ?>, 
                                <?php echo e($siswa->tanggal_lahir ? \Carbon\Carbon::parse($siswa->tanggal_lahir)->translatedFormat('d F Y') : '-'); ?>

                            </div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Tempat PKL (DUDI)</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($prakerinSiswa->dudi->nama_dudi ?? '-'); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Alamat DUDI</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($prakerinSiswa->dudi->alamat ?? $prakerinSiswa->dudi->alamat_dudi ?? '-'); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Pembimbing DUDI</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($prakerinSiswa->dudiPembimbing->nama_pembimbing ?? '-'); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Guru Pembimbing</div>
                            <div class="col-span-2 font-semibold text-gray-900">: <?php echo e($prakerinSiswa->guru->nama_guru ?? '-'); ?></div>
                        </div>
                        
                        <div class="grid grid-cols-3 gap-4 border-b border-gray-200 pb-4">
                            <div class="text-gray-600 font-medium">Periode PKL</div>
                            <div class="col-span-2 font-semibold text-gray-900">
                                : <?php echo e(\Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_mulai)->translatedFormat('d F Y')); ?> - 
                                <?php echo e(\Carbon\Carbon::parse($prakerinSiswa->prakerin->tanggal_selesai)->translatedFormat('d F Y')); ?>

                            </div>
                        </div>
                    </div>
                </div>

                
                <!--[if BLOCK]><![endif]--><?php $__currentLoopData = $jurnalHarian; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $index => $jurnal): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
                    <div class="page-break bg-white p-12">
                        <div class="border-b-4 border-primary-600 pb-4 mb-6">
                            <div>
                                <h3 class="text-2xl font-bold text-gray-900">Jurnal Hari ke-<?php echo e($index + 1); ?></h3>
                                <p class="text-lg text-gray-600 mt-1">
                                    <?php echo e(\Carbon\Carbon::parse($jurnal->tanggal)->locale('id')->isoFormat('dddd, D MMMM YYYY')); ?>

                                </p>
                            </div>
                        </div>

                        <div class="prose prose-lg max-w-none">
                            <h4 class="text-xl font-semibold text-gray-800 mb-4">Kegiatan:</h4>
                            <div class="text-gray-700 whitespace-pre-line leading-relaxed text-justify">
                                <?php echo e(strip_tags($jurnal->kegiatan)); ?>

                            </div>
                        </div>

                        
                        <div class="mt-12 pt-6 border-t border-gray-300 text-sm text-gray-500 text-right">
                            Halaman <?php echo e($index + 3); ?> dari <?php echo e($jurnalHarian->count() + 2); ?>

                        </div>
                    </div>
                <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?><!--[if ENDBLOCK]><![endif]-->
            </div>
        </div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->

    <?php $__env->startPush('scripts'); ?>
    <script>
        function printJurnal() {
            var printContent = document.getElementById('jurnal-content').cloneNode(true);
            printContent.classList.remove('hidden');
            
            var printWindow = window.open('', '_blank');
            
            printWindow.document.open();
            printWindow.document.write('<!DOCTYPE html>');
            printWindow.document.write('<html><head>');
            printWindow.document.write('<title>Jurnal Harian PKL - <?php echo e($siswa->nama_siswa); ?></title>');
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
    <?php $__env->stopPush(); ?>
 <?php echo $__env->renderComponent(); ?>
<?php endif; ?>
<?php if (isset($__attributesOriginal166a02a7c5ef5a9331faf66fa665c256)): ?>
<?php $attributes = $__attributesOriginal166a02a7c5ef5a9331faf66fa665c256; ?>
<?php unset($__attributesOriginal166a02a7c5ef5a9331faf66fa665c256); ?>
<?php endif; ?>
<?php if (isset($__componentOriginal166a02a7c5ef5a9331faf66fa665c256)): ?>
<?php $component = $__componentOriginal166a02a7c5ef5a9331faf66fa665c256; ?>
<?php unset($__componentOriginal166a02a7c5ef5a9331faf66fa665c256); ?>
<?php endif; ?>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/pages/cetak-jurnal-harian.blade.php ENDPATH**/ ?>