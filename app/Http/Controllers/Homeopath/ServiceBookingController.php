<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceBooking;
use App\Models\ServiceBookingPrescription;
use App\Jobs\UserServiceBookingCompleted;
use Auth;
use Crypt;
use Carbon\Carbon;


class ServiceBookingController extends Controller
{
    public function updateStatus(Request $req)
    {
     
        $get_status=base64_decode($req->status);
        $service = ServiceBooking::find(Crypt::decrypt($req->id))->update(['status' => base64_decode($req->status)]);
        $get_service=ServiceBooking::find(Crypt::decrypt($req->id));
        $date=$get_service->date;
        $time_slot=json_decode($get_service->time_slot);
        $time_slot=$time_slot[0];
    

        if ($get_status=='cancelled')
        {
            $data = [
                        'name'     => $get_service->user->name??'',
                        'email'    => $get_service->user->email??'',
                        'app_name' => env('APP_NAME'),
                        'subject'  => 'Booking cancelled at CHWG',
                        'time'=>    Carbon::now()->setTimezone('UTC')->format('Y-m-d H:i:s'),
                        'booking_title'=> $get_service->HomeopathService->title??'',
                        'note'=>    $req->note??'',
                        'date'=>Carbon::parse($date)->format('j F Y'),
                        'time_slot'=>$time_slot,

                    ];
           

            sendMail([
               
                'view' => 'email.user.booking_cancelled',
                'to' => $get_service->user->email,
                'name' => $get_service->user->name,
                'subject' => "Booking cancelled at CHWG",
                'data' => $data,
            ]);
        }
        return back()->withMessage('This booking is '.base64_decode($req->status).' now.');
    }


    public function bookingComplete(Request $req)
    {


        $req->validate([
            'booking_id' => 'required',
            'prescription' => 'required',
        ]);



        $service_booking = ServiceBooking::whereId(Crypt::decrypt($req->booking_id))->first();

        $service_booking->status = 'completed';
        $service_booking->save();


        ServiceBooking::find(Crypt::decrypt($req->booking_id))->update(['status' => 'completed']);

        if(isset($req->attachement))
        {
            $attachement = uploadImage($req->attachement, 'uploads/prescriptions');
        }
        else
        {
            $attachement = NULL;
        }


        ServiceBookingPrescription::create([
            'service_booking_id'    => Crypt::decrypt($req->booking_id),
            'prescription'          => $req->prescription,
            'attachement'           => $attachement
        ]);



                    sendMail([
                        'view'      => 'email.user.booking_completed',
                        'to'        => $service_booking->user->email,
                        'name'      => env('APP_NAME'),
                        'subject'   => strip_tags(emailSetting('booking_completed_email')->subject) ??'Your Service appointment has been completed at '.env('APP_NAME'),
                        'data'      => [
                                        'name'          => env('APP_NAME'),
                                        'email'         => $service_booking->user->email,
                                        'app_name'      => env('APP_NAME'),
                                        'service_id'    => Crypt::encrypt($service_booking->homeopath_service_id),
                                        'user_id'       => Crypt::encrypt($service_booking->user->id),
                                    ]
                         ]);


        return back()->withMessage('Booking has been marked as completed.');

    }


    public function appointments(Request $req)
    {

        $bookings = ServiceBooking::whereHas('HomeopathService', function($q) {
            $q->where('user_id', Auth::id());
        })
        ->orderBy('updated_at', 'DESC');


        if(isset($req->from) && isset($req->to))
        {
            $bookings = $bookings->whereDate('created_at', '>=', $req->from)->whereDate('created_at', '<=', $req->to);
        }

        if(isset($req->service))
        {
            $bookings = $bookings->where('homeopath_service_id', base64_decode($req->service));
        }

        if(isset($req->patient))
        {
            $bookings = $bookings->where('user_id', base64_decode($req->patient));
        }

        $bookings = $bookings->get();


        return view('homeopath.appointments.index', get_defined_vars());
    }


    public function appointmentsSchedule(Request $req)
    {

        $bookings = ServiceBooking::whereHas('HomeopathService', function($q) {
            $q->where('user_id', Auth::id());
        })
        ->orderBy('updated_at', 'DESC');


        if(isset($req->from) && isset($req->to))
        {
            $bookings = $bookings->whereDate('created_at', '>=', $req->from)->whereDate('created_at', '<=', $req->to);
        }

        if(isset($req->service))
        {
            $bookings = $bookings->where('homeopath_service_id', base64_decode($req->service));
        }

        if(isset($req->patient))
        {
            $bookings = $bookings->where('user_id', base64_decode($req->patient));
        }

        $bookings = $bookings->get();


        return view('homeopath.appointments.schedule', get_defined_vars());
    }


    public function appointmentsCalendar(Request $req)
    {

        $services = Auth::user()->HomeopathServices->pluck('id');

        $bookings = ServiceBooking::whereIn('homeopath_service_id', $services)->get();

        return view('homeopath.appointments.calendar', get_defined_vars());
    }






}
