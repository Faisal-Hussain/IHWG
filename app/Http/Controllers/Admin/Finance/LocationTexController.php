<?php

namespace App\Http\Controllers\Admin\Finance;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LocationTex;
use App\Models\HomeopathService;


class LocationTexController extends Controller
{
	public function save(Request $request)
	{
		
		
		$loc_tax=LocationTex::where('location',$request->location)->first();

		if($loc_tax)
		{
				$loc_tax->update([
				'location'=>$request->location,
				'service_commission'=>$request->service_commission,
				'service_tax'=>$request->service_tax,
				'service_discount'=>$request->service_discount,

			]);
		}else{
			
			LocationTex::create([
				'location'=>$request->location,
				'service_commission'=>$request->service_commission,
				'service_tax'=>$request->service_tax,
				'service_discount'=>$request->service_discount,

			]);
		}

		return redirect()->back()->with('message','Taxes has been saved');
	}
    
}
