<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        try {
            DB::beginTransaction();
            DB::table('role_user')->delete();

            $records = [
                ['role_id' => 1, 'user_id' => 1],
                ['role_id' => 5, 'user_id' => 5],
                ['role_id' => 3, 'user_id' => 7],
                ['role_id' => 2, 'user_id' => 8],
                ['role_id' => 4, 'user_id' => 10],
            ];

            foreach ($records as $record) {
                $record['created_at'] = now();
                $record['updated_at'] = now();
                DB::table('role_user')->insert($record);
            }
            DB::commit();
            echo "RoleUserSeeder completed successfully.\n"; // Print console message
        } catch (\Exception $exception) {
            DB::rollback();
            echo "RoleUserSeeder failed {$exception->getMessage()}, {$exception->getLine()}.\n"; // Print console message
        }
    }
}
