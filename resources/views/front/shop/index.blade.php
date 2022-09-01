@extends('layouts.front')
@section('css')
    <style xmlns="http://www.w3.org/1999/html">
        .carousel-img{
            object-fit: cover;
            width: 100% !important;
            height: 75vh;
        }
        .show-able-img{
            object-fit: cover;
            width: 100% !important;
            height: 30vh;
        }
        .p-loader{
            display: none;
            width: 20%;
            height: 10vh;
            background-color: transparent!important;
        }

        .compare-product-container .card {
            width: 250px;
            border-radius: 0px;
        }

        .compare-product-container .card-img-top {
            border-top-right-radius: 10px;
            border-top-left-radius: 10px;
            object-fit: cover;
            width: 100% !important;
            height: 30vh;
        }

        .compare-product-container span.text-muted {
            font-size: 12px
        }

        .compare-product-container small.text-muted {
            font-size: 8px
        }

        .compare-product-container h5.mb-0 {
            font-size: 1rem
        }

        .compare-product-container small.ghj {
            font-size: 9px
        }

        .compare-product-container .mid {
            background: #ECEDF1
        }

        .compare-product-container h6.ml-1 {
            font-size: 13px
        }

        .compare-product-container small.key {
            text-decoration: underline;
            font-size: 9px;
            cursor: pointer
        }

        .compare-product-container .btn-danger {
            color: #FFCBD2
        }
        .rating .checked {
            color: orange;
        }



    </style>
@endsection
@section('title', 'Shop')
@section('content')


