<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class Users extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'role_id' => 1,
            'username' => 'Test Super Admin',
            'email' => 'testsuperadmin@gmail.com',
            'password' => app('hash')->make('testadmin'),
            'aktif' => true,
        ]);

        User::create([
            'role_id' => 2,
            'username' => 'Test User 01',
            'email' => 'testuser1@gmail.com',
            'password' => app('hash')->make('testuser'),
            'aktif' => true,
        ]);

        User::create([
            'role_id' => 2,
            'username' => 'Test User 02',
            'email' => 'testuser2@gmail.com',
            'password' => app('hash')->make('testuser'),
            'aktif' => true,
        ]);

        User::create([
            'role_id' => 2,
            'username' => 'Test User 03',
            'email' => 'testuser3@gmail.com',
            'password' => app('hash')->make('testuser'),
            'aktif' => true,
        ]);

        User::create([
            'role_id' => 2,
            'username' => 'Test User 04',
            'email' => 'testuser4@gmail.com',
            'password' => app('hash')->make('testuser'),
            'aktif' => true,
        ]);

        User::create([
            'role_id' => 2,
            'username' => 'Test User 05',
            'email' => 'testuser5@gmail.com',
            'password' => app('hash')->make('testuser'),
            'aktif' => true,
        ]);
    }
}
