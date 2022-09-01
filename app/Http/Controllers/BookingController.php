<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Crypt;
use Session;
use App\Models\HomeopathService;
use App\Models\ServiceBooking;
use App\Models\Timetable;
use App\Models\User;
use App\Models\HomeopathProfile;
use App\Models\HomeopathHoliday;
use Carbon\Carbon;


class BookingController extends Controller
{

    // protected $stripe;

    // public function __construct()
    // {
    //     $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
    // }


    public function includeServicePrompt(Request $req)
    {

        $service = HomeopathService::findOrFail(Crypt::decryptString($req->service_id));

        $homeopath = User::with('HomeopathProfile', 'HomeopathServices', 'HomeopathImages')
                        ->whereHas('HomeopathProfile')
                        ->whereId($service->user_id)
                        ->whereStatus('active')
                        ->first();

        return view('front.homeopath.includes.booking_prompts', get_defined_vars());
    }


    public function booking($id)
    {

        if(!Auth::check())
        {
            Session::put('service-booking-url', url()->current());
            return redirect()->route('login')->withError('Please Login to book a service');
        }

        $service = HomeopathService::findOrFail(Crypt::decryptString($id));

        $homeopath = User::with('HomeopathProfile', 'HomeopathServices', 'HomeopathImages')
                        ->whereHas('HomeopathProfile')
                        ->whereId($service->user_id)
                        ->whereStatus('active')
                        ->first();



        return view('front.services.book_appointment', get_defined_vars());

    }


    public function getServiceSlot(Request $req)
    {

        if ($req->homeopath_id) {
            
        }else{
            $req->homeopath_id=Auth::id();
        }
        $homeopath=HomeopathProfile::where('user_id',$req->homeopath_id)->first();
   
        $booking_day = Carbon::parse($req->date)->format('l');

        $service = HomeopathService::findOrFail($req->service_id);

        // $interval = '+'.$service->duration.' minutes';
        $interval = '+'.$homeopath->service_time_interval.' minutes';

        $holiday = HomeopathHoliday::whereUserId($service->user_id)->where('holiday_from', '<=', $req->date)->where('holiday_to', '>=', $req->date)->count();

        if($holiday > 0)
        {
            return view('ajax.front.services.holiday_notification');
        }


        $timetable = Timetable::with('daySlots')->where('day', $booking_day)->whereUserId($service->user_id)->first();

        $bookings = ServiceBooking::where('homeopath_id',$req->homeopath_id)->where('date', $req->date)->pluck('time_slot');

        $main_array=array();


        foreach (json_decode($bookings) as $key => $value) {
            $data=json_decode($value,true);
            foreach ($data as $key2 => $item) {
                    array_push($main_array,$item);
                
            }
        }
        
        // $customize_array=array();
        // if (count($main_array)>0) {
        //     for($i=0; $i<count($main_array)-$service->duration ; $i++) 
        //     {
        //         array_push($customize_array,$main_array[$i]);
           
        //     }
        // }
        
        $bookings=$main_array;
        

        return view('ajax.front.services.booking_time_slots', get_defined_vars());

    }

    public function checkSlotAvailablity(Request $req)
    {
        

        $bookings = ServiceBooking::where('homeopath_id',$req->homeopath_id)->where('date', $req->date)->pluck('time_slot');
        $service = HomeopathService::findOrFail($req->service_id);
        $homeopath=HomeopathProfile::where('user_id',$req->homeopath_id)->first();
        $booking_day = Carbon::parse($req->date)->format('l');
        $timetable = Timetable::with('daySlots')->where('day', $booking_day)->whereUserId($service->user_id)->first();
        $timetable_array=array();
        foreach ($timetable->daySlots as $key2 => $list) {
                    $get_slot=$list->from;
                    $i=1;
                    while ($get_slot != $list->to) {

                        $get_slot=Carbon::parse($get_slot)
                        ->addMinutes($i)
                        ->format('H:i');
                        array_push($timetable_array,$get_slot);
                        
                    }

           

        }
        

        $last_el=last($timetable_array);

        $main_array=array();

        foreach (json_decode($bookings) as $key => $value) {
            $data=json_decode($value,true);
            foreach ($data as $key2 => $item) {
                array_push($main_array,$item);
            }
        }
       
        $bookings=$main_array;

        $all_booked_slots = [];
        array_push($all_booked_slots, $req->slot);
        $i=0;


        $min_slot = Carbon::parse($req->slot)
                        ->subMinute(1)
                        ->format('H:i');

        $req->slot=$min_slot;           

             // dd($bookings);           
        
        $avaialbe=false;
        for ($i=0; $i <=$service->duration; $i++) { 
                 $slot = Carbon::parse($req->slot)
                        ->addMinutes($i)
                        ->format('H:i');

                

            if ($slot=='00:00')
            {
                break;
            } 

                if ($req->date==Carbon::now()->format('Y-m-d')  ) 
                {
                    if ($i>=$service->duration && in_array($slot, $timetable_array) && !in_array($slot, $bookings) && $slot!='00:00' && $slot>Carbon::now()->format('H:i')  && Carbon::parse($slot)->format('H:i')<=Carbon::parse($last_el)->format('H:i')) {

                        $avaialbe=true;

                        

                    } elseif($i<=$service->duration+1 && in_array($slot, $bookings)){

                        
                        break;
                    } 
                }else{

                    if ($i>=$service->duration && in_array($slot, $timetable_array) && !in_array($slot, $bookings) && $slot!='00:00' && Carbon::parse($slot)->format('H:i')<=Carbon::parse($last_el)->format('H:i')) {

                        $avaialbe=true;

                        

                    } elseif($i<=$service->duration+1 && in_array($slot, $bookings)){

                        
                        break;
                    } 
                }

                    
                       
        }


        if ($avaialbe) {
            return response()->json($avaialbe);
            
        }
    }

}


// ALTER TABLE `service_bookings` ADD `homeopath_id` INT(11) NULL DEFAULT NULL AFTER `user_id`;