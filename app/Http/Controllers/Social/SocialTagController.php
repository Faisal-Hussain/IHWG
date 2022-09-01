<?php

namespace App\Http\Controllers\Social;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\SocialPostTag;
use Auth;
use Str;


class SocialTagController extends Controller
{
    public function checkUserFollowingTag(Request $req)
    {   

        $tag = SocialPostTag::whereTitle($req->tag)->first();

        if(checkUserFollowingTag(Auth::id(), $tag->id) > 0)
        {
            $status = 'Unfollow';
        }
        else
        {
            $status = 'Follow';
        }

        return response()->json(['status' => $status, 'tag' => $req->tag]);

    }






    public function tagFollowUnfollow(Request $req)
    {

        $tag = SocialPostTag::whereTitle($req->tag)->first();

        #GET AUTHENTICATED USER
        $user = Auth::user();


        if(checkUserFollowingTag(Auth::id(), $tag->id) > 0)
        {
            $tag->userTags()->detach($user);
            $message = 'unfollowed';
        }
        else
        {
            $tag->userTags()->syncWithoutDetaching($user);
            $message = 'followed';
        }

        return response()->json($message);

    }









}
