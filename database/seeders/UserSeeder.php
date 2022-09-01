<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        if (User::where('role','admin')->count() == 0) {
        $user = User::create([
                'name' => 'admin',
                'email' => 'info@deviotech.com',
                'email_verified_at' => '2021-02-07 17:00:00',
                'password' => bcrypt('deviotech753'),
                'role' => 'admin',
            ]);

        }

        $user = User::create([
                'name' => 'Test Advocate',
                'email' => 'testadvocate1@gmail.com',
                'email_verified_at' => '2021-02-07 17:00:00',
                'password' => bcrypt('testadvocate1'),
                'role' => 'advocate',
            ]);

        $user = User::create([
                'name' => 'Test Homeopath',
                'email' => 'testhomeopath1@gmail.com',
                'email_verified_at' => '2021-02-07 17:00:00',
                'password' => bcrypt('testhomeopath1'),
                'role' => 'homeopath',
            ]);

        $user = User::create([
                'name' => 'Test User',
                'email' => 'testuser1@gmail.com',
                'email_verified_at' => '2021-02-07 17:00:00',
                'password' => bcrypt('testuser1'),
                'role' => 'user',
            ]);




    }
}
