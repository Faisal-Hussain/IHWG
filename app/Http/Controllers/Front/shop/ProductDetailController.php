<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class ProductDetailController extends Controller
{

    public function productDetail($id,$slug)
    {
        $product=ShopProduct::where('uuid',$id)->first();
        $products=ShopProduct::where('shop_category_id',$product->shop_category_id)
            ->where('id','!=',$product->id)->get();
        $products_all=ShopProduct::all();
        $cart = Cart::instance('shopping')->content();
        $total=Cart::instance('shopping')->total();
        return view('front.shop.product-detail',get_defined_vars());
    }
}
