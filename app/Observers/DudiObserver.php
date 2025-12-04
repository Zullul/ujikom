<?php

namespace App\Observers;

use App\Models\Dudi;
use App\Models\User;
use Illuminate\Support\Str;

class DudiObserver
{
    /**
     * Handle the Dudi "created" event.
     *
     * @param  \App\Models\Dudi  $dudi
     * @return void
     */
    public function created(Dudi $dudi)
    {
        // HAPUS pembuatan akun User untuk Pimpinan (tidak berguna)
        // Hanya buat DudiPembimbing dari Instruktur

        if ($dudi->instruktur) {
            // Ambil tahun_ajaran_id dari session atau dari dudi itu sendiri
            $tahunAjaranId = session('selected_tahun_ajaran_id') ?? $dudi->tahun_ajaran_id;
            
            // Pastikan ada tahun_ajaran_id sebelum membuat pembimbing
            if ($tahunAjaranId) {
                // Buat DudiPembimbing
                $pembimbing = \App\Models\DudiPembimbing::create([
                    'nama_pembimbing' => $dudi->instruktur,
                    'dudi_id' => $dudi->id,
                    'tahun_ajaran_id' => $tahunAjaranId,
                ]);

                // User akan otomatis dibuat oleh DudiPembimbingObserver
                // dengan username dan email yang unik (menggunakan ID pembimbing)
            }
        }
    }
    /**
     * Handle the Dudi "updated" event.
     *
     * @param  \App\Models\Dudi  $dudi
     * @return void
     */
    public function updated(Dudi $dudi)
    {
        // Jika nama instruktur berubah, update data pembimbing dan user terkait
        if ($dudi->isDirty('instruktur')) {
            $pembimbing = \App\Models\DudiPembimbing::where('dudi_id', $dudi->id)
                ->where('tahun_ajaran_id', session('selected_tahun_ajaran_id'))
                ->first();
            
            if ($pembimbing) {
                // Update nama pembimbing
                $pembimbing->update([
                    'nama_pembimbing' => $dudi->instruktur,
                ]);
                
                // Update User yang terkait
                $user = User::where('ref_id', $pembimbing->id)
                    ->where('role_type', 'dudi_pembimbing')
                    ->first();
                
                if ($user) {
                    // Generate username baru
                    $namaDepan = strtolower(explode(' ', $dudi->instruktur)[0]);
                    $dudiSlug = \Illuminate\Support\Str::slug(strtolower($dudi->nama_dudi));
                    $username = $namaDepan . '.' . $dudiSlug;
                    
                    // Update user
                    $user->update([
                        'name' => $dudi->instruktur . ' (' . $dudi->nama_dudi . ')',
                        'username' => $username,
                        'password' => bcrypt($username), // Update password juga
                    ]);
                }
            }
        }
        
        // Jika nama DUDI berubah, update display name semua pembimbing
        if ($dudi->isDirty('nama_dudi')) {
            $pembimbings = \App\Models\DudiPembimbing::where('dudi_id', $dudi->id)->get();
            
            foreach ($pembimbings as $pembimbing) {
                $user = User::where('ref_id', $pembimbing->id)
                    ->where('role_type', 'dudi_pembimbing')
                    ->first();
                
                if ($user) {
                    // Update username dan display name dengan nama DUDI baru
                    $namaDepan = strtolower(explode(' ', $pembimbing->nama_pembimbing)[0]);
                    $dudiSlug = \Illuminate\Support\Str::slug(strtolower($dudi->nama_dudi));
                    $username = $namaDepan . '.' . $dudiSlug;
                    
                    $user->update([
                        'name' => $pembimbing->nama_pembimbing . ' (' . $dudi->nama_dudi . ')',
                        'username' => $username,
                        'email' => $username . '@dudi.pembimbing.com',
                        'password' => bcrypt($username),
                    ]);
                }
            }
        }
    }
}
    
