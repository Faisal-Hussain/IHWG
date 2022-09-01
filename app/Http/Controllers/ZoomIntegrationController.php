<?php

namespace App\Http\Controllers;

use App\Jobs\SendZoomMeetingLinkJob;
use App\Models\Event;
use App\Models\EventRequest;
use App\Models\User;
use App\Models\Setting;
use App\Models\HomeopathServiceZoomMeeting;
use App\Models\ZoomMeeting;
use Illuminate\Http\Request;
use MacsiDigital\Zoom\Facades\Zoom;
use Auth;

class ZoomIntegrationController extends Controller
{
    public function meeting_create(Request $request)
    {


        $events=EventRequest::with('user')->where('event_timing_id',$request->event_time_id)->where('status','active')->get();
        
        $event_generater=Event::find($request->event_id);
            

        $user = Zoom::user()->find(Auth::User()->zoom_access_token);

        if(is_null($user))
        {
            return back()->withError('You have not connected/verified your zoom account yet.');
        }

        if($user->status == 'pending')
        {
              return back()->withError('Zoom invitation has not been accepted yet, please check your email and accept invitation');
        }



        /********************************************************************/
                            //MEETING CREATED
        /********************************************************************/


        if($user->status == 'active')
        {

            $meeting = Zoom::meeting()->make([
                'userId' => 'me',
                'topic' => 'Online Meeting',
                'type' => 2,
                'disable_recording' => false,
                'duration' => 1,
                'timezone' => 'Pakistan',
                'password' => '1234567890',
                'agenda' => 'Meeting for Event Discussion',
            ]);

            if(!$meeting)
            {
                return back()->withError('There is no meeting, only zoom user can create meeting');
            }
            else
            {
                $test= $user->meetings()->save($meeting);

                $zoom_meeting=ZoomMeeting::where('event_id',$request->event_id)->where('event_timing_id',$request->event_time_id)->first();

                if ($zoom_meeting)
                {
                    $zoom_meeting->update([
                        'joining_url'        =>$test->join_url,
                        'start_url'          =>$test->start_url,
                    ]);
                }else{
                    ZoomMeeting::create([
                        'event_timing_id'    =>$request->event_time_id,
                        'event_id'           =>$request->event_id,
                        'joining_url'        =>$test->join_url,
                        'start_url'          =>$test->start_url,
                    ]);
                }


                foreach ($events as $event)
                {

                    $data=array([
                        'join_url' => $test->join_url,
                        'start_url'=>$test->start_url,
                        'event_generater'=>$event_generater,
                        'event'=>$event,
                        'subject'=>strip_tags(emailSetting('zoom_meeting_email')->subject) ??'Zoom'
                    ]);

                    dispatch(new SendZoomMeetingLinkJob($data))->delay(now()->addSeconds(2));
                }

            }
        }
        else
        {
            return back()->withError('There is no zoom user, please try again');
        }

        return redirect($test->start_url);
    }





    public function serviceMeeting_create(Request $request)
    {


        $homeopath_user=User::findOrfail($request->user_id);
            

        $user = Zoom::user()->find(Auth::User()->zoom_access_token);

        if(is_null($user))
        {
            return back()->withError('You have not connected/verified your zoom account yet.');
        }

        if($user->status == 'pending')
        {
              return back()->withError('Zoom invitation has not been accepted yet, please check your email and accept invitation');
        }



        /********************************************************************/
                            //MEETING CREATED
        /********************************************************************/


        if($user->status == 'active')
        {

            $meeting = Zoom::meeting()->make([
                'userId' => 'me',
                'topic' => 'Online Meeting',
                'type' => 2,
                'disable_recording' => false,
                'duration' => 1,
                'timezone' => 'Pakistan',
                'password' => '1234567890',
                'agenda' => 'Meeting for Event Discussion',
            ]);

            if(!$meeting)
            {
                return back()->withError('There is no meeting, only zoom user can create meeting');
            }
            else
            {
                $test= $user->meetings()->save($meeting);

                $zoom_meeting=HomeopathServiceZoomMeeting::where('service_id',$request->service_id)->where('time_slot',$request->slot)->first();

                if ($zoom_meeting)
                {
                    $zoom_meeting->update([
                        'joing_url'        =>$test->join_url,
                        'start_url'          =>$test->start_url,
                    ]);
                }else{
                    
                    $zoom_meeting=HomeopathServiceZoomMeeting::create([
                        'service_id'    =>$request->service_id,
                        'time_slot'           =>$request->slot,
                        'joing_url'        =>$test->join_url,
                        'start_url'          =>$test->start_url,
                    ]);
                }


                  

                   

                        sendMail([
               
                            'view' => 'email.send_zoom_link_for_online_service',
                            'to' => $homeopath_user->email,
                            'name' => $homeopath_user->name,
                            'subject' => 'Zoom Invitation Link',
                            'data' => [
                                'name'=> $homeopath_user->name,
                                'email'=> $homeopath_user->email,
                                'subject'=> 'Zoom Invitation Link',
                                'message'=>'Your Joiningg Link for zoom meeting is '. $zoom_meeting->joing_url,
                            ]
                        ]);



            }
        }
        else
        {
            return back()->withError('There is no zoom user, please try again');
        }

        return redirect($test->start_url);
    }




    public function linkZoom(Request $req)
    {
        

        $user = Auth::User();
        $user->zoom_email = $req->email;
        $user->save();
           
        if($user->zoom_access_token == "")
        {


            try 
            {

                $zoom_user = Zoom::user()->create([
                    'first_name' => $user->name,
                    'email' => $user->zoom_email ?? $user->email,
                    'type' => 1
                ]);
               
                
                $user->zoom_access_token = $zoom_user->id;
                $user->save();

            } 

        
            catch (\Exception $e) 
            {

                return back()->withError($e->getMessage());

            }

            return back()->with('message', 'Your zoom account has been attached. Check your email inbox to accept invitation.');
        }

        return back()->withError('Account is already linked.');


    }

    public function removeZoomAccount()
    {
        Auth::User()->update(['zoom_access_token' => NULL]);
        return back()->withMessage('Zoom account has been removed from your account.');
    }



}
