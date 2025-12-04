<?php

namespace App\Filament\Resources\DudiPembimbingResource\Pages;

use App\Filament\Resources\DudiPembimbingResource;
use Filament\Resources\Pages\CreateRecord;
use Illuminate\Support\Facades\Auth;

class CreateDudiPembimbing extends CreateRecord
{
    protected static string $resource = DudiPembimbingResource::class;

    public function mount(): void
    {
        parent::mount();
        
        // Jika ada dudi_id dari query parameter, set sebagai default
        if (request()->has('dudi_id')) {
            $this->form->fill([
                'dudi_id' => request()->get('dudi_id'),
            ]);
        }
    }

    // Method untuk memanipulasi data sebelum disimpan
    protected function mutateFormDataBeforeCreate(array $data): array
    {
        $user = Auth::user();

        // Jika yang membuat adalah user DUDI, otomatis set dudi_id
        if ($user->isDudi()) {
            $data['dudi_id'] = $user->ref_id; // ref_id user DUDI adalah id dari tabel dudi
        }
        
        if (session()->has('selected_tahun_ajaran_id')) {
            $data['tahun_ajaran_id'] = session('selected_tahun_ajaran_id');
        }

        return $data;
    }
    
    protected function getRedirectUrl(): string
    {
        // Redirect kembali ke list dengan dudi_id yang sama
        if ($dudiId = $this->form->getState()['dudi_id'] ?? null) {
            return DudiPembimbingResource::getUrl('index', ['dudi_id' => $dudiId]);
        }
        
        return $this->getResource()::getUrl('index');
    }
}
