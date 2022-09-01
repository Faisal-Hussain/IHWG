<?php

namespace App\Http\Controllers\Admin\Email;

use App\Http\Controllers\Controller;
use App\Models\Setting;
use App\Models\ServiceBooking;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Carbon\Carbon;
class EmailSettingController extends Controller
{

    public function setting()
    {
         
        return view('admin.email_setting.index');
    }

    public function index(Request $request)
    {
       
        $req=$request->all();

        $setting=Setting::all();
        if ($request->email=='sub_admin_email')
        {
            return view('admin.email_setting.admin.sub_admin_email',get_defined_vars());
        }
        if ($request->email=='zoom_meeting')
        {
            return view('admin.email_setting.advocate.zoom_meeting',get_defined_vars());
        }
        if ($request->email=='verify_email')
        {
            return view('admin.email_setting.admin.verifyEmail',get_defined_vars());
        }
        if ($request->email=='advocate_booking')
        {
            return view('admin.email_setting.advocate.advocate_booking_confirmation',get_defined_vars());
        }
        if ($request->email=='register_advocate')
        {
            return view('admin.email_setting.advocate.register_advocate',get_defined_vars());
        }
        if ($request->email=='book_completed')
        {
            return view('admin.email_setting.user.booking_completed_email',get_defined_vars());
        }
        if ($request->email=='book_confirmation')
        {
            return view('admin.email_setting.user.booking_confirmation_email',get_defined_vars());
        }
        if ($request->email=='invitation')
        {
            return view('admin.email_setting.user.sendInvitationEmail',get_defined_vars());
        }
        if ($request->email=='register_user')
        {
            return view('admin.email_setting.user.register_user',get_defined_vars());
        }
        if ($request->email=='register_homeopath')
        {
            return view('admin.email_setting.homeopath.register',get_defined_vars());
        }
         if ($request->email=='service_booking_alert')
        {
            return view('admin.email_setting.service_booking_alert',get_defined_vars());
        }


    }
    public function save(Request $request)
    {

        $setting = $request->except('_token');
       
        $set = Setting::where('key',$request->email_type)->first() ?: new Setting();
            if ($request->hasFile('image')) {
                $img=$request->image;
                $image_path =  uploadImage($img, 'uploads/cms', $img);
                $setting['image']=$image_path;
                
            }else{
                $setting['image']='';  
            }
            
            $value=json_encode($setting);
            $set->key = $request->email_type;
            $set->value = $value;
            $set->save();



        return redirect()->back()->with('message', 'The settings has been updated.');
    }
    
    public function emailAlert()
    {
        $service_bookings=ServiceBooking::all();
        $arr = array( );
        
        foreach ($service_bookings as $key => $value) {
            
            $today=Carbon::now();
            $start_date =Carbon::parse($today);
            $end_date =Carbon::parse($value->date.' '.$value->time_slot);
            $different_hours = $start_date->diffInHours($end_date);
            $arr[$key] =$different_hours;

            
            if ($different_hours<='24' && $value->email_alert=='0') {
               
                
                    sendMail([
                        'view' => 'email.service_booking_alert',
                        'to' => $value->user->email,
                        'name' => $value->user->name,
                        'subject' =>emailSetting('service_booking_alert')->subject ?? 'Alert',
                        'data' => [
                        'service'=>$value->HomeopathService->title,
                        'user'=>$value->user->name,

                        ]
                    ]);
                $value->email_alert=1;
                $value->save();
            }
        
        }
            
    }
}
