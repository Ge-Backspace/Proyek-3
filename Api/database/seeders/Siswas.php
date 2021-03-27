<?php

namespace Database\Seeders;

use App\Models\Siswa;
use Illuminate\Database\Seeder;

class Siswas extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Siswa::create([
            'name' => 'Test 1',
            'nis' => '11100101',
            'user_id' => 2,
            'kelas_id' => 1,
        ]);

        Siswa::create([
            'name' => 'Test 2',
            'nis' => '11100102',
            'user_id' => 3,
            'kelas_id' => 1,
        ]);

        Siswa::create([
            'name' => 'Test 3',
            'nis' => '11100103',
            'user_id' => 4,
            'kelas_id' => 2,
        ]);

        Siswa::create([
            'name' => 'Test 4',
            'nis' => '11100104',
            'user_id' => 5,
            'kelas_id' => 2,
        ]);
    }
}
