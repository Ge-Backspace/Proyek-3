<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Semester extends Model
{
    use SoftDeletes;

    protected $fillable = [
        'name', 'start_date', 'end_date'
    ];

    public function jadwal_pelajaran(){
        return $this->hasMany('App\Models\JadwalPelajaran');
    }
}
