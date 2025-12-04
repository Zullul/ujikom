<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class CheckSchoolStatus
{
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();

        // Cek hanya untuk user yang memiliki sekolah_id (bukan super admin)
        if ($user && $user->sekolah_id) {
            // Eager load sekolah jika belum ter-load
            $sekolah = $user->relationLoaded('sekolah') ? $user->sekolah : $user->load('sekolah')->sekolah;

            if (!$sekolah->is_aktif || Carbon::now()->gt($sekolah->masa_aktif_selesai)) {
                Auth::logout();
                return redirect()->route('filament.admin.auth.login')->withErrors([
                    'data.username' => 'Akun Anda dinonaktifkan karena masa aktif sekolah telah berakhir. Silakan hubungi Super Admin.',
                ]);
            }
        }

        return $next($request);
    }
}
