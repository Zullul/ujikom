<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class KelasSiswa extends Model
{
    use HasFactory;

   protected $fillable = ['nama_kelas', 'konsentrasi_keahlian', 'sekolah_id'];

   public function sekolah()
   {
       return $this->belongsTo(sekolah::class);
   }
}
