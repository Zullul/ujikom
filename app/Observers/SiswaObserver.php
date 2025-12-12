<?php

namespace App\Observers;

use App\Models\Siswa;
use App\Models\User;
use Illuminate\Support\Str;

class SiswaObserver
{
    public function created(Siswa $siswa)
    {
        // Auto create user untuk siswa
        User::create([
            'name' => $siswa->nama_siswa,
            'username' => $siswa->nis, // Menggunakan NIS sebagai username
            'email' => $this->generateEmail($siswa->nis),
            'password' => bcrypt($siswa->nis), // Password default = NIS
            'role_id' => 1, // Siswa
            'role_type' => 'siswa',
            'ref_id' => $siswa->id,
            'sekolah_id' => $siswa->sekolah_id,
        ]);
    }

    private function generateEmail( $nis)
    {
        return $nis . '@jurnalpkl.id';
    }
}
