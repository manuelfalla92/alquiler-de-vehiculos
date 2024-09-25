<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        User::create([
            'name' => 'Carlos Ramirez',
            'email' => 'cramirezruiz30@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        User::create([
            'name' => 'Manuel Falla',
            'email' => 'manuelfalla1234@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        User::create([
            'name' => 'Cliente 1',
            'email' => 'cliente1@gmail.com',
            'password' => Hash::make('12345678'),
        ]);

        User::create([
            'name' => 'Cliente 2',
            'email' => 'cliente2@gmail.com',
            'password' => Hash::make('12345678'),
        ]);
    }
}
