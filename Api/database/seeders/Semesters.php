<?php

namespace Database\Seeders;

use App\Models\Semester;
use Carbon\Carbon;
use Illuminate\Database\Seeder;

class Semesters extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Semester::create([
            'name' => 'Ganjil 1',
            'start_date' => Carbon::parse('2021-06-07'),
            'end_date' => Carbon::parse('2021-10-10'),
        ]);

        Semester::create([
            'name' => 'Genap 1',
            'start_date' => Carbon::parse('2021-11-02'),
            'end_date' => Carbon::parse('2022-03-11'),
        ]);

        Semester::create([
            'name' => 'Ganjil 2',
            'start_date' => Carbon::parse('2022-06-10'),
            'end_date' => Carbon::parse('2022-10-16'),
        ]);

        Semester::create([
            'name' => 'Genap 2',
            'start_date' => Carbon::parse('2022-11-7'),
            'end_date' => Carbon::parse('2023-03-16'),
        ]);

        // Semester::create([
        //     'name' => 'Ganjil 3'
        // ]);

        // Semester::create([
        //     'name' => 'Genap 3'
        // ]);

        // Semester::create([
        //     'name' => 'Ganjil 4'
        // ]);

        // Semester::create([
        //     'name' => 'Genap 4'
        // ]);

        // Semester::create([
        //     'name' => 'Ganjil 5'
        // ]);

        // Semester::create([
        //     'name' => 'Genap 5'
        // ]);

        // Semester::create([
        //     'name' => 'Ganjil 6'
        // ]);

        // Semester::create([
        //     'name' => 'Genap 6'
        // ]);
    }
}
