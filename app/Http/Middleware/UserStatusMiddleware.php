<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;

class UserStatusMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

        if (!Auth::guest()) {

            if(Auth::user()->status == 'disabled')
            {
                return redirect()->route('index')->withError('Your account is blocked at CHWG. Contact CHWG support to activate account.');
            }
            else
            {
                return $next($request);
            }

        }


        return $next($request);
    }
}
