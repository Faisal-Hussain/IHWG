<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Symfony\Component\Console\Input\Input;
use App\Models\Visitor;
use DB;

class AdminLoginController extends Controller
{

    public  function adminIndexLogin(){
        if(Auth::check()) {
           return $this->checkAdmin();
        }
        return view('admin.login');
    }

    public function dashboard(){

      $logs =  Visitor::select(DB::raw('DATE(created_at) as date'), DB::raw('count(*) as views'))
      ->groupBy('date')
      ->get();

        return view('admin.dashboard', get_defined_vars());
    }

    public function checkAdmin(){

        
        return redirect()->route('admin.dashboard');
        return redirect()->route('index');
    }

    protected function AdminAttemptLogin(Request $request)
    {
        if( $this->guard()->attempt($this->credentials($request), $request->filled('remember')))
        {
            return $this->checkAdmin();
        }
        else{
            return back()->with('error', 'Whoops! These credentials do not match our records.')->withInput($request->except('password'));;

        }

    }
    protected function credentials(Request $request)
    {
        return $request->only($this->username(), 'password');
    }
    protected function guard()
    {
        return Auth::guard();
    }
    public function username()
    {
        return 'email';
    }
    public function login(Request $request)
    {
        $this->validateLogin($request);

        // If the class is using the ThrottlesLogins trait, we can automatically throttle
        // the login attempts for this application. We'll key this by the username and
        // the IP address of the client making these requests into this application.
        if (method_exists($this, 'hasTooManyLoginAttempts') &&
            $this->hasTooManyLoginAttempts($request)) {
            $this->fireLockoutEvent($request);

            return $this->sendLockoutResponse($request);
        }

        if ($this->attemptLogin($request)) {
            return $this->sendLoginResponse($request);
        }

        // If the login attempt was unsuccessful we will increment the number of attempts
        // to login and redirect the user back to the login form. Of course, when this
        // user surpasses their maximum number of attempts they will get locked out.
        $this->incrementLoginAttempts($request);

        return $this->sendFailedLoginResponse($request);
    }
    protected function validateLogin(Request $request)
    {
        $request->validate([
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }
    protected function sendLoginResponse(Request $request)
    {
        $request->session()->regenerate();

        $this->clearLoginAttempts($request);

        if ($response = $this->authenticated($request, $this->guard()->user())) {
            return $response;
        }

        return $request->wantsJson()
                    ? new Response('', 204)
                    : redirect()->intended($this->redirectPath());
    }
    protected function sendFailedLoginResponse(Request $request)
    {
        throw ValidationException::withMessages([
            $this->username() => [trans('auth.failed')],
        ]);
    }

}
