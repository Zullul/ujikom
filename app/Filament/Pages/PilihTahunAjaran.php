<?php

namespace App\Filament\Pages;

use Filament\Forms\Components\Select;
use Filament\Forms\Concerns\InteractsWithForms;
use Filament\Forms\Contracts\HasForms;
use Filament\Forms\Form;
use Filament\Actions\Action;
use Filament\Pages\Page;
use Illuminate\Support\Facades\Auth;
use App\Models\Scopes\TahunAjaranScope;
use App\Models\tahun_ajaran;

class PilihTahunAjaran extends Page implements HasForms
{
    use InteractsWithForms;

    protected static ?string $navigationIcon = 'heroicon-o-document-text';
    protected static string $view = 'filament.pages.pilih-tahun-ajaran';
    protected static bool $shouldRegisterNavigation = false;

    public ?array $data = [];
    public $tahunAjarans = [];

    public function mount(): void
    {
        $user = Auth::user();
        
        // Cek tahun ajaran yang tersedia untuk user
        if ($user->isGuru()) {
            $tahunAjaranIds = \App\Models\Guru::withoutGlobalScope(TahunAjaranScope::class)
                ->where('nama_guru', $user->name)
                ->pluck('tahun_ajaran_id')
                ->unique();

            $this->tahunAjarans = \App\Models\tahun_ajaran::whereIn('id', $tahunAjaranIds)
                ->pluck('tahun_ajaran', 'id');
                
        } elseif ($user->isDudiPembimbing()) {
            $tahunAjaranIds = \App\Models\DudiPembimbing::withoutGlobalScope(TahunAjaranScope::class)
                ->where('id', $user->ref_id)
                ->pluck('tahun_ajaran_id')
                ->unique();

            $this->tahunAjarans = \App\Models\tahun_ajaran::whereIn('id', $tahunAjaranIds)
                ->pluck('tahun_ajaran', 'id');
                
        } elseif ($user->isAdminSekolah()) {
            $this->tahunAjarans = tahun_ajaran::pluck('tahun_ajaran', 'id');
        }
        
        // Auto-select jika hanya ada 1 tahun ajaran (untuk Guru/Dudi saja)
        if (($user->isGuru() || $user->isDudiPembimbing()) && $this->tahunAjarans->count() === 1) {
            session(['selected_tahun_ajaran_id' => $this->tahunAjarans->keys()->first()]);
            $this->redirect(route('filament.admin.pages.dashboard'));
            return;
        }
        
        $this->form->fill();
    }

    public function form(Form $form): Form
    {
        return $form
            ->statePath('data')
            ->schema([
                Select::make('tahun_ajaran_id')
                    ->label('Pilih Tahun Ajaran')
                    ->options($this->tahunAjarans)
                    ->required()
                    ->native(false)
                    ->searchable(),
            ]);
    }

    protected function getFormActions(): array
    {
        return [
            Action::make('save')
                ->label('Lanjutkan')
                ->submit('save'),
        ];
    }

    public function save(): void
    {
        $data = $this->form->getState();

        session(['selected_tahun_ajaran_id' => $data['tahun_ajaran_id']]);

        $this->redirect(route('filament.admin.pages.dashboard'));
    }
}
