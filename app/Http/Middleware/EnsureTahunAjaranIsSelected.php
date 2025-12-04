<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Scopes\TahunAjaranScope;

class EnsureTahunAjaranIsSelected
{
    public function handle(Request $request, Closure $next)
    {
        $user = Auth::user();

        // Skip middleware untuk logout dan halaman pilih tahun ajaran
        if ($request->routeIs('filament.admin.auth.logout') || 
            $request->routeIs('filament.admin.pages.pilih-tahun-ajaran')) {
            return $next($request);
        }

        if ($user && ($user->isGuru() || $user->isDudiPembimbing() || $user->isAdminSekolah())) {

            if (!session()->has('selected_tahun_ajaran_id')) {
                
                // Auto-select untuk guru dan dudi pembimbing jika hanya punya 1 tahun ajaran
                if ($user->isGuru() || $user->isDudiPembimbing()) {
                    $tahunAjaranIds = $this->getTahunAjaranIds($user);
                    
                    // Jika hanya ada 1 tahun ajaran, langsung set ke session
                    if ($tahunAjaranIds->count() === 1) {
                        session(['selected_tahun_ajaran_id' => $tahunAjaranIds->first()]);
                        return $next($request);
                    }
                }
                
                // Jika lebih dari 1 atau admin, redirect ke halaman pilih
                return redirect()->route('filament.admin.pages.pilih-tahun-ajaran');
            }
        }

        return $next($request);
    }

    /**
     * Get tahun ajaran IDs untuk user
     */
    private function getTahunAjaranIds($user)
    {
        if ($user->isGuru()) {
            return \App\Models\Guru::withoutGlobalScope(TahunAjaranScope::class)
                ->where('nama_guru', $user->name)
                ->pluck('tahun_ajaran_id')
                ->unique();
        } elseif ($user->isDudiPembimbing()) {
            // Cari berdasarkan ref_id karena setiap pembimbing punya user unik
            return \App\Models\DudiPembimbing::withoutGlobalScope(TahunAjaranScope::class)
                ->where('id', $user->ref_id)
                ->pluck('tahun_ajaran_id')
                ->unique();
        }
        
        return collect();
    }
}
