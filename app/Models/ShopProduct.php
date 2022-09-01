<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;

class ShopProduct extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function wishlist()
    {
        return $this->hasMany(CartWishList::class, 'shop_product_id');
    }

    public function shopBrand()
    {
        return $this->belongsTo('App\Models\ShopBrand');
    }
    public function shopCategory()
    {
        return $this->belongsTo('App\Models\ShopCategory');
    }
    public function shopColor()
    {
        return $this->belongsTo('App\Models\ShopColor');
    }
    public function shopVariant()
    {
        return $this->belongsTo('App\Models\ShopVariant');
    }


}
