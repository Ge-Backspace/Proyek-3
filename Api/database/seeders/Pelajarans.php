<?php

namespace Database\Seeders;

use App\Models\Pelajaran;
use Illuminate\Database\Seeder;

class Pelajarans extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Pelajaran::create([
            'name' => 'Math'
        ]);

        Pelajaran::create([
            'name' => 'Sejarah'
        ]);
    }
}
