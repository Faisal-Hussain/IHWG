<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HomeopathService;
use App\Models\ServiceBooking;
use App\Models\User;
use App\Models\HomeopathProfile;
use Auth;
use Crypt;
use Carbon\Carbon;

class ServicesController extends Controller
{
    public function index()
    {
       
        return view('homeopath.services.index', get_defined_vars());
    }
    public function servicesProfileImage(Request $req)
    {
       

        // $req->validate([
            
        //     'image' => 'required|image|mimes:jpg,png,jpeg,gif,svg|max:4096',
        // ]);
       
        if ($req->hasFile('image')) {

            $image = uploadImage($req->image,'uploads/services');
            $Auth_user=User::findOrFail($req->id);
            $user=HomeopathProfile::where('user_id',$Auth_user->id)->first();
            
            $user->user_id=$Auth_user->id;
            $user->service_profile_img=$image;
            $user->save();
            return redirect()->back()->withMessage('Image has been saved');
        }
        return redirect()->back();

    }

    public function create(Request $req)
    {
        $req->validate([
            'title'              => 'required',
            'duration'           => 'required',
            'service_theme_id'   => 'required',
            'type'               => 'required',
            'price'               => 'required',
            'meeting_handled_via' => 'required',
            'thumbnail'          => 'image|mimes:jpg,png,jpeg,gif,svg|max:4096'
        ]);

        $meeting_handel_via=json_encode($req->meeting_handled_via);
        if ($req->thumbnail)
        {
            $image=uploadImage($req->thumbnail, 'uploads/services');
        }

        HomeopathService::create([
            'user_id'               => Auth::Id(),
            'title'                 => $req->title,
            'duration'              => $req->duration,
            'type'                  => $req->type,
            'price'                 => $req->price,
            'service_theme_id'      => $req->service_theme_id,
            'thumbnail'             => $image??'',
            'meeting_handled_via'   => $meeting_handel_via
        ]);

        return back()->withMessage('Service has been added.');

    }


    public function update(Request $req)
    {

        $req->validate([
            'title'              => 'required',
            'duration'           => 'required',
            'service_theme_id'   => 'required',
            'type'               => 'required',
            'price'               => 'required',
            'meeting_handled_via' => 'required',
        ]);


        $service = HomeopathService::find(Crypt::decrypt($req->service_id));

        if($req->thumbnail)
        {

            $req->validate([
                'thumbnail'      =>  'image|mimes:jpg,png,jpeg,gif,svg|max:4096'
            ]);

            $thumbnail = uploadImage($req->thumbnail, 'uploads/services');

        
        }
        
        $meeting_handel_via=json_encode($req->meeting_handled_via);
        $service->update([
            'user_id'            => Auth::Id(),
            'title'              => $req->title,
            'duration'           => $req->duration,
            'type'               => $req->type,
            'price'              => $req->price,
            'service_theme_id'   => $req->service_theme_id,
            'thumbnail'          => $thumbnail ?? $service->thumbnail,
            'meeting_handled_via'   => $meeting_handel_via,
        ]);


        return back()->withMessage('Service has been updated.');

    }



    public function detail($id)
    {
        $service = HomeopathService::find(Crypt::decrypt($id));
        return view('homeopath.services.detail', get_defined_vars());
    }

    public function updateStatus($id, $status)
    {
        $service = HomeopathService::find(Crypt::decrypt($id))->update(['status' => base64_decode($status)]);
        return back()->withMessage('This service is '.base64_decode($status).' now.');
    }

    public function delete($id)
    {
        $service = HomeopathService::find(Crypt::decrypt($id))->delete();

        return redirect()->route('homeopath.services.index')->withMessage('Service has been removed.');
    }




    public function bookAppointment($id)
    {

        $service = HomeopathService::find(Crypt::decrypt($id));

        $users = User::where('id', '!=', auth()->id())->where('role', '!=', 'admin')->get();

        return view('front.services.homeopath.book_appointment', get_defined_vars());
    }
    
    public function createAppointment(Request $req)
    {
        // dd($req->all());
        // Crypt::decrypt($req->user_id)
            $user=User::where('name','LIKE','%'.$req->patient_name.'%')->where('phone',$req->patient_phone)->first();
            if ($user) {
                $service = HomeopathService::findOrFail(Crypt::decrypt($req->service_id));
       
                $time_slots=getAllTimeSlots($req->time_slot,$service->duration??30);
                $time_slots=json_encode($time_slots);
                $booking = ServiceBooking::create([
                    'user_id'                 => $user->id,
                    'homeopath_id'            => Auth::Id(),
                    'uuid'                    => date('dmyhis'),
                    'homeopath_service_id'    => $service->id,
                    'date'                    => $req->date,
                    'time_slot'               => $time_slots,
                    'price'                   => $service->price,
                    'payment_method'          => 'other'

                ]);

                return redirect()->route('homeopath.dashboard')->withMessage('Booking has been created.');

            }else{

                return redirect()->back()->withMessage('There is no user registered at CHWG with this name and phone number');

            }

    }



}
