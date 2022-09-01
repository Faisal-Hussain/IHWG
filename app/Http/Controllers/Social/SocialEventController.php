<?php

namespace App\Http\Controllers\Social;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\Event;
use App\Models\EventTiming;
use App\Models\EventRequest;
use App\Models\ReportUser;
use Auth;
use Crypt;

class SocialEventController extends Controller
{
    public function eventInterested(Request $req)
    {


        if($req->update_request == 'response')
        {
            EventRequest::updateOrCreate(
                [
                    'user_id'           => Auth::id(), 
                    'event_timing_id'   => $req->id
                ]   
            );    

            return response()->json(['id' => $req->id, 'message' => 'done']);
        }

        

        $check = EventRequest::whereUserId(Auth::id())->whereEventTimingId($req->id)->count();

        if($check > 0)
        {
            return response()->json(['id' => $req->id, 'message' => true]);
        }

        return response()->json(['id' => $req->id, 'message' => false]);

    }
    public function eventRequest(Request $req)
    {
        
            $id=Crypt::decrypt($req->id);
            $eventTiming=EventTiming::where('event_id',$id)->where('date',$req->date)->where('time',$req->timing)->first();
            EventRequest::updateOrCreate(
                    [
                        'user_id'           => Auth::id(), 
                        'event_timing_id'   => $eventTiming->id??''
                    ]   
                ); 
            return redirect()->back()->with('message','Your request to join event has been sent successfully.');
    }



    public function reportUser(Request $req)
    {

        $req->validate([
            'user_id'     => 'required',
            'reason'      => 'required',
            'type'        => 'required'
        ]);

        $check = ReportUser::whereUserId(Crypt::decrypt($req->user_id))->whereReportedBy(Auth::id())->count();

        if($check > 0)
        {
            return back()->withError('You already have reported this user.');
        }

        ReportUser::create([
            'reported_by'   => Auth::id(),
            'user_id'       => Crypt::decrypt($req->user_id),
            'reason'        => $req->reason,
            'type'          => $req->type
        ]);

        return back()->withMessage('Report has been submitted.');


    }



}
