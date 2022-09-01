<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\NewsLetterEmail;

class NewsLetterEmailController extends Controller
{
     public function index()
    {
    	$data=NewsLetterEmail::all();
    	return view('admin.newsletter_email.list',get_defined_vars());

    }


    public function save(Request $request)
	{


		$validate=$request->validate([
			'email'=>'required|email|unique:news_letter_emails',
		]);

        NewsLetterEmail::create([
                        'email'=>$request->email,
                    ]);
                return redirect()->back()->with('message','Thanks for subscribing to our newsletter.');

    }
}
