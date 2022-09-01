<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class AdminProfileController extends Controller
{
    public function profile()
    {
        return view('admin.profile');
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
        return redirect()->back()->with('message', 'profile has been updated Successfully!');
    }

}
