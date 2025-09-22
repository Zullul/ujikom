<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Siswa;
use App\Models\Guru;
use App\Models\Dudi;
use App\Models\User;
use Illuminate\Support\Str;

class GenerateUsersCommand extends Command
{
    protected $signature = 'users:generate {type?}';
    protected $description = 'Generate users untuk siswa, guru, atau dudi yang belum punya user';

    public function handle()
    {
        $type = $this->argument('type');

        if (!$type) {
            $type = $this->choice('Pilih tipe user yang ingin di-generate:', [
                'siswa',
                'guru',
                'dudi',
                'all'
            ]);
        }

        switch ($type) {
            case 'siswa':
                $this->generateSiswaUsers();
                break;
            case 'guru':
                $this->generateGuruUsers();
                break;
            case 'dudi':
                $this->generateDudiUsers();
                break;
            case 'all':
                $this->generateSiswaUsers();
                $this->generateGuruUsers();
                $this->generateDudiUsers();
                break;
        }
    }

    private function generateSiswaUsers()
    {
        $this->info('Generating users untuk siswa...');

        $siswas = Siswa::whereDoesntHave('user')->get();
        $count = 0;

        foreach ($siswas as $siswa) {
            User::create([
                'name' => $siswa->nama_siswa,
                'username' => $siswa->nis,
                'email' => $this->generateSiswaEmail($siswa->nama_siswa, $siswa->nis),
                'password' => bcrypt($siswa->nis),
                'role_id' => 1,
                'role_type' => 'siswa',
                'ref_id' => $siswa->id,
                'sekolah_id' => $siswa->sekolah_id,
            ]);
            $count++;
        }

        $this->info("Berhasil generate {$count} user siswa.");
    }

    private function generateGuruUsers()
    {
        $this->info('Generating users untuk guru...');

        $gurus = Guru::whereDoesntHave('user')->get();
        $count = 0;

        foreach ($gurus as $guru) {
            User::create([
                'name' => $guru->nama_guru,
                'username' => $guru->nip,
                'email' => $this->generateGuruEmail($guru->nama_guru, $guru->nip),
                'password' => bcrypt($guru->nip),
                'role_id' => 2,
                'role_type' => 'guru',
                'ref_id' => $guru->id,
                'sekolah_id' => $guru->sekolah_id,
            ]);
            $count++;
        }

        $this->info("Berhasil generate {$count} user guru.");
    }

    private function generateDudiUsers()
    {
        $this->info('Generating users untuk dudi...');

        $dudis = Dudi::whereDoesntHave('user')->get();
        $count = 0;

        foreach ($dudis as $dudi) {
            User::create([
                'name' => $dudi->pimpinan,
                'username' => 'dudi_' . $dudi->id,
                'email' => $this->generateDudiEmail($dudi->nama_dudi),
                'password' => bcrypt('dudi123'),
                'role_id' => 3,
                'role_type' => 'dudi',
                'ref_id' => $dudi->id,
                'sekolah_id' => $dudi->sekolah_id,
            ]);
            $count++;
        }

        $this->info("Berhasil generate {$count} user dudi.");
    }

    private function generateSiswaEmail($nama, $nis)
    {
        $namaSlug = Str::slug(strtolower($nama));
        return $namaSlug . '.' . $nis . '@siswa.com';
    }

    private function generateGuruEmail($nama, $nip)
    {
        $namaSlug = Str::slug(strtolower($nama));
        return $namaSlug . '.' . $nip . '@guru.com';
    }

    private function generateDudiEmail($namaDudi)
    {
        $namaSlug = Str::slug(strtolower($namaDudi));
        return $namaSlug . '@dudi.com';
    }
}
