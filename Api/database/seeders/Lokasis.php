<?php

namespace Database\Seeders;

use App\Models\Lokasi;
use Illuminate\Database\Seeder;

class Lokasis extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Lokasi::create([
            'name' => 'Kelas 10 A',
            'lat' => '-6.397855',
            'lng' => '108.2832798'
        ]);

        Lokasi::create([
            'name' => 'Kelas 10 B',
            'lat' => '-6.3978689',
            'lng' => '108.2833146'
        ]);
    }
}
