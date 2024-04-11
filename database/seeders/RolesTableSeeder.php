<?php

namespace Database\Seeders;


use Couchbase\Role;
use Illuminate\Database\Seeder;
use Ultraware\Roles\Models\Role as UserRole;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        UserRole::create([
            'name' => 'admin',
            'slug' => 'Admin',
            'description' => '',
            'level' => 10,
        ]);
        UserRole::create([
            'name' => 'senior.helper',
            'slug' => 'Senior Helper',
            'description' => '',
            'level' => 4,
        ]);
        UserRole::create([
            'name' => 'helper',
            'slug' => 'Helper',
            'description' => '',
            'level' => 3,
        ]);
        UserRole::create([
            'name' => 'translator',
            'slug' => 'Translator',
            'description' => '',
            'level' => 2,
        ]);
        UserRole::create([
            'name' => 'user',
            'slug' => 'User',
            'description' => '',
            'level' => 1,
        ]);
    }
}
