<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\TicketDepartment;

class TicketDepartmentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $departments = [
            ['name' => 'Help'],
            ['name' => 'Report'],
            ['name' => 'Payment issue'],
            ['name' => 'Suggestion'],
            ['name' => 'Staff']
        ];

        foreach ($departments as $department) {
            TicketDepartment::create($department);
        }
    }
}
