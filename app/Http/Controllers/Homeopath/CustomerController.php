<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Crypt;


class CustomerController extends Controller
{
    public function index(Request $req)
    {

        return view('homeopath.customers.index', get_defined_vars());
    }
}
