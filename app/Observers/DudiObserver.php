<?php

namespace App\Observers;

use App\Models\Dudi;
use App\Models\User;
use Illuminate\Support\Str;

class DudiObserver
{
    public function created(Dudi $dudi)
    {
        User::create([
            'name' => $dudi->pimpinan, // Menggunakan nama pimpinan
            'username' => 'dudi_' . $dudi->id,
            'email' => $this->generateEmail($dudi->nama_dudi),
            'password' => bcrypt('dudi123'), // Password default
            'role_id' => 3, // Dudi
            'role_type' => 'dudi',
            'ref_id' => $dudi->id,
            'sekolah_id' => $dudi->sekolah_id,
        ]);
    }

    private function generateEmail($namaDudi)
    {
        $namaSlug = Str::slug(strtolower($namaDudi));
        return $namaSlug . '@dudi.com';
    }
}
