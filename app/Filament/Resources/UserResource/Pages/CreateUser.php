<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use App\Models\User;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Hash;

class CreateUser extends CreateRecord
{
    protected static string $resource = UserResource::class;

    // Alihkan ke halaman daftar setelah selesai
    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }

    /**
     * Method ini akan "mencegat" data sebelum proses pembuatan standar berjalan.
     * Kita akan membuat user di sini, lalu menghentikan proses standarnya.
     */
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $createdCount = 0;

        // Pastikan ada data 'users' dari repeater
        if (isset($data['users']) && is_array($data['users'])) {
            // Lakukan perulangan (loop) untuk setiap data user yang diinput
            foreach ($data['users'] as $userData) {
                // Lewati jika baris repeater kosong
                if (empty($userData['name']) || empty($userData['password'])) {
                    continue;
                }

                User::create([
                    'name' => $userData['name'],
                    'username' => $userData['username'],
                    'email' => $userData['email'],
                    'sekolah_id' => $userData['sekolah_id'],
                    'password' => Hash::make($userData['password']),
                    'role_type' => 'admin_sekolah', // Atur role secara otomatis
                    'role_id' => 4, // Pastikan ID 4 adalah untuk 'admin_sekolah'
                ]);
                $createdCount++;
            }
        }

        // Tampilkan notifikasi sukses
        if ($createdCount > 0) {
            Notification::make()
                ->title('Berhasil Dibuat')
                ->body("{$createdCount} akun admin sekolah baru telah berhasil ditambahkan.")
                ->success()
                ->send();
        }

        // Perintah KUNCI: Hentikan proses pembuatan data standar dari Filament
        $this->halt();

        // Kembalikan array kosong karena proses sudah kita hentikan
        return [];
    }
}
