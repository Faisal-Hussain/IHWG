<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\BadgeRequest;
use App\Models\User;


class BadgeController extends Controller
{
    public function badgeRequests()
    {
        $badges = BadgeRequest::orderBy('id', 'DESC')->get();
        return view('admin.badges.badge_requests', get_defined_vars());
    }
    public function badgeRequestsStatus(Request $request)
    {
    	

    	$user=User::find(decrypt($request->user_id));

    	$badge_request=BadgeRequest::find(decrypt($request->id));
    
    	$badge_request->status=$request->status;

    	$badge_request->save();
    	
    	if ($user && $badge_request->status=='active' ) {
    		$user->badge=$badge_request->badge_id;
    		$user->save();


    		sendMail([
                'view' => 'email.admin.badge_verification_email',
                'to' => $user->email,
                'name' => $user->name,
                'subject' =>$request->reason ?? 'You get a Badge',
                'data' => [
                    'name'=> $user->name,
                    'email'=> $user->email,
                    'badge'=>$badge_request->badge->title??'',
                    'subject'=>$request->reason ?? 'You get a Badge',
                    'message'=>'',
                ]
            ]);
    	}
    	
    	return redirect()->back()->with('message','Status update and Badge has been assigned to user');
    }
}
