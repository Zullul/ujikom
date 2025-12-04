<?php

namespace App\Filament\Resources\PrakerinSiswaResource\Pages;

use App\Filament\Resources\PrakerinSiswaResource;
use App\Models\Prakerin;
use App\Models\DudiPembimbing;
use App\Models\Guru;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Pages\EditRecord;

class EditPrakerinSiswa extends EditRecord
{
    protected static string $resource = PrakerinSiswaResource::class;

    // Tambahkan method mount() ini
    public function mount(int | string $record): void
    {
        parent::mount($record);

        // Ambil data dari relasi dan masukan ke dalam form data
        $this->form->fill([
            'nama_siswa_display' => $this->record->siswa->nama_siswa,
            'nis_display' => $this->record->siswa->nis,
            'dudi_id' => $this->record->dudi_id, // Pastikan dudi_id terisi
            'prakerin_id' => $this->record->prakerin_id,
            'no_sk' => $this->record->no_sk,
            'guru_pembimbing_id' => $this->record->guru_pembimbing_id,
            'dudi_pembimbing_id' => $this->record->dudi_pemb
        ]);
    }

    public function form(Form $form): Form
    {
        $tahunAjaranId = session('selected_tahun_ajaran_id');

        return $form
            ->schema([
                Forms\Components\Section::make('Informasi Siswa')
                    ->schema([
                        Forms\Components\TextInput::make('nama_siswa_display')->label('Nama Siswa')->disabled(),
                        Forms\Components\TextInput::make('nis_display')->label('NIS')->disabled(),
                    ])->columns(2),

                Forms\Components\Section::make('Detail Penempatan')
                    ->schema([
                        Forms\Components\Select::make('prakerin_id')->label('Program Prakerin')->options(Prakerin::where('tahun_ajaran_id', $tahunAjaranId)->pluck('ketua', 'id'))->searchable()->required(),
                        Forms\Components\TextInput::make('no_sk')->label('Nomor SK')->maxLength(255)->required(),
                        Forms\Components\Select::make('dudi_id')->label('DUDI (Tempat Prakerin)')->relationship('dudi', 'nama_dudi')->disabled(),
                        Forms\Components\Select::make('guru_pembimbing_id')->label('Guru Pembimbing')->options(Guru::where('tahun_ajaran_id', $tahunAjaranId)->pluck('nama_guru', 'id'))->searchable()->required(),
                        Forms\Components\Select::make('dudi_pembimbing_id')->label('Pembimbing DUDI')->relationship('dudiPembimbing', 'nama_pembimbing')->searchable()->required(),
                    ])->columns(2),
            ]);
    }
}
