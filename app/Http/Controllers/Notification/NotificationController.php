<?php

namespace App\Http\Controllers\Notification;

use App\Http\Controllers\Controller;
use App\Models\Notification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
   public function getNotifications()
   {
        $notif=Notification::where('user_id',Auth::id())->where('is_read',0)->orderBy('id','desc')->take(10)->get();
        $notif_count=Notification::where('user_id',Auth::id())->where('is_read',0)->get();
        return view('vendor.social-network.pages.notification',get_defined_vars());

   }
   public function seeNotification($id)
   {
        $noti=Notification::find($id);
        if ($noti){
            $noti->is_read=1;
            $noti->save();
        }
       $notif_count=Notification::where('user_id',Auth::id())->where('is_read',0)->get();
       $notif=Notification::where('user_id',Auth::id())->where('is_read',0)->orderBy('id','desc')->get();
       return view('vendor.social-network.pages.notification',get_defined_vars());
   }
}
