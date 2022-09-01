<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Auth;


class CheckSociallyCompleted
{

    public function handle(Request $request, Closure $next)
    {
    

        if(Auth::user()->is_socially_completed == true)
        {
            return $next($request);
        }

    $message = 'Please explore the following steps<br> to redirect to social media!';
    return response()->view('vendor.social-network.how_to_prompt', get_defined_vars());

    }
}
