<?php

namespace App\Http\Controllers\Admin\Finance;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceBooking;
use Carbon\Carbon;

class ServicesTransactionController extends Controller
{
    public function servicesTransaction(Request $req)
    {

        $revenue = ServiceBooking::selectRaw('year(created_at) year, monthname(created_at) month, sum(price) price')
                ->groupBy('year', 'month')
                ->orderBy('year', 'desc')
                ->get();


        $this_month_revenue = ServiceBooking::where('payment_method', '!=', 'pay-later')->where('payment_method', '!=', 'other')->whereMonth('created_at', Carbon::now()->month)->sum('price');
        $total = ServiceBooking::where('payment_method', '!=', 'pay-later')->where('payment_method', '!=', 'other')->sum('price');
        $last_month_revenue = ServiceBooking::where('payment_method', '!=', 'pay-later')->where('payment_method', '!=', 'other')->whereMonth('created_at', Carbon::now()->subMonth()->month)->sum('price');


        $services = ServiceBooking::where('payment_method', '!=', 'pay-later')->where('payment_method', '!=', 'other')->orderBy('id', 'DESC');

        if($req->status)
        {
            $services = $services->where('status', $req->status);
        }
            $services=$services->whereHas('user',function($q) {
                $q->where('role','!=','homeopath');
            });

        $services = $services->get();

        return view('admin.finance.services_transaction', get_defined_vars());

    }
}
