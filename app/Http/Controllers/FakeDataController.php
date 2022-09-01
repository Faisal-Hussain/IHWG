<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use App\Models\HomeopathCategory;
use App\Models\HomeopathLibrary;
use App\Models\ShopProduct;
use App\Models\ServiceBooking;
use App\Models\UserSocialGroup;
use App\Models\User;
use App\Models\SocialPostTag;
use App\Models\Following;
use App\Models\SocialPost;
use App\Models\Badge;
use Str;

class FakeDataController extends Controller
{
    

    public function index()
    {

            // $data = [
            //     'Default Badge',
            //     'Certified Neutritionist',
            //     'Medical Doctor',
            //     'Registered Homeopath',
            //     'Registered Massage Therapist',
            //     'Registered Midwife',
            //     'Registered Naturopath',
            //     'Registered Psychologist',
            //     'Registered Yoga Instructor',
            //     'Reiki Master'
            // ];

            // foreach($data as $item)
            // {
            //     Badge::create([
            //         'title' => $item,
            //         'slug'  => Str::slug($item),
            //         'path'  => 'uploads/badges/'.str_replace('-', '_', Str::slug($item)).'.png',
            //     ]);
            // }



            // $permission = Permission::create(['name' => 'browse_members']);
            // $permission = Permission::create(['name' => 'browse_donations']);
            // $permission = Permission::create(['name' => 'browse_services']);
            // $permission = Permission::create(['name' => 'browse_blogs']);
            // $permission = Permission::create(['name' => 'browse_shop']);
            // $permission = Permission::create(['name' => 'browse_finance']);
            // $permission = Permission::create(['name' => 'homeopath_library']);

            // $role = Role::create(['name' => 'admin']);

            // $permission = Permission::create(['name' => 'browse_admin']);
            // $permission = Permission::create(['name' => 'browse_roles']);
            // $permission = Permission::create(['name' => 'browse_teams']);

            // $role->givePermissionTo(Permission::all());
            

            // $user = User::where('role', 'admin')->first();

            // $user->assignRole($role);


        return;
        // for($i= 1; $i <= 23; $i++)
        // {
        //             $faker = \Faker\Factory::create();
        //             SocialPost::create([
        //                 'caption' => $faker->sentence($nbWords = 14, $variableNbWords = true),
        //                 'user_id' => 5
        //             ]);

              
        // }

        for($i= 1; $i <= 75; $i++)
        {
                    
                    $faker = \Faker\Factory::create();
                    $id = rand(1, 24);
                    SocialPostTag::create(['title' => '#'.$faker->domainWord, 'social_post_id' => $id]);
              
        }

        
        return;

        // $tag = SocialPostTag::find(3);


        // $tag->userTags()->detach();
        // $tag->delete();

        // $group =  UserSocialGroup::find(1);

        // $user =  User::find(19);
        
        // $group->userFollowers()->syncWithoutDetaching($user);
        
        // $tag->userTags()->syncWithoutDetaching($user);        

        // $group->userFollowers()->detach($user);


        // $permission = Permission::create(['name' => 'browse_finance']);

    }



}
