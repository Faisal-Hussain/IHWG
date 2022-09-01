<?php

namespace App\Http\Controllers\Social;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\UserSocialGroup;
use App\Models\User;
use Auth;
use Str;
use Crypt;
use Session;


class GroupController extends Controller
{
    public function groupCreate(Request $req)
    {


        $req->validate([
            'title' => 'required|string|max:255',
            'description' => 'required',
            'avatar' => 'required|image|mimes:jpeg,png,jpg',
            'cover' => 'required|image|mimes:jpeg,png,jpg',
        ]);


        UserSocialGroup::create([
            'user_id'    => Auth::id(),
            'title'      => $req->title,
            'slug'       => Str::Slug($req->title).'-'.date('dmyhis'),
            'description'      => $req->description,
            'avatar'      => uploadImage($req->avatar, 'uploads/groups'),
            'cover'      => uploadImage($req->cover, 'uploads/groups'),
        ]);

        return back()->withMessage('Your group has been created.');


    }


    public function groupUpdate(Request $req)
    {


        $req->validate([
            'group_id' => 'required',
            'title' => 'required|string|max:255',
            'description' => 'required'
        ]);


        if($req->avatar)
        {
            $req->validate([
                'avatar' => 'required|image|mimes:jpeg,png,jpg',
            ]);
            $avatar = uploadImage($req->avatar, 'uploads/groups');
        }


        if($req->cover)
        {
            $req->validate([
                'cover' => 'required|image|mimes:jpeg,png,jpg',
            ]);
            $cover = uploadImage($req->cover, 'uploads/groups');
        }


        $group = UserSocialGroup::findOrFail(Crypt::decrypt($req->group_id));



        $group->title = $req->title;
        $group->slug = Str::Slug($req->title).'-'.date('dmyhis');
        $group->description = $req->description;
        $group->avatar = $avatar ?? $group->avatar;
        $group->cover = $cover ?? $group->cover;
        $group->save();

        return back()->withMessage('Group info has been updated.');


    }
    public function groupDelete($id)
    {
        $group = UserSocialGroup::findOrFail(Crypt::decrypt($id));
        $group->delete();
        return redirect()->back()->with('message','Group is deleted Successfully');
    }



    public function sendGroupInvitationMail(Request $req)
    {

        $req->validate([
            'email' => 'required'
        ]);


        $check = User::whereEmail($req->email)->count();

        if($check == 0)
        {
            return back()->withError('Sorry! The provided email is not attached with any of the CHWG member! Try again.');
        }

        $group = UserSocialGroup::findOrFail(Crypt::decrypt($req->group_id));

            sendMail([
               
                'view' => 'email.social.send_group_invitation_mail',
                'to' => $req->email,
                'name' => Auth::user()->name,
                'subject' => Auth::user()->name.' has sent you invitation to join the group'.$group->title.' at CHWG',
                'data' => [
                    'group'  => $group
                ]
            ]);

        return back()->withMessage('Group has been sent to the member.');

    }

    public function joinGroupViaLink($id)
    {

        if(!Auth::check())
        {
            Session::put('group_joining_link', url()->current());
            return redirect()->route('login')->withError('Please login to your account to join the group.');
        }   

        #GET CONNECTED GROUP
        $group = UserSocialGroup::findOrFail(Crypt::decrypt($id));

        #GET AUTHENTICATED USER
        $user = Auth::user();


        if(checkGroupFollowing(Auth::id(), $group->id) > 0)
        {
         return redirect()->route('index')->withError('You are already member of this group');   
        }
        else
        {

            $group->userFollowers()->syncWithoutDetaching($user);
            return redirect()->route('index')->withMessage('Group joing request has been submitted to the admin of group! Thanks.');
        }
    }

    

}
