<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Kelas extends Model
{
    protected $fillable = [
        'name',
    ];

    public function pelajaran(){
        return $this->hasMany('App\Models\Pelajaran');
    }
}
