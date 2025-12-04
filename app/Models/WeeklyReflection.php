<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WeeklyReflection extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'student_id',
        'pembimbing_id',
        'week_number',
        'start_date',
        'end_date',
        'reflection_text',
        'verified_by_guru_at',   // <-- TAMBAHKAN BARIS INI
        'verified_by_dudi_at',   // <-- TAMBAHKAN BARIS INI
    ];

    // Relasi ke model User (Siswa)
    public function student()
    {
        return $this->belongsTo(User::class, 'student_id');
    }

    // Relasi ke model User (Pembimbing)
    public function pembimbing()
    {
        return $this->belongsTo(User::class, 'pembimbing_id');
    }
}
