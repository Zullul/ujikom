<?php

namespace App\Observers;

use App\Models\Sekolah;
use App\Models\User;
use Illuminate\Support\Str;

class SekolahObserver
{
    /**
     * Handle the Sekolah "created" event.
     *
     * @param  \App\Models\Sekolah  $sekolah
     * @return void
     */
    public function created(Sekolah $sekolah)
    {
        // Otomatis buat user dengan role admin_sekolah
        User::create([
            'name' => "Admin " . $sekolah->nama_sekolah, // Menggunakan 'nama_sekolah'
            'username' => $this->generateUsername($sekolah->nama_sekolah),
            'email' => $this->generateEmail($sekolah->nama_sekolah),
            'password' => bcrypt($this->generateUsername($sekolah->nama_sekolah)), // Password sama dengan username
            'role_type' => 'admin_sekolah',
            'role_id' => 4, // Misalnya 4 untuk admin_sekolah
            'sekolah_id' => $sekolah->id,
            'ref_id' => $sekolah->id, // Referensi ke ID sekolah itu sendiri
        ]);
    }

    /**
     * Handle the Sekolah "updated" event.
     *
     * @param  \App\Models\Sekolah  $sekolah
     * @return void
     */
    public function updated(Sekolah $sekolah)
    {
        $user = $sekolah->user;

        if ($user) {
            $updateData = [];

            // Cek jika nama sekolah berubah, update username
            if ($sekolah->isDirty('nama_sekolah')) {
                $updateData['username'] = $this->generateUsername($sekolah->nama_sekolah);
            }

            // Cek jika kepala sekolah berubah, update nama dan password
            if ($sekolah->isDirty('nama_kepala_sekolah')) { // Menggunakan 'nama_kepala_sekolah'
                $updateData['name'] = $sekolah->nama_kepala_sekolah;
                $updateData['password'] = bcrypt($sekolah->nama_kepala_sekolah);
            }

            if (!empty($updateData)) {
                $user->update($updateData);
            }
        }
    }

    /**
     * Generate username from school name.
     */
    private function generateUsername($namaSekolah)
    {
        return Str::slug($namaSekolah, '_');
    }

    /**
     * Generate a unique email for the school admin.
     */
    private function generateEmail($namaSekolah)
    {
        $slug = Str::slug(strtolower($namaSekolah));
        return $slug . '@jurnalpkl.id';
    }
}
