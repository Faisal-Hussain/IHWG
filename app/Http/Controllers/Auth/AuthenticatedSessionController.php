<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Session;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     *
     * @param  \App\Http\Requests\Auth\LoginRequest  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(LoginRequest $request)
    {


         $remember_me = $request->has('login_remember_me') ? true : false;

         $check = $request->only('email', 'password');
        
        if(Auth::attempt($check, $remember_me))
        {

            if(Session::has('service-booking-url'))
            {

                $url = Session::get('service-booking-url');
                Session::forget('service-booking-url');
                return redirect()->to($url);

            }

            if(Session::has('group_joining_link'))
            {

                $url = Session::get('group_joining_link');
                Session::forget('group_joining_link');
                return redirect()->to($url);

            }


            return redirect()->route('redirect.dashboard');
        }
        else
        {
            return back()->withError('Whoops! These credentials does not match our records.');
        }



    }

    /**
     * Destroy an authenticated session.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy(Request $request)
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect('/');
    }
}
