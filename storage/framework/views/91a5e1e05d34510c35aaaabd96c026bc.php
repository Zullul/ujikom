<div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
    <div class="space-y-3 max-h-96 overflow-y-auto">
        <!--[if BLOCK]><![endif]--><?php $__empty_1 = true; $__currentLoopData = $this->getData()['activities'] ?? []; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $activity): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); $__empty_1 = false; ?>
            <div class="flex items-start justify-between p-3 border-l-4 border-amber-400 dark:border-amber-600 bg-gray-50 dark:bg-gray-700 rounded">
                <div class="flex-1">
                    <p class="text-sm font-medium text-gray-900 dark:text-white">
                        <?php echo e($activity->description); ?>

                    </p>
                    <p class="text-xs text-gray-600 dark:text-gray-400">
                        <?php echo e($activity->causer?->name ?? 'Sistem'); ?>

                    </p>
                    <p class="text-xs text-gray-500 dark:text-gray-500">
                        <?php echo e($activity->created_at->diffForHumans()); ?>

                    </p>
                </div>
                <span class="text-xs px-2 py-1 bg-amber-100 dark:bg-amber-900 text-amber-800 dark:text-amber-200 rounded">
                    <?php echo e($activity->log_name); ?>

                </span>
            </div>
        <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); if ($__empty_1): ?>
            <p class="text-center text-gray-500 dark:text-gray-400 py-4">Tidak ada aktivitas terbaru</p>
        <?php endif; ?><!--[if ENDBLOCK]><![endif]-->
    </div>
</div>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/widgets/admin-recent-activity.blade.php ENDPATH**/ ?>