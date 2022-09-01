<?php

namespace App\Http\Controllers\Admin\Member;

use App\Http\Controllers\Controller;
use App\Jobs\SendProfileVerificationInfoEmail;
use App\Models\User;
use App\Models\Setting;
use Illuminate\Http\Request;

class MemberController extends Controller
{
    public function index(Request $request)
    {

        $users=User::where('role',$request->member);

        if ($request->status)
        {
            $users=$users->where('status',$request->status);
        }

        $users=$users->orderBy('id','desc')->get();
        $status=$request->status;
        $member=$request->member;

        return view('admin.member.list',get_defined_vars());
    }
    public function detail($id)
    {
        $id=decrypt($id);
        $user=User::find($id);
        return view('admin.member.detail',get_defined_vars());
    }
    public function verify($id,$verify)
    {
       $user= User::find($id);

       if($verify=='active')
       {
           $user->status='active';

       }if($verify=='block')
       {
           $user->status='disabled';
       }
       $user->save();


        if ($user->role=='homeopath' && $user->status=='active')
        {
            sendMail([
                'view' => 'email.admin.verifyEmail',
                'to' => $user->email,
                'name' => $user->name,
                'subject' =>strip_tags(emailSetting('verify_email')->subject) ?? 'Profile Verified',
                'data' => [
                    'name'=> $user->name,
                    'email'=> $user->email,
                    'subject'=>emailSetting('verify_email')->subject ?? 'Your profile has been verified',
                    'message'=>'',
                ]
            ]);

        }
         if ($user->role=='homeopath' && $user->status=='disabled')
        {
            sendMail([
                'view' => 'email.admin.unVerifyEmail',
                'to' => $user->email,
                'name' => $user->name,
                'subject' =>'Profile Un-Verified',
                'data' => [
                    'name'=> $user->name,
                    'email'=> $user->email,
                    'subject'=>emailSetting('verify_email')->subject ?? 'Your profile has not been verified',
                    'message'=>'',
                ]
            ]);

        }



       return redirect()->back();
    }

    public function delete($id,$verify)
    {
        User::find($id)->delete();

        return redirect()->to(route('member.index')."?member=".$verify)->with('message','User has been deleted successfully');
    }

    public function filter(Request $request)
    {
        dd($request->all());
    }

}
