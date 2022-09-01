@extends('layouts.admin')
@section('title','Product Management')
@section('heading','Product Management')
@section('css')
<style>

</style>
@endsection
@section('content')
<div class="row">


        <div class="col-sm-12">
            <div class="card">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body card-dashboard">

                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <strong>Whoops!</strong> There were some problems with your input.<br><br>
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if((isset($product)))
                                <form action="{{ route('admin.shop.product.edit',$product->id) }}" method="POST" enctype="multipart/form-data">
                            @else
                                <form action="{{ route('admin.shop.store') }}" method="POST" enctype="multipart/form-data">
                            @endif
                            @csrf
                            <div class="row">
                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Title</label>
                                        <input type="text" class="form-control" name="title" placeholder="Title" value="{{ $product->title ?? old('title') }}" required>
                                    </fieldset>
                                </div>
                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Slug</label>
                                        <input type="text" class="form-control" name="slug" placeholder="Slug" value="{{ $product->slug ?? old('slug') }}" required>
                                    </fieldset>
                                </div>


                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Category</label>
                                        <select class="form-control" name="shop_category_id">
                                            @if(isset($product->shop_category_id))
                                                <option value="{{ $product->shop_category_id }}" hidden>{{ ucfirst($product->shopCategory->title) }}</option>
                                            @endif
                                            @foreach(shopOptions()['shop_categories'] as $item)
                                                <option value="{{ $item->id }}">{{ ucfirst($item->title) }}</option>
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Brand</label>
                                        <select class="form-control" name="shop_brand_id">
                                            @if(isset($product->shop_brand_id))
                                                <option value="{{ $product->shop_brand_id }}" hidden>{{ ucfirst($product->shopBrand->title) }}</option>
                                            @endif
                                            @foreach(shopOptions()['shop_brands'] as $item)
                                                <option value="{{ $item->id }}">{{ ucfirst($item->title) }}</option>
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>
                                
                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Variant</label>
                                        <select class="form-control" name="shop_variant_id">
                                            @if(isset($product->shop_variant_id))
                                                <option value="{{ $product->shop_variant_id }}" hidden>{{ ucfirst($product->shopVariant->title) }}</option>
                                            @endif
                                            @foreach(shopOptions()['shop_variants'] as $item)
                                                <option value="{{ $item->id }}">{{ ucfirst($item->title) }}</option>
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>
                                
                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Color</label>
                                        <select class="form-control" name="shop_color_id">
                                            @if(isset($product->shop_color_id))
                                                <option value="{{ $product->shop_color_id }}" hidden>{{ ucfirst($product->shopColor->title) }}</option>
                                            @endif
                                            @foreach(shopOptions()['shop_colors'] as $item)
                                                <option value="{{ $item->id }}">{{ ucfirst($item->title) }}</option>
                                            @endforeach
                                        </select>
                                    </fieldset>
                                </div>
                                
                                
                                

                                
                                
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="">Description</label>
                                        <textarea name="description" class="form-control" id="description">{!! $product->description ?? old('description') !!}</textarea>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="basicInput">Thumbnail</label>
                                    <input type="file" class="dropify" name="thumbnail" data-default-file="@if(isset($product->thumbnail)){{ asset($product->thumbnail) ?? '' }}@endif">
                                </div>


                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Type</label>
                                        <select class="form-control" name="type" required>
                                            @if(isset($product->type))
                                            <option value="{{ $product->type }}" hidden>{{ $product->type }}</option>
                                            @endif
                                            <option value="New Arrival">New Arrival</option>
                                            <option value="Popular">Popular</option>
                                            <option value="Best Seller">Best Seller</option>
                                            <option value="Favorire">Favorire</option>
                                            <option value="Discounted">Discounted</option>
                                            <option value="Promoted">Promoted</option>
                                            <option value="Top Rated">Top Rated</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </fieldset>
                                </div>

                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Tags (Comma separated)</label>
                                        <input type="text" class="form-control" placeholder="nature, wallpaper, health" name="tags" required value="{{ $product->tags ?? old('tags') }} ">
                                    </fieldset>
                                </div>


                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Price</label>
                                        <input type="text" class="form-control" name="amount" placeholder="Price" value="{{ $product->amount ?? old('amount') }}" required>
                                    </fieldset>
                                </div>



                                <div class="col-xl-6 col-md-6 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Stock Available Quantity</label>
                                        <input type="text" class="form-control" placeholder="10" name="stock_quantity" required value="{{ $product->stock_quantity ?? old('stock_quantity') }} ">
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-2 col-12 mb-1">
                                    <fieldset class="form-group pull-right">
                                        <button class="btn btn-relief-primary" type="submit">Save Product</button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
@endsection
@section('js')


<script>
    $('[name="title"]').keyup(function(){
        var str = $(this).val(); 
        $('[name="slug"]').val(str.replace(/\s+/g, '-').toLowerCase());    
    });
    
</script>

@endsection
