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

        // Auto create user untuk orangtua (parent) dengan username berdasarkan NIS anak
        // Format: nis_orangtua (e.g., jika nis siswa "12345", orangtua username "ortu_12345")
        User::create([
            'name' => 'Orangtua dari ' . $siswa->nama_siswa,
            'username' => 'ortu_' . $siswa->nis, // Username unik untuk orangtua
            'email' => 'ortu_' . $this->generateEmail($siswa->nis),
            'password' => bcrypt($siswa->nis), // Password default = NIS anak
            'role_id' => 6, // Orangtua (role_id baru)
            'role_type' => 'orangtua',
            'ref_id' => $siswa->id, // Link ke siswa (anaknya)
            'sekolah_id' => $siswa->sekolah_id,
        ]);
    }

    private function generateEmail( $nis)
    {
        return $nis . '@jurnalpkl.id';
    }
}
