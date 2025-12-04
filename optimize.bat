@echo off
echo ========================================
echo OPTIMASI PERFORMA FILAMENT V3
echo Jurnal PKL - Performance Optimization
echo ========================================
echo.

set PHP=C:\laragon\bin\php\php-8.2.29-Win32-vs16-x64\php.exe

echo [1/8] Clearing all caches...
%PHP% artisan cache:clear
%PHP% artisan config:clear  
%PHP% artisan route:clear
%PHP% artisan view:clear
echo Cache cleared!
echo.

echo [2/8] Caching configurations...
%PHP% artisan config:cache
%PHP% artisan route:cache
%PHP% artisan view:cache
echo Configurations cached!
echo.

echo [3/8] Caching Filament components...
%PHP% artisan filament:cache-components
echo Filament components cached!
echo.

echo [4/8] Optimizing Composer autoloader...
composer dump-autoload -o
echo Composer optimized!
echo.

echo [5/8] Discovering packages...
%PHP% artisan package:discover
echo Packages discovered!
echo.

echo [6/8] Optimizing database...
%PHP% artisan optimize
echo Database optimized!
echo.

echo [7/8] Building Vite assets...
call npm run build
echo Vite assets built!
echo.

echo [8/8] Final optimization...
%PHP% artisan optimize:clear
%PHP% artisan optimize
echo Final optimization complete!
echo.

echo ========================================
echo OPTIMIZATION COMPLETE!
echo ========================================
echo.
echo Recommended: Restart Laragon for best results
echo.
pause
