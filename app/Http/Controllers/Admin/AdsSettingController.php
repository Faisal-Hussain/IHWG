<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdsSetting;
use Illuminate\Http\Request;

class AdsSettingController extends Controller
{
    public function index(Request $request)
    {
    	$ads=AdsSetting::all();
    	return view('admin.setting.pages.ads',get_defined_vars());
    }
    public function save(Request $request)
    {
    	
        
    	$item=AdsSetting::find($request->id);

    	if ($request->hasfile('image')) {
    		$img=$request->image;
    		$value=uploadImage($img,'uploads/cms');
    	}else{

    		$value=$item->image??'';
    	}
    	if ($request->id) {
    		$request->validate([
            'heading'=>'required',
            'url' => 'required|url',
           
          ]);
    		$item->update([
    		'heading'=>$request->heading,
    		'url'=>$request->url,
    		'image'=>$value??'',
    		'homeopath'=>$request->homeopath,
    		'advocate'=>$request->advocate,
    		'user'=>$request->user,


    		]);
    	}else{

	    		$request->validate([
	            'heading'=>'required',
	            'url' => 'required|url',
	            
	          ]);
	    		
    		AdsSetting::create([
    		'heading'=>$request->heading,
    		'url'=>$request->url,
    		'image'=>$value??'',
    		'homeopath'=>$request->homeopath,
    		'advocate'=>$request->advocate,
    		'user'=>$request->user,
    		]);

    	}
    	

    	return redirect()->back()->with('message','Data Save Successfully');
    }

    public function delete($id)
    {
        AdsSetting::find($id)->delete();
        return redirect()->back()->with('message','Data Deleted Successfully');
    }
    public function changeStatus($id)
    {
        $data=AdsSetting::find($id);
        if($data->status=='1')
        {
            $data->status=0;
        }else{
            $data->status=1;

        }
        $data->save();
        return redirect()->back()->with('message','Status Updated Successfully');
    }
}
