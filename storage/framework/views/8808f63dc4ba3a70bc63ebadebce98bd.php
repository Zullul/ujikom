<div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
    <?php $data = $this->getData(); ?>
    
    <!--[if BLOCK]><![endif]--><?php if($data['count'] > 0): ?>
        <div class="mb-4 p-3 bg-yellow-50 dark:bg-yellow-900 border border-yellow-200 dark:border-yellow-700 rounded">
            <p class="text-sm font-semibold text-yellow-900 dark:text-yellow-100">
                📋 <?php echo e($data['count']); ?> laporan menunggu validasi Anda
            </p>
        </div>
    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->

    <div class="space-y-2 max-h-96 overflow-y-auto">
        <!--[if BLOCK]><![endif]--><?php $__empty_1 = true; $__currentLoopData = $data['reports'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $report): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <div class="p-3 border-l-4 border-blue-400 dark:border-blue-600 bg-gray-50 dark:bg-gray-700 rounded hover:bg-gray-100 dark:hover:bg-gray-600 transition">
                <div class="flex items-start justify-between">
                    <div class="flex-1">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            <?php echo e($report->prakerinSiswa->siswa->nama_siswa); ?>

                        </p>
                        <p class="text-xs text-gray-600 dark:text-gray-400">
                            <?php echo e($report->prakerinSiswa->dudi->nama_dudi); ?>

                        </p>
                        <p class="text-xs text-gray-500 dark:text-gray-500">
                            Minggu: <?php echo e($report->minggu_ke); ?> | <?php echo e($report->created_at->format('d M Y')); ?>

                        </p>
                    </div>
                    <!--[if BLOCK]><![endif]--><?php if(!$report->verifikasi_guru): ?>
                        <span class="text-xs px-2 py-1 bg-orange-100 dark:bg-orange-900 text-orange-800 dark:text-orange-200 rounded">
                            ⏳ Pending
                        </span>
                    <?php else: ?>
                        <span class="text-xs px-2 py-1 bg-green-100 dark:bg-green-900 text-green-800 dark:text-green-200 rounded">
                            ✓ Tervalidasi
                        </span>
                    <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <p class="text-center text-gray-500 dark:text-gray-400 py-4">✓ Semua laporan sudah tervalidasi</p>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/widgets/guru-pending-validation.blade.php ENDPATH**/ ?>