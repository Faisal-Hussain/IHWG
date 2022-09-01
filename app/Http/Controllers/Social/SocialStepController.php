<?php

namespace App\Http\Controllers\Social;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Jobs\SendHomeopathInvitationMail;
use Auth;
use App\Models\SocialPostTag;
use App\Models\SocialPost;
use App\Models\UserSocialGroup;
use App\Models\UserSocialProfile;
use App\Models\AlbumPhoto;

class SocialStepController extends Controller
{
    public function completeStep(Request $req)
    {

        #GET AUTHENTICATED USER
        $user = Auth::user();


        #CHECK USERNAME EXISTENCE/UPDATE
        if($req->user_name)
        {
            $check_user_name = User::whereUserName($req->user_name)->count();

            if($check_user_name == 0)
            {
                $user->user_name = $req->user_name;
            }

        }

        #CHECK AVATAR EXISTENCE
        if($req->avatar)
        {
            $user->avatar = uploadImage($req->avatar, 'uploads/users');
        }


        #CHECK TAG EXISTENCE & ATTACH WITH USER
        if(isset($req->tags))
        {
            foreach($req->tags as $item)
            {
                $tag = SocialPostTag::find($item);
                $tag->userTags()->syncWithoutDetaching($user);
            }
        }

        #CHECK GROUPS EXISTENCE & ATTACH WITH USER
        if(isset($req->groups))
        {
            foreach($req->groups as $item)
            {
                $group =  UserSocialGroup::find($item);
                $group->userFollowers()->syncWithoutDetaching($user);
            }
        }


        #CHECK COMPANIES EXISTENCE & ATTACH WITH USER
        if(isset($req->companies))
        {
            foreach($req->companies as $item)
            {
                $company =  User::find($item);
                $company->userFollowings()->syncWithoutDetaching($user);
            }
        }


        #CHECK FRIENDS EXISTENCE & ATTACH WITH USER
        if(isset($req->friends))
        {
            foreach($req->friends as $item)
            {
                $company =  User::find($item);
                $company->userFollowings()->syncWithoutDetaching($user);
            }
        }


        #CHECK HOMEOPATH EXISTENCE AND ATTACH TO USER
        if($req->connect_homeopath_id)
        {
            $check_homeopath = User::whereUserName($req->connect_homeopath_id)->first();

            if($check_homeopath)
            {
                $check_homeopath->userFollowings()->syncWithoutDetaching($user);
            }

        }

        #SAVE USER & ADD PROFILE AT THE END
        $user->is_socially_completed = true;
        UserSocialProfile::create(['user_id' => $user->id]);
        $user->save();


        #SUCCESSFULLY RETURN TO SOCIAL NETWORK
        return redirect()->route('social.index')->withMessage('Welcome to Social Network of '.env('APP_NAME'));

    }


    public function loadHomeopath(Request $req)
    {

        $homeopath = User::whereRole('homeopath')->where('name', 'LIKE', '%'.$req->q.'%')->get();

        return view('vendor.social-network.ajax.load_homeopath', get_defined_vars());

    }


    public function sendInvitation(Request $req)
    {



        $req->validate([
            'email' => 'required|string|email|max:255'
        ]);
        $set = Setting::where('key','send_invitation_email')->first()->value;
        $setting=json_decode($set);

        $data = [
            'name'     => Auth::user()->name,
            'email'    => $req->email,
            'app_name' => env('APP_NAME'),
            'subject'  => Auth::user()->name.' has sent you invitation to register at '. env('APP_NAME'),
        ];




        dispatch(new SendHomeopathInvitationMail($data))->delay(now()->addSeconds(2));

        return response()->json('Your invitation has been sent.');

    }


    public function loadAlbum($id)
    {
        $photos = AlbumPhoto::whereAlbumId($id)->get();

        return view('vendor.social-network.ajax.album', get_defined_vars());

    }


}
