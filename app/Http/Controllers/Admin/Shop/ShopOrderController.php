<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ShopOrder;
use App\Models\ShopProduct;

class ShopOrderController extends Controller
{
    public function orders(Request $req)
    {

        $orders_count = ShopOrder::groupBy('status')
                        ->selectRaw('count(*) as total, status')
                        ->get();

        $orders = ShopOrder::orderBy('id', 'DESC');

        if($req->status)
        {
            $orders = $orders->where('status', $req->status);
        }

        $orders = $orders->get();

        return view('admin.shop.orders.orders', get_defined_vars());

    }

    public function order($id)
    {
        $order = ShopOrder::with(['orderProducts', 'user'])->findOrFail($id);

        return view('admin.shop.orders.order', get_defined_vars());
    }

    public function orderUpdateStatus($id, Request $req)
    {

        $order = ShopOrder::with('orderProducts')->findOrFail($id);
        $products = $order->orderProducts;

        if($req->status == 'shipped')
        {
            foreach($products as $product)
            {
                $item = ShopProduct::findOrFail($product->shop_product_id);
                $item->stock_quantity = $item->stock_quantity - $product->quantity;
                $item->save();
            }
        }

        $order->update(['status' => $req->status]);

        return back()->withMessage('Your order status has been updated to '. $req->status);

    }

}
 