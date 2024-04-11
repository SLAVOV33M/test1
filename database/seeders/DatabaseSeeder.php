<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;


class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call(LanguagesTableSeeder::class);
        $this->call(RolesTableSeeder::class);
        $this->call(UserSeeder::class);
        $this->call(RoleUserSeeder::class);
        $this->call(ServersTableSeeder::class);
        $this->call(MinranksTableSeeder::class);
        $this->call(CommandsTableSeeder::class);
        $this->call(BotStatusesTableSeeder::class);
        $this->call(BotlangSentencesTableSeeder::class);
        $this->call(TicketDepartmentsTableSeeder::class);
    }
}
