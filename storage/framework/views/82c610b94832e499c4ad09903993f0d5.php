<div class="p-6 bg-white dark:bg-gray-800 rounded-lg shadow">
    <?php $data = $this->getData(); ?>
    
    <div class="grid grid-cols-3 gap-3 mb-4">
        <!-- Attendance -->
        <div class="p-3 bg-blue-50 dark:bg-blue-900 rounded">
            <p class="text-2xl font-bold text-blue-900 dark:text-blue-100"><?php echo e($data['attendanceThisWeek']); ?></p>
            <p class="text-xs text-blue-700 dark:text-blue-300">Hari Hadir</p>
        </div>
        
        <!-- Reports -->
        <div class="p-3 bg-green-50 dark:bg-green-900 rounded">
            <p class="text-2xl font-bold text-green-900 dark:text-green-100"><?php echo e($data['reportsThisWeek']); ?></p>
            <p class="text-xs text-green-700 dark:text-green-300">Laporan Kirim</p>
        </div>
        
        <!-- Streak -->
        <div class="p-3 bg-purple-50 dark:bg-purple-900 rounded">
            <p class="text-2xl font-bold text-purple-900 dark:text-purple-100"><?php echo e($data['streak']); ?></p>
            <p class="text-xs text-purple-700 dark:text-purple-300">Hari Berturut-turut</p>
        </div>
    </div>

    <div class="text-xs text-gray-600 dark:text-gray-400">
        <p>Periode: <?php echo e(\Carbon\Carbon::now()->startOfWeek()->isoFormat('DD MMMM')); ?> - <?php echo e(\Carbon\Carbon::now()->endOfWeek()->isoFormat('DD MMMM YYYY')); ?></p>
    </div>
</div>
<?php /**PATH C:\laragon\www\jurnal-pkl\resources\views/filament/widgets/siswa-weekly-progress.blade.php ENDPATH**/ ?>