<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Inquiry;

class InquiryController extends Controller
{
    public function submitInquiry(Request $request)
    {

        $request->validate([
            'name'    => 'required',
            'email'   => 'required',
            'subject' => 'required',
            'message' => 'required'
        ]);

    	Inquiry::create($request->all());
    	return back()->withMessage('Your inquiry has been submitted.');
      
    }

}