@include('front.components.pages_banner', ['heading' => 'Shop at CHWG', 'description' => 'We are committed to change the climate of Homeopathy in Canada for the better. We simply ask for
                            any amount of your aid.'])

    <section class="content">

        <div id="shop_page" class="mt-4">

            <div class="pageContent">
                <section class="content">
                    <div class="container">
                        <div class="row">
                            <div id="productLeftColumn" class="col-xs-12 col-md-3">
                                <div class="left-column-content">

                                    <div class="product-categories-list">
                                        <div class="product-categories-accordian">
                                            <h2>Categories <span class="responsive-accordian"></span></h2>

                                            <div class="category">
                                                <ul class="products-categories list-unstyled">
                                                    <li class="product-parent-categories">

                                                        <a href="{{route('shop.index')}}">All</a>
                                                    </li>
                                                    @foreach(shopOptions()['shop_categories'] as $category)
                                                        <li class="product-parent-categories">

                                                            <a href="{{route('shop.index')}}?category={{$category->slug}}">{{ ucfirst($category->title) }}</a>
                                                        </li>
                                                    @endforeach

                                                </ul>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tags-product-list ">
                                        <h2>Popular Tags <span class="responsive-accordian"></span></h2>
                                        <div class="tag-list">
                                            <ul>
                                                <form id="filter-tags-form" method="get" action="{{route('shop.product.filter')}}">
                                                    <input type="hidden" name="tags_value" value="yes">
                                                    @foreach($products as $item)
                                                        @if($loop->iteration > 5) @break @endif

                                                        @foreach(commaSeparatedString($item->tags) as $tag)
                                                            <li>
                                                                <a href="{{route('shop.index')}}?tag={{$tag}}" class="btn btn-sm bg-default text-white rounded-0"><i class="fa angle-right"></i> {{ ucfirst($tag) }}</a>
                                                            </li>
                                                        @endforeach

                                                    @endforeach
                                                </form>
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="product-categories-accordian" style="margin-top:1.9rem;">
                                        <h2>Brands <span class="responsive-accordian"></span></h2>

                                        <div class="category">
                                            <ul class="products-categories list-unstyled">
                                                <li>
                                                    <a href="{{route('shop.index')}}">All</a>
                                                </li>
                                                @foreach(shopOptions()['shop_brands'] as $brand)
                                                    <li class="product-parent-categories">
                                                        <a href="{{route('shop.index')}}?brand={{$brand->slug}}">{{ ucfirst($brand->title) }}</a>
                                                    </li>
                                                @endforeach

                                            </ul>
                                        </div>
                                    </div>


                                    <div class="filter-panel">
                                        <form id="filter-options-form" action="{{route('shop.product.filter')}}" method="get">
                                            <input type="hidden" name="filter_options" value="filter_options">





                                            <div class="price-filter">
                                                <h2>Price Range <span class="responsive-accordian"></span></h2>
                                                <div class="row mt-4 p-2">
                                                    <div class="col-sm-12">
                                                        <div id="slider-range"></div>
                                                    </div>
                                                </div>
                                                <div class=" font-weight-bold range-input">
                                                    <input type="text" name="min_value" readonly="" value="{{ $products->min('amount') }}" id="slider-range-value1">
                                                    <input type="text" name="max_value" class="float-right text-right" readonly="" value="{{ $products->max('amount') }}" id="slider-range-value2">
                                                </div>
                                            </div>









                                            <div class="colors-filter">
                                                <h2>Select Colors <span class="responsive-accordian"></span></h2>
                                                <div class="colors-filter-option">
                                                    @foreach(shopOptions()['shop_colors'] as $item)
                                                        <div class="filter-form-group">
                                                            <input name="colors[]" type="checkbox" class="filter-checkbox chk-colors-filter" value="{{ $item->id }}" id="{{ $item->title }}">
                                                            <label for="{{ $item->title }}">{{ ucfirst($item->title) }}</label>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>

                                            <div class="size-filter">
                                                <h2>Select Sizes <span class="responsive-accordian"></span></h2>
                                                <div class="size-filter-option">
                                                    @foreach(shopOptions()['shop_variants'] as $item)

                                                        <div class="filter-form-group">
                                                            <input name="varients[]" type="checkbox" class="filter-checkbox  chk-size-filter" value="{{ $item->id }}" id="{{ $item->title }}">
                                                            <label for="{{ $item->title }}">{{ ucfirst($item->title) }}</label>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            </div>

                                            <div class="btn-filter clearfix">
                                                <button class="btn btn-sm filter-form-submit-btn" type="submit"><i class="fa fa-filter" aria-hidden="true"></i> Filter</button>
                                                <a class="btn btn-sm bg-danger" href="" id="reset_btn"><i class="fa fa-close" aria-hidden="true"></i> Reset</a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div id="productCenterColumn" class="col-xs-12 col-md-9">


                                <div class="products-list-top clearfix">
                                    <div class="row">
                                        <div class="col-lg-6 m-auto">
                                            <h4 class="pt-2">My Products</h4>
                                        </div>
                                        <div class="col-lg-6">
                                            <div class="sort-filter-option">
                                                <form id="dropdown-filter-form" method="get" action="{{route('shop.product.filter')}}">
                                                    <select name="sortable_value" class="form-control select2 filter" style="width:100%;">
                                                        <option value="all">All</option>

                                                        <option @if($filter_array['sortable_value']=='alpaz') selected @endif value="alpaz">Alphabetically, A-Z</option>

                                                        <option @if($filter_array['sortable_value']=='alpza') selected @endif value="alpza">Alphabetically, Z-A</option>

                                                        <option @if($filter_array['sortable_value']=='low-high') selected @endif value="low-high">Price,High to Low</option>

                                                        <option @if($filter_array['sortable_value']=='high-low') selected @endif value="high-low">Price, Low to Heigh</option>

                                                        <option @if($filter_array['sortable_value']=='old-new') selected @endif value="old-new">Date, Old to New</option>

                                                        <option @if($filter_array['sortable_value']=='new-old') selected @endif value="new-old">Date, New to Old</option>
                                                    </select>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                </div>

                                <div class="products-list">
                                    <div class="product-content clearfix">
                                        <div class="row" id="show-products-row">
                                            <div class="p-loader bg-transparent text-center">
                                                <img src="{{asset('front/assets/p-loader.gif')}}" width="80%">
                                            </div>
                                            @include('front.shop.ajax.products')
                                        </div>

                                        <div class="products-pagination">
                                            {{ $products->onEachSide(5)->links() }}
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br><br>

                            <div class="product-page-bottom">
                                <div class="row">


                                    <div class="col-xs-12 col-md-6 product-bottom-bg mb-3">
                                        <div class="product-page-latest">
                                            <h2 class="text-center title-under">Best Seller</h2><br>
                                            <div id="product-page-best-seller" class="carousel slide" data-ride="carousel">
                                                <div class="carousel-inner">


                                                    @foreach($best_sellers as $item)
                                                        <div class="carousel-item @if($loop->first) active @endif">
                                                            <div class="product-content">
                                                                <div class="image-content text-center">
                                                                    <img src="{{ asset($item->thumbnail) }}" alt="{{ $item->title }}" />
                                                                </div>
                                                                <div class="product-details">
                                                                    <p>{{ $item->title }}</p>
                                                                    <p><strong>&#36;{{ $item->amount }}</strong></p>
                                                                    <a href="{{ route('shop.product.detail', ['id' => $item->uuid, 'slug' => $item->slug ]) }}" class="btn btn-sm btn-style">View Detail</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach


                                                </div>
                                                <div class="slider-control-main text-center">
                                                    <div class="prev-btn">
                                                        <a href="#product-page-best-seller" class="control-carousel" data-slide="prev">
                                                            <i class="fa fa-angle-left"></i>
                                                        </a>
                                                    </div>
                                                    <div class="next-btn">
                                                        <a href="#product-page-best-seller" class="control-carousel" data-slide="next">
                                                            <i class="fa fa-angle-right"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6 product-bottom-bg mb-3">
                                        <div class="product-page-latest">
                                            <h2 class="text-center title-under">New arrival</h2><br>
                                            <div id="product-page-new-arrival" class="carousel slide" data-ride="carousel">
                                                <div class="carousel-inner">


                                                    @foreach($new_arrivals as $item)
                                                        <div class="carousel-item @if($loop->first) active @endif">
                                                            <div class="product-content">
                                                                <div class="image-content text-center">
                                                                    <img src="{{ asset($item->thumbnail) }}" alt="{{ $item->title }}" />
                                                                </div>
                                                                <div class="product-details">
                                                                    <p>{{ $item->title }}</p>
                                                                    <p><strong>&#36;{{ $item->amount }}</strong></p>
                                                                    <a href="{{ route('shop.product.detail', ['id' => $item->uuid, 'slug' => $item->slug ]) }}" class="btn btn-sm btn-style">View Detail</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endforeach


                                                </div>
                                                <div class="slider-control-main text-center">
                                                    <div class="prev-btn">
                                                        <a href="#product-page-new-arrival" class="control-carousel" data-slide="prev">
                                                            <i class="fa fa-angle-left"></i>
                                                        </a>
                                                    </div>
                                                    <div class="next-btn">
                                                        <a href="#product-page-new-arrival" class="control-carousel" data-slide="next">
                                                            <i class="fa fa-angle-right"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <div class="modal fade quick-show-modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title ml-auto" id="exampleModalCenterTitle">Modal title</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body quick-view-modal-body">

                                <div class="container">
                                    <div class="row">
                                        <input type="hidden" name="id" value="" class="show-able-product-id">
                                        <div class="col-md-5 border-right">
                                            <img name="img" class="show-able-img " src="">
                                        </div>
                                        <div class="col-md-7">
                                            <h5 class="quick-show-product-price">Price : <span class="text-primary"></span></h5>
                                            <p class="pt-3 quick-show-product-detail"></p>
                                        </div>
                                        <div class="col-md-12 text-right">
                                            <button type="button" data-id=""  class="btn btn-outline-success modal-add-to-cart">Add To Cart</button>
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>

                <!-- compare product  modal -->
                <div class="modal fade bd-compare-product-modal-lg" id="bd-compare-product-modal-lg"  role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true"  style="overflow:hidden;">
                    <div class="modal-dialog modal-lg modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Compare Product</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="container-fluid d-flex justify-content-center compare-product-container">
                                    <div class="row">
                                        <div class="col-sm-6 select-product-card">
                                            <input type="text" readonly value="Product Name" class="select-product-name form-control text-center p-1">
                                            <div class="card"> <img src="http://127.0.0.1:8000/uploads/products/pointing.png" class="card-img-top select-product-img" width="100%">
                                                <div class="card-body pt-0 px-0">

                                                    <div class="d-flex flex-row justify-content-center mt-2">
                                                        <h6 class="rating">
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star"></span>
                                                        </h6>

                                                    </div>
                                                    <div class="d-flex flex-row justify-content-between px-5 ">
                                                        <div class="d-flex flex-column"><span class="text-muted ">Price</span></div>
                                                        <div class="d-flex flex-column">
                                                            <h5 class="mb-0 select-product-price">$0.00</h5>
                                                        </div>

                                                    </div>

                                                    <div class="mx-3 mt-3 mb-2"><button type="button" data-id="" class="btn btn-outline-danger btn-block select_product_add_to_cart_btn add-to-cart"><small>Add To Cart</small></button></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mt-2">
                                            <select id="select-comparewith-product" class="select2 select-comparewith-product form-control w-100">
                                                <option value="">Select Product</option>
                                                @foreach($products as $item)
                                                    <option value="{{$item->uuid}}">{{$item->title}}</option>
                                                @endforeach
                                            </select>
                                            <div class="card compare-product-card"> <img src="http://127.0.0.1:8000/uploads/products/pointing.png" class="card-img-top compare-product-img" width="100%">
                                                <div class="card-body pt-0 px-0">
                                                    <div class="d-flex flex-row justify-content-center mt-2">
                                                        <h6 class="no-rating">
                                                            <span class="fa fa-star "></span>
                                                            <span class="fa fa-star "></span>
                                                            <span class="fa fa-star "></span>
                                                            <span class="fa fa-star "></span>
                                                            <span class="fa fa-star"></span>
                                                        </h6>
                                                        <h6 class="rating d-none">
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star checked"></span>
                                                            <span class="fa fa-star"></span>
                                                        </h6>
                                                    </div>
                                                    <div class="d-flex flex-row justify-content-between px-5 ">
                                                        <div class="d-flex flex-column"><span class="text-muted ">Price</span></div>
                                                        <div class="d-flex flex-column">
                                                            <h5 class="mb-0 compare-product-price">$0.00</h5>
                                                        </div>

                                                    </div>
                                                    <div class="mx-3 mt-3 mb-2"><button type="button" data-id="" class="btn btn-outline-danger btn-block compare_product_add_to_cart_btn add-to-cart"><small>Add To Cart</small></button></div>
                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                @endsection



                @section('js')
                    <script src="{{ asset('front/assets/js/range-slider.js') }}"></script>
                    <script>

                        $(document).on('click','.product-details-view',function (){
                            var img_src=$(this).closest('.hover-product').find('.hover .product-img').attr('src')
                            var product_title=$(this).closest('.hover-product').find('.single-product-bottom-section .product-title').text()
                            var product_price=$(this).closest('.hover-product').find('.single-product-bottom-section .product-price').text()
                            var product_detail=$(this).closest('.hover-product').find('.single-product-bottom-section .product-detail').val()
                            var id = $(this).attr('data-id');
                            $('.quick-view-modal-body .show-able-img').attr('src',img_src)
                            $('.quick-view-modal-body .show-able-product-id').val(id)
                            $('#exampleModalCenterTitle').text(product_title)
                            $('.quick-view-modal-body .quick-show-product-price span').text(product_price)
                            $('.quick-view-modal-body .quick-show-product-detail').text(product_detail)
                            $('.modal-add-to-cart').attr('data-id',id)

                        })



                    </script>

@endsection
