<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ShopProduct;

class ShopController extends Controller
{
    public function index()
    {

        $products = ShopProduct::with('wishlist')->orderBy('id','desc')->paginate(6);
        
        return view('admin.shop.index', get_defined_vars());
    }

    public function productCreate()
    {
        return view('admin.shop.add-edit', get_defined_vars());
    }

    public function productDetail($id)
    {
        $product = ShopProduct::findOrFail($id);
        return view('admin.shop.product_detail', get_defined_vars());

    }

    public function productupdate($id)
    {
        $product = ShopProduct::findOrFail($id);
        return view('admin.shop.add-edit', get_defined_vars());

    }


    public function productStore(Request $req)
    {

         $req->validate([
            'title' => 'required',
            'shop_category_id' => 'required',
            'shop_brand_id' => 'required',
            'shop_variant_id' => 'required',
            'shop_color_id' => 'required',
            'description' => 'required',
            'type' => 'required',
            'tags' => 'required',
            'amount' => 'required',
            'stock_quantity' => 'required',
            'thumbnail' => 'required|mimes:jpg,jpeg,png,bmp,tiff|max:20000',
        ]);

        $file = uploadImage($req->thumbnail, 'uploads/products');
        ShopProduct::create($req->except(['thumbnail']) + ['thumbnail' => $file, 'uuid' => date('dmyhis')]);
        return redirect()->route('admin.shop.index')->with('message', 'Product has been added into stock.');

    }


    public function productEdit(Request $req, $id)
    {

         $req->validate([
            'title' => 'required',
            'shop_category_id' => 'required',
            'shop_brand_id' => 'required',
            'shop_variant_id' => 'required',
            'shop_color_id' => 'required',
            'description' => 'required',
            'type' => 'required',
            'tags' => 'required',
            'amount' => 'required',
            'stock_quantity' => 'required',
        ]);


        $product = ShopProduct::findOrFail($id);

        if($req->thumbnail)
        {

            $req->validate([
                'thumbnail' => 'required|mimes:jpg,jpeg,png,bmp,tiff|max:20000',
            ]);

            $file = uploadImage($req->thumbnail, 'uploads/products');
        }


        $product->update($req->except(['thumbnail']));
        $product->update(['thumbnail' => $file ?? $product->thumbnail]);

        return redirect()->route('admin.shop.index')->with('message', 'Product has been updated.');

    }




    public function productremove($id)
    {
        ShopProduct::find($id)->delete();
        return redirect()->route('admin.shop.index')->with('message', 'Product has been removed from stock.');
    }


}
