<div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
    <?php $data = $this->getData(); ?>
    
    <div class="space-y-2">
        <!--[if BLOCK]><![endif]--><?php $__empty_1 = true; $__currentLoopData = $data['dudis'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $dudi): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <div class="p-3 border-l-4 border-amber-400 dark:border-amber-600 bg-gray-50 dark:bg-gray-700 rounded">
                <div class="flex items-center justify-between">
                    <div class="flex-1">
                        <p class="text-sm font-medium text-gray-900 dark:text-white">
                            <?php echo e($dudi->nama_dudi); ?>

                        </p>
                        <p class="text-xs text-gray-600 dark:text-gray-400">
                            <?php echo e(Str::limit($dudi->alamat, 50)); ?>

                        </p>
                    </div>
                    <div class="text-right">
                        <p class="text-lg font-bold text-amber-600 dark:text-amber-400">
                            <?php echo e($dudi->prakerin_siswa_count); ?>

                        </p>
                        <p class="text-xs text-gray-600 dark:text-gray-400">Siswa Aktif</p>
                    </div>
                </div>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <p class="text-center text-gray-500 dark:text-gray-400 py-4">Tidak ada DUDI terdaftar</p>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/widgets/admin-top-partners.blade.php ENDPATH**/ ?>