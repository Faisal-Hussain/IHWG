<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Rules\PasswordExistRule;
use Hash;
use App\Models\User;
use App\Models\Profile;
use App\Models\AdsSetting;


class UserProfileController extends Controller
{

    public function dashboard()
    {
        $data=AdsSetting::where('user','user')->wherestatus(1)->orderBy('id','desc')->get();

        return view('user.dashboard', get_defined_vars());
    }


    public function profile()
    {
        return view('user.profile');
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





}
