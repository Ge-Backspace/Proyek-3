<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Siswa extends Model
{
    protected $fillable = [
        'name', 'nis', 'user_id', 'kelas_id',
    ];

    public function user(){
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function kelas(){
        return $this->belongsTo('App\Models\Kelas', 'kelas_id');
    }
}
