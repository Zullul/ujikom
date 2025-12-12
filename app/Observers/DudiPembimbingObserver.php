<?php

namespace App\Observers;

use App\Models\DudiPembimbing;
use App\Models\User;
use Illuminate\Support\Str;

class DudiPembimbingObserver
{
    /**
     * Handle the DudiPembimbing "created" event.
     *
     * @param  \App\Models\DudiPembimbing  $pembimbing
     * @return void
     */
    public function created(DudiPembimbing $pembimbing)
    {
        // Ambil nama depan pembimbing (kata pertama)
        $namaLengkap = $pembimbing->nama_pembimbing;
        $namaDepan = strtolower(explode(' ', $namaLengkap)[0]);
        
        // Ambil nama DUDI dan buat slug
        $namaDudi = $pembimbing->dudi->nama_dudi;
        $dudiSlug = \Illuminate\Support\Str::slug(strtolower($namaDudi));
        
        // Format: namadepan.nama-dudi
        $username = $namaDepan . '.' . $dudiSlug;
        $email = $username . '@jurnalpkl.id';
        
        // Name: Nama Pembimbing (Nama DUDI)
        $displayName = $namaLengkap . ' (' . $namaDudi . ')';

        /**
         * Gunakan firstOrCreate untuk mencegah duplikasi.
         * Username dan email sudah unik karena kombinasi nama depan + nama DUDI
         */
        User::firstOrCreate(
            ['email' => $email], // Kunci untuk mencari
            [
                'name'       => $displayName, // Contoh: "Ayu (Access Media)"
                'username'   => $username,    // Contoh: "ayu.access-media"
                'password'   => bcrypt($username), // Password sama dengan username
                'role_id'    => 5, // Dudi Pembimbing
                'role_type'  => 'dudi_pembimbing',
                'ref_id'     => $pembimbing->id,
                'sekolah_id' => $pembimbing->dudi->sekolah_id,
            ]
        );
    }
}
