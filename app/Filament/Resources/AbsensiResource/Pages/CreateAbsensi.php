<?php

namespace App\Filament\Resources\AbsensiResource\Pages;

use App\Filament\Resources\AbsensiResource;
use App\Models\PrakerinSiswa;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateAbsensi extends CreateRecord
{
    protected static string $resource = AbsensiResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $siswaId = Auth::user()->ref_id;

        // --- LOGIC REVISED HERE ---
        // Find the student's current placement with a 'berjalan' status.
        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $siswaId)
            ->where('status', 'berjalan')
            ->first();

        // If no placement is found, halt the process and notify the user.
        if (!$prakerinSiswa) {
            Notification::make()
                ->title('Gagal Membuat Absensi')
                ->body('Anda belum terdaftar pada program prakerin yang sedang berjalan. Hubungi admin sekolah.')
                ->danger()
                ->send();

            $this->halt();
        }

        // Add the required IDs to the form data.
        $data['siswa_id'] = $siswaId;
        $data['prakerin_siswa_id'] = $prakerinSiswa->id;

        return $data;
    }
}
