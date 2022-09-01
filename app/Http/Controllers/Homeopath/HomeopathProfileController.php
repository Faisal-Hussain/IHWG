<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Rules\PasswordExistRule;
use Hash;
use App\Models\User;
use App\Models\Profile;
use Crypt;
use App\Models\HomeopathProfile;
use App\Models\ServiceBooking;
use App\Models\HomeopathService;
use App\Models\AdsSetting;
use App\Models\ShopOrder;


class HomeopathProfileController extends Controller
{
    public function dashboard()
    {

    

        $services = Auth::user()->HomeopathServices->pluck('id');

        $income = ServiceBooking::whereIn('homeopath_service_id', $services)->sum('price');
        $total_appointments = ServiceBooking::whereIn('homeopath_service_id',  $services)->count();
        $active_appointments = ServiceBooking::whereIn('homeopath_service_id', $services)->where('status', 'active')->count();
        $today_appointments = ServiceBooking::whereIn('homeopath_service_id', $services)->where('date', now()->format('Y-m-d'))->where('status', 'active')->count();
            $data=AdsSetting::where('homeopath','homeopath')->wherestatus(1)->orderBy('id','desc')->get();

        return view('homeopath.dashboard', get_defined_vars());
    }
    

    public function profile()
    {
        return view('homeopath.profile');
    }


    public function updateProfile(Request $request)
    {
        $user = User::find(Auth::User()->id);

        $request->validate([
          'name'=>'required',
          'email'=>'required',
        ]);
        if ($request->email != $user->email) {
            $request->validate([
              'email' =>'required|email|unique:users',
            ]);
        }
        $user->name = $request->name;
        $user->phone = $request->phone;
        $user->email = $request->email;
        if ($request->password) {
            $user->password = $request->password;
        }
        if($request->hasfile('image')){
          $image = $request->file('image');
          $filename = 'uploads/users/'.time() . '.' . $image->getClientOriginalExtension();
          $movedFile = $image->move('uploads/users/', $filename);
          $user->avatar = $filename;
          $user->save();
        }else {
            $user->save();
        }
        return redirect()->back()->with('message', 'profile has been updated.');
    }

    public function updatePassword(Request $req)
    {
        $messages = [
            'old_password.required' => 'Enter your old password',
            'password.required' => 'Enter your password',
            'password.confirmed' => 'Confirm your password',
            'password.min' => 'Enter a stronger password',
        ];

        $rules = [
            'old_password' => ['required',new PasswordExistRule()],
            'password' => ['required','min:6','confirmed'],
        ];

        $this->validate($req,$rules,$messages);
        $user=Auth::user();
        $user->password=Hash::make($req->password);
        $user->save();

        return back()->with('message', 'Password has been updated.');
    }


    public function completeProfile(Request $req)
    {


        $req->validate([
            'designation'           => 'required|string|max:255',
            'registration_number'   => 'required',
            'caption'               => 'required|string',
            'specializations'       => 'required',
            'location'              => 'required',
            'certifications'        => 'required',
            'affiliations'          => 'required',
            'latitude'              => 'required',
            'longitude'             => 'required',
            'estabilished_at'       => 'required',
        ]);


   
     $doc1=array();
     $doc2=array();
     if ($req->edu_designation) {
         foreach ($req->edu_designation as $key => $value) {
            $file=uploadImage($value,'uploads/homeopathProfile/aprovalDocument');
            array_push($doc1, $file);
         }
     }
     
     if ($req->certifications) {
         foreach ($req->certifications as $key => $value) {
            $file=uploadImage($value,'uploads/homeopathProfile/certifications');
            array_push($doc2, $file);
         }
     }

       

        HomeopathProfile::create([
            'user_id'=>Auth::Id(),
            'registration_number'=>$req->registration_number,
            'designation'=>$req->designation,
            'edu_designation'=>json_encode($doc1),
            'specializations'=>$req->specializations,
            'location'=>$req->location,
            'latitude'=>$req->latitude,
            'longitude'=>$req->longitude,
            'address'=>$req->address,
            'caption'=>$req->caption,
            'certifications'=>json_encode($doc2),
            'focuses'=>$req->focuses,
            'affiliations'=>$req->affiliations,
            'estabilished_at'=>$req->estabilished_at,
        ]);

        Auth::user()->update(['status' => 'pending']);


        return redirect()->route('homeopath.dashboard')->withMessage('Welcome to your dashboard.');

    }


    public function completeProfileUpdate(Request $req)
    {


        $req->validate([
            'designation'       => 'required|string|max:255',
            'caption'           => 'required|string',
            'specializations'   => 'required',
            'location'          => 'required',
            'certifications'    => 'required',
            'affiliations'      => 'required',
            'latitude'          => 'required',
            'longitude'         => 'required',
            'estabilished_at'   => 'required',
        ]);


        HomeopathProfile::find(Crypt::decrypt($req->profile_id))->update($req->except('profile_id'));

        return back()->withMessage('Profile has been updated.');

    }


    public function homeopathBadgeStatusUpdate(Request $req)
    {
       
      return setHomeopathBadge(Auth::user()->HomeopathProfile->id,$req->badge,$req->status);
    }

    





}
