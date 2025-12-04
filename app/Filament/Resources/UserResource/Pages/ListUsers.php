<?php

namespace App\Filament\Resources\UserResource\Pages;

use App\Filament\Resources\UserResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;
use Filament\Resources\Components\Tab; // <-- 1. Tambahkan ini
use Illuminate\Database\Eloquent\Builder; // <-- 2. Tambahkan ini
use Illuminate\Support\Facades\Auth;

class ListUsers extends ListRecords
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    /**
     * 3. TAMBAHKAN SELURUH FUNGSI DI BAWAH INI
     */
    public function getTabs(): array
    {
        // Jika user adalah superadmin, jangan tampilkan tabs
        if (Auth::user()->isSuperAdmin()) {
            return [];
        }

        return [
            'siswa' => Tab::make('Siswa')
                ->modifyQueryUsing(fn(Builder $query) => $query->where('role_type', 'siswa'))
                ->badge(
                    $this->getResource()::getEloquentQuery()
                        ->where('role_type', 'siswa')
                        ->count()
                ),
            'guru' => Tab::make('Guru')
                ->modifyQueryUsing(fn(Builder $query) => $query->where('role_type', 'guru'))
                ->badge(
                    $this->getResource()::getEloquentQuery()
                        ->where('role_type', 'guru')
                        ->count()
                ),
            
            'dudi_pembimbing' => Tab::make('Dudi Pembimbing')
                ->modifyQueryUsing(fn(Builder $query) => $query->where('role_type', 'dudi_pembimbing'))
                ->badge(
                    $this->getResource()::getEloquentQuery()
                        ->where('role_type', 'dudi_pembimbing')
                        ->count()
                ),
            
            'admin_sekolah' => Tab::make('Admin Sekolah (Humas)')
                ->modifyQueryUsing(fn(Builder $query) => $query->where('role_type', 'admin_sekolah'))
                ->badge(
                    $this->getResource()::getEloquentQuery()
                        ->where('role_type', 'admin_sekolah')
                        ->count()
                ),
        ];
    }
}
