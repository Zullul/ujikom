<?php

namespace App\Observers;

use App\Models\Guru;
use App\Models\User;
use Illuminate\Support\Str;

class GuruObserver
{
    public function created(Guru $guru)
    {
        User::create([
            'name' => $guru->nama_guru,
            'username' => $guru->nip,
            'email' => $this->generateEmail($guru->nama_guru, $guru->nip),
            'password' => bcrypt($guru->nip), // Password default = NIP
            'role_id' => 2, // Guru
            'role_type' => 'guru',
            'ref_id' => $guru->id,
            'sekolah_id' => $guru->sekolah_id,
        ]);
    }

    private function generateEmail($nama, $nip)
    {
        $namaSlug = Str::slug(strtolower($nama));
        return $namaSlug . '.' . $nip . '@guru.com';
    }
}
