<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ShopProduct;
use Cart;

class ShopController extends Controller
{
    public function index(Request $request)
    {
        $products=$this->filter_product($request);

        $total=Cart::total();
        $cart = Cart::content();
        $filter_array=['sortable_value'=>'','brand_id'=>'','category_id'=>''];

        $slider_products = ShopProduct::latest()->take(3)->get();
        $best_sellers = ShopProduct::whereType('Best Seller')->take(3)->get();
        $new_arrivals = ShopProduct::whereType('New Arrival')->take(3)->get();


        return view('front.shop.index', get_defined_vars());

    }


    public function filter_product($request)
    {


        $products = ShopProduct::with('wishlist');


        if($request->category)
        {
            $products = $products->whereHas('shopCategory', function ($q) use ($request) {
                $q->where('slug', 'LIKE', '%'.$request->category.'%');
            });

        }

        if($request->brand)
        {
            $products = $products->whereHas('shopBrand', function ($q) use ($request) {
                $q->where('slug', 'LIKE', '%'.$request->brand.'%');
            });

        }
        if($request->tag)
        {
            $products=$products->where('tags','like','%'.$request->tag.'%');

        }



        $products = $products->orderBy('id','desc')->paginate(6);

        return $products;

    }

}
