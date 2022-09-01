<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Donation;
use Carbon\Carbon;

class DonationController extends Controller
{
    public function donations()
    {
        $donations = Donation::with('user')->orderBy('id', 'DESC')->get();

        $total = Donation::sum('price');
        $this_month_donation = Donation::whereMonth('created_at', Carbon::now()->month)->sum('price'); 
        return view('admin.donations.donations', get_defined_vars());
    }
}
