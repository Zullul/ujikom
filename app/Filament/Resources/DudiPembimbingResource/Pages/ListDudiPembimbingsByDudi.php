<?php

namespace App\Filament\Resources\DudiPembimbingResource\Pages;

use App\Filament\Resources\DudiPembimbingResource;
use App\Models\Dudi;
use App\Models\DudiPembimbing;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Filament\Actions;
use Illuminate\Support\Facades\Auth;

class ListDudiPembimbingsByDudi extends ListRecords
{
    protected static string $resource = DudiPembimbingResource::class;

    public ?int $dudiId = null;
    public ?Dudi $dudi = null;

    public function mount(): void
    {
        // Coba ambil dari route parameter dulu, baru query string
        $this->dudiId = request()->route('dudi_id') ?? request()->query('dudi_id');
        
        if ($this->dudiId) {
            $this->dudi = Dudi::find($this->dudiId);
        }

        parent::mount();
    }

    protected function getHeaderActions(): array
    {
        return [
            Actions\Action::make('back')
                ->label('Kembali ke Daftar DUDI')
                ->icon('heroicon-o-arrow-left')
                ->url(DudiPembimbingResource::getUrl('index'))
                ->color('gray'),
            Actions\Action::make('create')
                ->label('Tambah Pembimbing')
                ->icon('heroicon-o-plus')
                ->url(DudiPembimbingResource::getUrl('create', ['dudi_id' => $this->dudiId]))
                ->color('primary'),
        ];
    }

    protected function getTableQuery(): Builder
    {
        $query = DudiPembimbing::query()->withoutGlobalScopes();

        // Filter berdasarkan dudi_id yang dipilih
        if ($this->dudiId) {
            $query->where('dudi_id', $this->dudiId);
        } else {
            $query->whereRaw('1 = 0');
        }

        // Filter berdasarkan tahun ajaran yang aktif
        $selectedTahunAjaranId = session('selected_tahun_ajaran_id');
        if ($selectedTahunAjaranId) {
            $query->where('tahun_ajaran_id', $selectedTahunAjaranId);
        }

        return $query;
    }

    public function getTitle(): string
    {
        if ($this->dudi) {
            return "Data Pembimbing - {$this->dudi->nama_dudi}";
        }
        return 'Data Pembimbing DUDI';
    }

    public function getHeading(): string
    {
        if ($this->dudi) {
            return "Data Pembimbing - {$this->dudi->nama_dudi}";
        }
        return 'Data Pembimbing DUDI';
    }

    protected function getHeaderWidgets(): array
    {
        if ($this->dudi) {
            return [
                DudiPembimbingResource\Widgets\DudiInfoWidget::class,
            ];
        }
        return [];
    }

    public function table(\Filament\Tables\Table $table): \Filament\Tables\Table
    {
        return $table
            ->query($this->getTableQuery())
            ->columns([
                \Filament\Tables\Columns\TextColumn::make('nama_pembimbing')
                    ->label('Nama Pembimbing')
                    ->searchable()
                    ->sortable(),
                \Filament\Tables\Columns\TextColumn::make('created_at')
                    ->label('Ditambahkan')
                    ->dateTime('d M Y')
                    ->sortable(),
            ])
            ->actions([
                \Filament\Tables\Actions\EditAction::make(),
                \Filament\Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                \Filament\Tables\Actions\BulkActionGroup::make([
                    \Filament\Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
