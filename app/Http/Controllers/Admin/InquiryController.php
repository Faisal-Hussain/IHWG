<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Inquiry;
class InquiryController extends Controller
{


    public function inquiries()
    {
    	$inquiries = Inquiry::orderBy('id', 'DESC')->get();
    	return view('admin.inquiries.inquiries', get_defined_vars());
    }

    public function inquiryUpdate($id)
    {
    	Inquiry::find($id)->update(['status' => 'closed']);
    	return back()->withMessage('Inquiry status has been updated.');
    }
}
