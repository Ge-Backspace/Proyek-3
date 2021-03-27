<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pelajaran extends Model
{
    protected $fillable = [
        'name', 'kelas_id', 'semester_id', 'schedule', 'time'
    ];

    public function semester()
    {
        return $this->belongsTo('App\Models\Semester', 'semester_id');
    }

    public function kelas()
    {
        return $this->belongsTo('App\Models\Kelas', 'kelas_id');
    }
}
