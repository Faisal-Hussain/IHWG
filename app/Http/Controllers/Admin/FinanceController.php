<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\LocationTex;
use App\Models\HomeopathService;

class FinanceController extends Controller
{

    public function __construct()
    {
        $this->middleware(['permission:browse_finance']);
    }


    public function index()
    {
    	$data=LocationTex::all();

        return view('admin.finance.index',get_defined_vars());
    }
    public function homeopathRevenue()
    {
    	$data=HomeopathService::with('ServiceBookings','homeopath')->get();
    	// $data[0]->ServiceBookings->sum('price')
    	return view('admin.finance.revenue',get_defined_vars());
    }
}
