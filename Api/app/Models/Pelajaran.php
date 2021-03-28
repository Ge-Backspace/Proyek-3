<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelajaran extends Model
{
    protected $fillable = [
        'name'
    ];

    public function jadwal_perlajaran()
    {
        return $this->hasMany('App\Models\JadwalPelajaran');
    }
}
