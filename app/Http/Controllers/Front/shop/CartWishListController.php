<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use App\Models\CartWishList;
use App\Models\ShopProduct;
use Illuminate\Http\Request;
use Auth;


class CartWishListController extends Controller
{
    public function addToList($id)
    {

            $product= ShopProduct::whereUuid($id)->first();

            $list = CartWishList::whereShopProductId($product->id)->whereUserId(Auth::id())->first();


            if ($list)
            {
                $list->delete();
                return response()->json('delete');
            }
            else
            {
                $list=CartWishList::create([
                    'user_id'         => Auth::id(),
                    'shop_product_id' => $product->id
                ]);
            }

        return response()->json($list);
    }
}
