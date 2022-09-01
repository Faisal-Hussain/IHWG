<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\FAQ;

class FAQController extends Controller
{
    public function index()
    {
    	$data=FAQ::orderBy('id','desc')->get();

    	return view('admin.faq.list',get_defined_vars());
    }
    public function create()
    {
    	return view('admin.faq.add',get_defined_vars());
    }

    public function save(Request $req)
    {
    	$req->validate([
    		'question'=>'required',
    		'answer'=>'required',
    	]);
    	if($req->id)
    	{
    		$faq=FAQ::find($req->id);
    		$faq->update([
    			'question'=>$req->question,
	    		'answer'=>$req->answer,
    		]);
    	}
    	else
    	{
    		$faq=FAQ::create([
	    		'question'=>$req->question,
	    		'answer'=>$req->answer,
	    	]);
    	}

    	return redirect()->route('admin.faq.index')->with('message','Data save successfully');
    }
    public function edit($id)
    {
    	$data=FAQ::find($id);
    	return view('admin.faq.edit',get_defined_vars());
    }
    public function delete($id)
    {
    	FAQ::find($id)->delete();
    	return redirect()->route('admin.faq.index')->with('message','Data has been deleted successfully');

    	
    }
}
