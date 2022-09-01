<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use Auth;
use App\Models\HomeopathCategory;
use App\Models\HomeopathLibrary;
use App\Models\ShopProduct;
use App\Models\ServiceBooking;
use App\Models\UserSocialGroup;
use App\Models\User;
use App\Models\SocialPostTag;
use App\Models\Following;
use App\Models\FAQ;
use App\Models\SocialPost;


class FrontEndController extends Controller
{

    public function index()
    {
        return view('front.index', get_defined_vars());
    }

    public function aboutUs()
    {
        return view('front.about_us', get_defined_vars());
    }

    public function faqs()
    {
        $faqs = FAQ::latest()->get();
        return view('front.faqs', get_defined_vars());
    }


    public function ourMission()
    {
        return view('front.our_mission', get_defined_vars());
    }

    public function exploreHomeopathy()
    {
        $homeopath_categories = HomeopathCategory::with('homeopathLibraries')->get();
        return view('front.explore_homeopathy', get_defined_vars());
    }

    public function findHomeopath()
    {
        return view('front.find_homeopath', get_defined_vars());
    }


    public function store()
    {
        return view('front.store', get_defined_vars());
    }


    public function privacyPolicy()
    {
        return view('front.privacy_policy', get_defined_vars());
    }


    public function terms()
    {
        return view('front.terms', get_defined_vars());
    }

    public function contactUs()
    {
        return view('front.contact_us', get_defined_vars());
    }

    public function advocates()
    {
        return view('front.advocates', get_defined_vars());
    }

    public function consultant()
    {
        return view('front.consultant', get_defined_vars());
    }


    public function bookAppointment()
    {
        return view('front.book_appointment', get_defined_vars());
    }

    public function prescription($id)
    {

        $prescription = ServiceBooking::whereUuid($id)->first();

        if(!$prescription)
        {
            abort(404);
        }

        return view('front.prescription', get_defined_vars());
    }









}
