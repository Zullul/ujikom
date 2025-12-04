<?php

namespace App\Models\Scopes;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Scope;
use Illuminate\Support\Facades\Auth;

class TahunAjaranScope implements Scope
{
    /**
     * Apply the scope to a given Eloquent query builder.
     */
    public function apply(Builder $builder, Model $model): void
    {
        // Cek apakah ada user yang login dan tahun ajaran sudah dipilih di sesi
        if (Auth::check() && session()->has('selected_tahun_ajaran_id')) {

            /** @var \App\Models\User $user */
            $user = Auth::user();

            // Terapkan scope ini hanya untuk admin sekolah, guru, dan dudi
            // Super Admin tidak akan terpengaruh dan bisa melihat semua data
            if ($user->isAdminSekolah() || $user->isGuru() || $user->isDudiPembimbing()) {
                $builder->where($model->getTable() . '.tahun_ajaran_id', session('selected_tahun_ajaran_id'));
            }
        }
    }
}
