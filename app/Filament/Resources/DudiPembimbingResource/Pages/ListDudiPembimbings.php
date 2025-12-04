<?php

namespace App\Filament\Resources\DudiPembimbingResource\Pages;

use App\Filament\Resources\DudiPembimbingResource;
use App\Models\Dudi;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Contracts\Support\Htmlable;

class ListDudiPembimbings extends ListRecords
{
    protected static string $resource = DudiPembimbingResource::class;

    public ?int $dudiId = null;
    public ?Dudi $dudi = null;

    public function mount(): void
    {
        parent::mount();
        
        // Ambil dudi_id dari query parameter
        $this->dudiId = request()->query('dudi_id');
        
        if ($this->dudiId) {
            $this->dudi = Dudi::find($this->dudiId);
        }
    }

    public function getTitle(): string|Htmlable
    {
        if ($this->dudi) {
            return 'Pembimbing DUDI: ' . $this->dudi->nama_dudi;
        }
        
        return 'Data Pembimbing DUDI';
    }

    public function getSubheading(): ?string
    {
        if ($this->dudi) {
            return "Bidang Usaha: {$this->dudi->bidang_usaha} | Alamat: {$this->dudi->alamat}";
        }
        
        return null;
    }

    protected function getHeaderActions(): array
    {
        $actions = [];
        
        // Tombol kembali ke pilih DUDI
        if ($this->dudiId) {
            $actions[] = Actions\Action::make('back')
                ->label('Kembali ke Pilih DUDI')
                ->icon('heroicon-o-arrow-left')
                ->url(DudiPembimbingResource::getUrl('pilih'))
                ->color('gray');
            
            // Create action dengan dudi_id di URL
            $actions[] = Actions\CreateAction::make()
                ->url(DudiPembimbingResource::getUrl('create', ['dudi_id' => $this->dudiId]));
        } else {
            $actions[] = Actions\CreateAction::make();
        }
        
        return $actions;
    }

    protected function getTableQuery(): ?Builder
    {
        $query = parent::getTableQuery();
        
        // Filter berdasarkan dudi_id jika ada
        if ($this->dudiId) {
            $query->where('dudi_id', $this->dudiId);
        }
        
        return $query;
    }
}
