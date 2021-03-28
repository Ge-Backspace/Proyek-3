<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Kelas extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name',
    ];

    public function jadwal_pelajaran(){
        return $this->hasMany('App\Models\JadwalPelajaran');
    }
}
