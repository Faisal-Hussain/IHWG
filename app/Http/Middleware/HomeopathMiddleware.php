<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class HomeopathMiddleware
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

            if(Auth::user()->role == 'homeopath'){
                return $next($request);
            }
            else{
                return redirect()->route('index');
            }

        }

        return redirect()->route('login');
    }
}
