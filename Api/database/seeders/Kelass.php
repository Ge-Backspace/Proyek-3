<?php

namespace Database\Seeders;

use App\Models\Kelas;
use Illuminate\Database\Seeder;

class Kelass extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Kelas::create([
            'name' => '10 A'
        ]);

        Kelas::create([
            'name' => '10 B'
        ]);

        Kelas::create([
            'name' => '11 IPA'
        ]);

        Kelas::create([
            'name' => '11 IPS'
        ]);

        Kelas::create([
            'name' => '12 IPA'
        ]);

        Kelas::create([
            'name' => '12 IPS'
        ]);
    }
}
