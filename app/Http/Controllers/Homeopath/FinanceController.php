<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\Rules\PasswordExistRule;
use Hash;
use App\Models\User;
use App\Models\Profile;
use Crypt;
use App\Models\HomeopathProfile;
use App\Models\ServiceBooking;
use App\Models\HomeopathService;

class FinanceController extends Controller
{
    public function index()
    {
        return view('homeopath.finance.index', get_defined_vars());
    }
}
