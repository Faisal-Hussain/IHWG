<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;

class CheckHomeoProfileActive
{


    public function handle(Request $request, Closure $next)
    {
        if (!Auth::guest()) {

            if(Auth::user()->status == 'pending')
            {
                return back()->withError('Your profile is pending! You will be informed via email once the profile activated.');
            }
            else
            {
                return $next($request);
            }

        }


        return $next($request);
    }
}
