<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JadwalPelajaran extends Model
{
    protected $fillable = [
        'pelajaran_id', 'kelas_id', 'semester_id', 'schedule', 'date'
    ];

    protected $casts = [
        'date' => 'date:d-m-Y'
    ];

    public function pelajaran()
    {
        return $this->belongsTo('App\Models\Pelajaran', 'pelajaran_id');
    }

    public function kelas()
    {
        return $this->belongsTo('App\Models\Kelas', 'kelas_id');
    }

    public function semester()
    {
        return $this->belongsTo('App\Models\Semester', 'semester_id');
    }

    public function absensi()
    {
        return $this->hasMany('App\Models\Absensi');
    }
}
