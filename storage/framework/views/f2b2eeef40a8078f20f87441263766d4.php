<div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
    <?php $data = $this->getData(); ?>
    
    <!--[if BLOCK]><![endif]--><?php if($data['count'] > 0): ?>
        <div class="mb-4 p-3 bg-red-50 dark:bg-red-900 border border-red-200 dark:border-red-700 rounded">
            <p class="text-sm font-semibold text-red-900 dark:text-red-100">
                ⚠️ <?php echo e($data['count']); ?> laporan perlu verifikasi
            </p>
        </div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->

    <div class="space-y-2 max-h-96 overflow-y-auto">
        <!--[if BLOCK]><![endif]--><?php $__empty_1 = true; $__currentLoopData = $data['reports'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $report): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <div class="p-3 border-l-4 border-red-400 dark:border-red-600 bg-gray-50 dark:bg-gray-700 rounded hover:bg-gray-100 dark:hover:bg-gray-600 transition">
                <div class="flex items-start justify-between">
                    <div class="flex-1">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            <?php echo e($report->siswa->nama_siswa); ?>

                        </p>
                        <p class="text-xs text-gray-600 dark:text-gray-400">
                            📋 Minggu: <?php echo e($report->minggu_ke); ?>

                        </p>
                        <p class="text-xs text-gray-500 dark:text-gray-500">
                            <?php echo e(\Carbon\Carbon::parse($report->tanggal_mulai_minggu)->isoFormat('DD MMMM')); ?> - <?php echo e(\Carbon\Carbon::parse($report->tanggal_selesai_minggu)->isoFormat('DD MMMM YYYY')); ?>

                        </p>
                    </div>
                    <!--[if BLOCK]><![endif]--><?php if(!$report->verifikasi_dudi): ?>
                        <span class="text-xs px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 rounded">
                            ⏳ Pending
                        </span>
                    <?php else: ?>
                        <span class="text-xs px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 rounded">
                            ✓ Terverifikasi
                        </span>
                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <p class="text-center text-gray-500 dark:text-gray-400 py-4">✓ Semua laporan sudah terverifikasi</p>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/widgets/dudi-pending-validation.blade.php ENDPATH**/ ?>