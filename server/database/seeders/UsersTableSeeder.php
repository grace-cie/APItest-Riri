<?php

namespace Database\Seeders;


use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $users = array([
            'name' => 'Md.Meherul Islam', 
            'email' => 'meherul@gmail.com',
            'course_id' => 1,
            'password' => Hash::make('12345678'),
            'status' => 'active'
        ],
        [
            'name' => 'Mr.Harvsdaks', 
            'email' => 'harbsl@gmail.com',
            'course_id' => 1,
            'password' => Hash::make('12345678'),
            'status' => 'incative'
        ],
        [
            'name' => 'Mr.Riri', 
            'email' => 'rirei@gmail.com',
            'course_id' => 1,
            'password' => Hash::make('12345678'),
            'status' => 'active'
        ]);
        foreach($users as $key => $user){
            $users = User::create($user);
        }
    }
}
