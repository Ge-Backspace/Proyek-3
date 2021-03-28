<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Absensi extends Model
{
    protected $fillable = [
        'siswa_id', 'lat', 'lng', 'time', 'status'
    ];

    public function siswa()
    {
        return $this->belongsTo('App\Models\Siswa', 'siswa_id');
    }

    public function jadwal_pelajaran()
    {
        return $this->belongsTo('App\Models\JadwalPelajaran', 'jadwal_pelajaran_id');
    }
}
