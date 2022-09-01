<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use App\Models\ShopProduct;
use Illuminate\Http\Request;

class CompareProductController extends Controller
{
    public function getCompareProduct(Request $request)
    {
        $product=ShopProduct::whereUuid($request->id)->first();
        $product->img=asset($product->thumbnail);
        return response()->json($product);
    }
}
