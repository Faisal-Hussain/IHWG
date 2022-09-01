<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceReview;
use App\Models\HomeopathService;
use Crypt;
use Auth;

class ReviewController extends Controller
{
    public function serviceReview(Request $req)
    {

        $review = ServiceReview::where('user_id', Crypt::decrypt($req->u))
                            ->where('homeopath_service_id', Crypt::decrypt($req->p))
                            ->count();


        if($review == 0)
        {

            $service = HomeopathService::find(Crypt::decrypt($req->p));

            Auth::loginUsingId(Crypt::decrypt($req->u));
            return view('front.reviews.add_review', get_defined_vars());
        }

        abort(404);

    }


    public function submitServiceReview(Request $req)
    {



        $req->validate([
            'feedback' => 'required',
            'rate'     => 'required',
            'service_id' => 'required',
        ]);


        $service = HomeopathService::find(Crypt::decrypt($req->service_id));

        ServiceReview::create(
            $req->only(['feedback', 'rate'])
            +
            [
                'homeopath_service_id' => $service->id,
                'user_id' => Auth::id(),
                'homeopath_id' => $service->user_id,
            ]
        );

        return redirect()->route('index')->withMessage('Thank you for your feedback at service.');

    }


}
