<?php

namespace App\Http\Controllers\Admin\Shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ForumCategory;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopColor;
use App\Models\ShopVariant;
use Str;

class ShopOptionController extends Controller
{
    public function options()
    {
        return view('admin.shop.options', get_defined_vars());
    }

    public function categoryCreate(Request $req)
    {
        request()->validate([
            'title' => 'required',
        ]);


        $category = ShopCategory::whereTitle($req->title)->count();

        if($category > 0)
        {
            return back()->withError('Whoops! '.$req->title.' category already exist.');
        }

        ShopCategory::create([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Category has been added.');

    }    


    public function categoryUpdate(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'id'   => 'required'
        ]);


        $category = ShopCategory::whereTitle($req->title)->count();

        if($category > 0)
        {
            return back()->withMessage($req->title.' category already exist. No need to update.');
        }




        ShopCategory::find($req->id)->update([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Category has been updated.');

    }




    public function brandCreate(Request $req)
    {

        request()->validate([
            'title' => 'required',
        ]);

        $brand = ShopBrand::whereTitle($req->title)->count();

        if($brand > 0)
        {
            return back()->withError('Whoops! '.$req->title.' brand already exist.');
        }

        ShopBrand::create([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Product Brand has been added.');
    }   





    public function brandUpdate(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'id'   => 'required'
        ]);

        $brand = ShopBrand::whereTitle($req->title)->count();
        if($brand > 0)
        {
            return back()->withMessage($req->title.' brand already exist. No need to update.');
        }

        ShopBrand::find($req->id)->update([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Brand has been updated.');
    }





    public function variantCreate(Request $req)
    {

        request()->validate([
            'title' => 'required',
        ]);

        $variant = ShopVariant::whereTitle($req->title)->count();

        if($variant > 0)
        {
            return back()->withError('Whoops! '.$req->title.' variant already exist.');
        }

        ShopVariant::create(['title' => $req->title]);

        return back()->withMessage('Product Variant has been added.');
    }   


    public function variantUpdate(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'id'   => 'required'
        ]);

        $brand = ShopVariant::whereTitle($req->title)->count();
        if($brand > 0)
        {
            return back()->withMessage($req->title.' Variant already exist. No need to update.');
        }

        ShopVariant::find($req->id)->update(['title' => $req->title]);

        return back()->withMessage('Variant has been updated.');
    }



    public function colorCreate(Request $req)
    {
        request()->validate([
            'title'      => 'required',
            'color_code' => 'required',
        ]);

        $color = ShopColor::whereTitle($req->title)->count();

        if($color > 0)
        {
            return back()->withError('Whoops! '.$req->title.' Color already exist.');
        }

        ShopColor::create(['title' => $req->title, 'color_code' => $req->color_code]);

        return back()->withMessage('Product Color has been added.');
    }   

        public function colorUpdate(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'color_code' => 'required',
        ]);

        $color = ShopColor::whereTitle($req->title)->count();
        if($color > 0)
        {
            return back()->withMessage($req->title.' Color already exist. No need to update.');
        }

        ShopColor::find($req->id)->update(['title' => $req->title, 'color_code' => $req->color_code]);

        return back()->withMessage('Color has been updated.');
    }





    public function optionRemove($model, $id, $column)
    {

        if(checkOptionExistence($column, $id) > 0)
        {
            return back()->withError('Sorry! Cannot delete this time. Its being used in Shop Products.');
        }

        $model = '\\App\\Models\\'.$model;
        $model::find($id)->delete();
        return back()->withMessage('Item has been removed.');

    }


}
