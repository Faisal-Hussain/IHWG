@if(count($products)>0)
    @foreach($products as $item)
        <div class="col-xs-12 col-sm-12 col-md-4 grid-view">

            <div class="hover-product">
                <div class="hover">
                    <img  class="product-img"  src="{{ asset($item->thumbnail) }}" alt="{{ $item->title }}" />

                    <div class="overlay">
                        <button type="button" class="info quick-view-popup product-details-view" data-id="{{$item->uuid}}" data-toggle="modal" data-target=".quick-show-modal">Quick View</button>
                    </div>
                </div>
                <div class="single-product-bottom-section">
                    <a style="text-decoration:none;color: black;" href="{{route('shop.product.detail',['id' => $item->uuid, 'slug' => $item->slug])}}"><h3 class="product-title mt-2 font-weight-bold">{{ $item->title }}</h3></a>
                    <h3 class="product-price font-weight-bold text-success">&#36;{{ $item->amount }}</h3>
                    <input type="hidden" class="product-detail" value="{{$item->description}}">
                    

                    <div class="title-divider"></div>
                    <div class="single-product-add-to-cart">
                        <button type="submit" data-id="{{$item->uuid}}" class="btn btn-sm btn-style bg-success add-to-cart" data-toggle="tooltip" data-placement="top" title="Add to Cart"><i class="fa fa-shopping-cart"></i></button>
                        @if(Auth::id() && count($item->wishlist)>0)
                            @foreach($item->wishlist as $list)
                                @if($list->shop_product_id==$item->id)
                                    <button type="button" class="btn btn-sm btn-style cart-product-wishlist text-danger" data-id="{{$item->uuid}}" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><i class="fa fa-heart "></i></button>
                                @endif
                                @break
                            @endforeach
                        @else
                            <button type="button" class="btn btn-sm btn-style cart-product-wishlist text-white" data-id="{{$item->uuid}}" data-toggle="tooltip" data-placement="top" title="Add to Wishlist"><i class="fa fa-heart"></i></button>

                        @endif
                        <a href="#" class="btn btn-sm btn-style product-compare bg-warning" data-toggle="modal" data-id="{{$item->uuid}}" data-img="{{asset($item->thumbnail)}}" data-title="{{$item->title}}" data-price="{{$item->amount}}" data-target=".bd-compare-product-modal-lg" data-placement="top" title="Add to Compare List"><i class="fa fa-exchange"></i></a>
                        <a href="{{route('shop.product.detail',['id' => $item->uuid, 'slug' => $item->slug])}}"  class="btn btn-sm btn-style bg-info" data-placement="top" title="Product Details"  data-id="{{$item->id}}"><i class="fa fa-eye"></i></a>
                    </div>
                </div>
            </div>

        </div>
    @endforeach
@else
    <h4 class="ml-5">No Product Found</h4>
@endif



