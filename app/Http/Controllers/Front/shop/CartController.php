<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function add(Request $request,$id)
    {
        $product=ShopProduct::where('uuid',$id)->first();
        Cart::instance('shopping')->add($product->uuid,$product->title,$request->qty,$product->amount,0, ['image' => $product->thumbnail??'']);
        $total=Cart::instance('shopping')->total();
        $cart = Cart::instance('shopping')->content();

        return view('front.shop.ajax.cart',get_defined_vars());

    }

    public function updateItem(Request $request,$rowid)
    {
        Cart::instance('shopping')->update($rowid,$request->qty);
        $total=Cart::instance('shopping')->total();
        $cart = Cart::instance('shopping')->content();
        return view('front.shop.ajax.cart',get_defined_vars());
    }

    public function destroyItem($rowid)
    {
        Cart::instance('shopping')->remove($rowid);
        $total=Cart::instance('shopping')->total();
        $cart = Cart::instance('shopping')->content();
        return view('front.shop.ajax.cart',get_defined_vars());

    }

    public function checkout()
    {
        if(count(Cart::instance('shopping')->content()) == 0)
        {
            return back()->withError('Your cart is empty.');
        }


        return view('front.shop.checkout',get_defined_vars());
    }


    public function removeItem(Request $req)
    {
        Cart::instance('shopping')->remove($req->id);

        return view('front.shop.ajax.checkout_page');
    }

    public function updateItemQuantity(Request $req)
    {

        Cart::instance('shopping')->update($req->id,$req->qty);
        return view('front.shop.ajax.checkout_page');
    }



    public function getCartQuantity()
    {
        Cart::instance('shopping');
        return response()->json(count(Cart::content()));

    }

    public function myCart()
    {
        return view('front.shop.ajax.checkout_page');
    }




}
