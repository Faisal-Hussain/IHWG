<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Profile;
use App\Models\Setting;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use App\Jobs\AdvocateRegisteredMailJob;
use Str;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $req)
    {


        $req->validate([
            'name' => 'required|string|max:255',
            'user_name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'min:8|required_with:confirm_password|same:confirm_password',
            'confirm_password' => 'min:8',
            'store_name' => 'required',
            'phone' => 'required',
            'address_line_1' => 'required',
            'address_line_2' => 'required',
            'city' => 'required',
            'state' => 'required',
            'country' => 'required',
            'zip_code' => 'required',
        ]);



        $user = User::create([
            'name'       => $req->name,
            'slug'       => Str::slug($req->name),
            'user_name'  => $req->user_name,
            'email'      => $req->email,
            'password'   => Hash::make($req->password),
            'phone'      => $req->phone,
        ]);


        Profile::create([
            'user_id'     => $user->id,
            'store_name' => $req->store_name,
            'address_line_1'  => $req->address_line_1,
            'address_line_2'  => $req->address_line_2,
            'city'       => $req->city,
            'state'      => $req->state,
            'country'    => $req->country,
            'zip_code'   => $req->zip_code,
        ]);


        Auth::login($user);
        
        $user->sendEmailVerificationNotification();


        $data = [
            'name'     => $user->name,
            'email'    => $user->email,
            'app_name' => env('APP_NAME'),
            'subject'  => strip_tags(emailSetting('register_advocate')->subject) ?? 'Your advocacy account has been created at IHWG',
        ];

            // sendMail([
               
            //     'view' => 'email.advocate.registered_advocate',
            //     'to' => $user->email,
            //     'name' => $user->name,
            //     'subject' => strip_tags(emailSetting('register_advocate')->subject) ?? 'Registeration Completed',
            //     'data' => [
            //         'name'=> $user->name,
            //         'email'=> $user->email,
            //         'subject'=> strip_tags(emailSetting('register_advocate')->subject) ?? 'Registeration Completed',
            //         'message'=>'',
            //     ]
            // ]);

        // dispatch(new AdvocateRegisteredMailJob($data))->delay(now()->addSeconds(2));
        
        return redirect()->route('redirect.dashboard');
        
    }




    public function userRegister(Request $req)
    {


        $req->validate([
            
            'name' => 'required',
            'phone' => 'required',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|min:8'
        ]);

      

        $user = User::create([
            'name'       => $req->name,
            'slug'       => Str::slug($req->name),
            'user_name'  => str_replace(' ', '', $req->name).date('dmyhis'),
            'email'      => $req->email,
            'role'       => $req->role??'user',
            'phone'       => $req->phone??'',
            'zip_code'   => $req->zip_code??'',
            'password'   => Hash::make($req->password),
        ]);

        $user->sendEmailVerificationNotification();

        
      //   if($req->role=='homeopath')
      //   {
      //   // $user->status='disabled';
      //   // $user->save();
      //       sendMail([
               
      //           'view' => 'email.homeopath.register_homeopath',
      //           'to' => $user->email,
      //           'name' => $user->name,
      //           'subject' => strip_tags(emailSetting('register_homeopath')->subject) ?? 'Registeration Completed',
      //           'data' => [
      //               'name'=> $user->name,
      //               'email'=> $user->email,
      //               'subject'=> strip_tags(emailSetting('register_homeopath')->subject) ?? 'Your profile has been verified',
      //               'message'=>'',
      //           ]
      //       ]);
      
      // }else{
       
      //   sendMail([
               
      //           'view' => 'email.user.register_user',
      //           'to' => $user->email,
      //           'name' => $user->name,
      //           'subject' => strip_tags(emailSetting('register_user')->subject)  ?? 'Registeration Completed',
      //           'data' => [
      //               'name'=> $user->name,
      //               'email'=> $user->email,
      //               'subject'=> strip_tags(emailSetting('register_user')->subject) ??'Your profile has been verified',
      //               'message'=>'',
      //           ]
      //       ]);
      // }
      

        Auth::login($user);

        return redirect()->route('redirect.dashboard');


    }




}
