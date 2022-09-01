<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ShopOrderProduct extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function shopOrderProduct()
    {
        return $this->belongsTo('App\Models\ShopProduct', 'shop_product_id');
    }

    
}
