<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersCourseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $courses = array(
            [
                'name' => 'Bachelor of Science in Computer Science', 
                'status' => 'active',
            ],
            [
                'name' => 'Bachelor of Science in Hospitality Management', 
                'status' => 'active',
            ],
            [
                'name' => 'Bachelor of Science in Information Technology', 
                'status' => 'active',
            ],
            [
                'name' => 'Bachelor of Science in Business Administration', 
                'status' => 'active',
            ],
            [
                'name' => 'Bachelor of Science in Accountancy', 
                'status' => 'active',
            ],
        );
        foreach($courses as $key => $course){
            $courses = DB::table('users_course')->insert($course);
        }
    }
}
