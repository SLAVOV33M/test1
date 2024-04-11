<?php

namespace Database\Seeders;

use App\Models\Language;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //These are demo data.
        DB::beginTransaction();
        DB::table('users')->delete();
        try {
            $users = [
                [
                    'id' => 1,
                    'citext' => 'sdf',
                    'email' => 'admin@gmail.com',
                    'name' => 'admin',
                    'regname' => 'test',
                    'xatid' => 9797,
                    'password' => '$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',
                    'language_id' => Language::all()->random()->id,
                    'ip' => '127.0.0.1',
                    'remember_token' => null,
                    'created_at' => '2024-04-11 18:24:14',
                    'updated_at' => null,
                    'avatar' => 'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',
                ],
                [
                    'id' => 5,
                    'citext' => 'user1223',
                    'email' => 'user@gmail.com',
                    'name' => 'user',
                    'regname' => 'user',
                    'xatid' => 12345,
                    'password' => '$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',
                    'language_id' => Language::all()->random()->id,
                    'ip' => '127.0.0.1',
                    'remember_token' => null,
                    'created_at' => '2024-04-11 18:24:14',
                    'updated_at' => null,
                    'avatar' => 'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',
                ],
                [
                    'id' => 7,
                    'citext' => 'helper123',
                    'email' => 'helper@gmail.com',
                    'name' => 'helper',
                    'regname' => 'helper',
                    'xatid' => 4354,
                    'password' => '$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',
                    'language_id' => Language::all()->random()->id,
                    'ip' => '127.0.0.1',
                    'remember_token' => null,
                    'created_at' => '2024-04-11 18:24:14',
                    'updated_at' => null,
                    'avatar' => 'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',
                ],
                [
                    'id' => 8,
                    'citext' => 'senior.helper',
                    'email' => 'senior.helper@gmail.com',
                    'name' => 'senior.helper',
                    'regname' => 'senior.helper',
                    'xatid' => 546546,
                    'password' => '$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',
                    'language_id' => Language::all()->random()->id,
                    'ip' => '127.0.0.1',
                    'remember_token' => null,
                    'created_at' => '2024-04-11 18:24:14',
                    'updated_at' => null,
                    'avatar' => 'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',
                ],
                [
                    'id' => 10,
                    'citext' => 'translator',
                    'email' => 'translator@gmail.com',
                    'name' => 'translator',
                    'regname' => 'translator',
                    'xatid' => 34546,
                    'password' => '$2y$12$dkmDVtX1cl0WhD0wGebOJe4Y3EYyNupdPNCJ3oxn9ksmJXbm3.y/m',
                    'language_id' => Language::all()->random()->id,
                    'ip' => '127.0.0.1',
                    'remember_token' => null,
                    'created_at' => '2024-04-11 18:24:14',
                    'updated_at' => null,
                    'avatar' => 'sUo8QQ4LmibmvkUQyKGTfKsjvFQzkm9nkxSV3lUWEWvFWbsfSFLtAYEZpv4i',
                ],
            ];
            // Insert data into the database
            foreach ($users as $user) {
                DB::table('users')->insert($user);
            }

            DB::commit();
            echo "UserSeeder completed successfully.\n"; // Print console message
        } catch (\Exception $exception) {
            DB::rollback();
            echo "UserSeeder failed {$exception->getMessage()}, {$exception->getLine()}"; // Print console message
        }
    }
}
