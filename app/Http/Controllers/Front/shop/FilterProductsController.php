<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopProduct;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class FilterProductsController extends Controller
{
    public function index(Request $request)
    {

        $filter_array=array();

        if ($request->filter_options){
            $products = ShopProduct::with('wishlist');

            if($request->parameter=='category')
            {
                $products = $products->whereHas('shopCategory', function ($q) use ($request) {
                        $q->where('slug', 'LIKE', '%'.$request->per_val.'%');
                    });
                if ($request->colors) {
                    $products = $products->whereIn('shop_color_id', $request->colors);

                }
                if ($request->varients) {
                    $products = $products->whereIn('shop_variant_id', $request->varients);
                }
                if ($request->varients && $request->colors) {
                    $products = $products->whereIn('shop_color_id', $request->colors)
                        ->whereIn('shop_variant_id', $request->varients);
                }

            }

            elseif($request->parameter=='brand')
            {
                $products = $products->whereHas('shopBrand', function ($q) use ($request) {
                        $q->where('slug', 'LIKE', '%'.$request->per_val.'%');
                    });
                if ($request->colors) {
                    $products = $products->whereIn('shop_color_id', $request->colors);

                }
                if ($request->varients) {
                    $products = $products->whereIn('shop_variant_id', $request->varients);
                }
                if ($request->varients && $request->colors) {
                    $products = $products->whereIn('shop_color_id', $request->colors)
                        ->whereIn('shop_variant_id', $request->varients);
                }

            } elseif ($request->parameter == 'tag') {
                $products = $products->where('tags', 'like', '%' . $request->per_val . '%');
                if ($request->colors) {

                    $products = $products->whereIn('shop_color_id', $request->colors);

                }
                if ($request->varients) {
                    $products = $products->whereIn('shop_variant_id', $request->varients);
                }
                if ($request->varients && $request->colors) {
                    $products = $products->whereIn('shop_color_id', $request->colors)
                        ->whereIn('shop_variant_id', $request->varients);
                }

            }
            else{

                if ($request->colors)
                {
                    $products = $products->whereIn('shop_color_id',$request->colors);

                }if ($request->varients)
                {
                    $products = $products->whereIn('shop_variant_id',$request->varients);
                }if ($request->varients && $request->colors)
                {
                    $products = $products->whereIn('shop_color_id',$request->colors)
                        ->whereIn('shop_variant_id',$request->varients);
                }

            }

            $products = $products->where('amount','>=',$request->min_value)
                ->where('amount','<=',$request->max_value)
                ->orderBy('id','desc')->paginate(6);
        }
        if($request->sortable_value) {

            $products = ShopProduct::with('wishlist');
            if ($request->parameter=='category')
            {
                $products = $products->whereHas('shopCategory', function ($q) use ($request) {
                        $q->where('slug', 'LIKE', '%'.$request->per_val.'%');
                    });
                $products=$this->sortProduct($request,$products);

            }
            elseif ($request->parameter=='brand'){

                $products = $products->whereHas('shopBrand', function ($q) use ($request) {
                        $q->where('slug', 'LIKE', '%'.$request->per_val.'%');
                    });
                $products=$this->sortProduct($request,$products);
            }
            elseif ($request->parameter=='tag'){

                $products=$products->where('tags','like','%'.$request->per_val.'%');
                $products=$this->sortProduct($request,$products);
            }
            else{

                $products=$this->sortProduct($request,$products);
            }


        }


        $total=Cart::instance('shopping')->total();
        $cart = Cart::instance('shopping')->content();
        $slider_products = ShopProduct::all();
        $filter_array=['sortable_value'=>$request->sortable_value,'brand_id'=>'','category_id'=>''];


        return view('front.shop.ajax.products',get_defined_vars());
    }

        public function sortProduct($request,$products)
        {


                if ($request->sortable_value == 'alpaz') {
                    $products = $products->orderBy('title')->paginate(6);

                }
                if ($request->sortable_value == 'alpza') {

                    $products = $products->orderBy('title', 'desc')->paginate(6);

                }
                if ($request->sortable_value == 'low-high') {
                    $products = $products->orderBy('amount', 'desc')->paginate(6);


                }
                if ($request->sortable_value == 'high-low') {
                    $products = $products->orderBy('amount', 'asc')->paginate(6);

                }
                if ($request->sortable_value == 'old-new') {
                    $products = $products->orderBy('created_at', 'asc')->paginate(6);

                }
                if ($request->sortable_value == 'new-old') {
                    $products = $products->orderBy('created_at', 'desc')->paginate(6);
                }
                if ($request->sortable_value == 'all') {
                    $products = $products->orderBy('id', 'desc')->paginate(6);
                }

                $filter_array = ['sortable_value' => $request->sortable_value, 'brand_id' => '', 'category_id' => ''];



            return $products;
        }

}
