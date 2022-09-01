<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BadgeRequest;
use Auth;

class BadgeController extends Controller
{
    
    public function getMoreBadges()
    {
        return view(Auth::user()->role.'.get_more_badges', get_defined_vars());
    }

    public function getMoreBadgesPost(Request $req)
    {

        $req->validate([
            'badge_id'    => 'required|in:2,3,4,5,6,7,8,9,10',
            'description' => 'required'
        ]);


        $check = BadgeRequest::whereUserId(Auth::id())->whereBadgeId($req->badge_id)->whereStatus('pending')->count();

        if($check > 0)
        {
            return back()->withError('Your request already been submitted with this badge.');
        }



        if(isset($req->attachement))
        {
            $attachement = uploadImage($req->attachement, 'uploads/badges/requests');
        }



        BadgeRequest::create([
            'user_id'       => Auth::id(),
            'badge_id'      => $req->badge_id,
            'description'   => $req->description.'  '.$req->url,
            'attachement'   => $attachement ?? NULL
        ]);


        return back()->withMessage('Your request has been submitted. You will be informed via email about the status.');



    }
}
