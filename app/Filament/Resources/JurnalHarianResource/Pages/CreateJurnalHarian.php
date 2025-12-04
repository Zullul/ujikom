<?php

namespace App\Filament\Resources\JurnalHarianResource\Pages;

use App\Filament\Resources\JurnalHarianResource;
use App\Models\PrakerinSiswa;
use Carbon\Carbon;
use Filament\Notifications\Notification;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateJurnalHarian extends CreateRecord
{
    protected static string $resource = JurnalHarianResource::class;

    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();
        $siswaId = $user->isSiswa() ? $user->ref_id : $data['siswa_id'];
        $timezone = session('user_timezone', config('app.timezone'));

        $prakerinSiswa = PrakerinSiswa::where('siswa_id', $siswaId)
            ->where('status', 'berjalan')
            ->first();

        if (!$prakerinSiswa) {
            Notification::make()
                ->title('Gagal Membuat Jurnal')
                ->body('Siswa belum terdaftar pada program prakerin yang sedang berjalan.')
                ->danger()->send();
            $this->halt();
        }

        $data['siswa_id'] = $siswaId;
        $data['prakerin_siswa_id'] = $prakerinSiswa->id;

        // Hanya set tanggal otomatis jika tidak diisi manual (oleh Dudi)
        if (empty($data['tanggal'])) {
            $data['tanggal'] = Carbon::now($timezone)->toDateString();
        }

        return $data;
    }
}
