@extends('layouts.front')
@section('css')
    <style xmlns="http://www.w3.org/1999/html">
        .carousel-img {
            object-fit: cover;
            width: 100% !important;
            height: 75vh;
        }

        .show-able-img {
            object-fit: cover;
            width: 100% !important;
            height: 30vh;
        }

        .p-loader {
            display: none;
            width: 20%;
            height: 10vh;
            background-color: transparent !important;
        }

        .compare-product-container .card {
            width: 250px;
            border-radius: 0px
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

    <header>
        <div class="wrapper">
            <div id="header_content"
                 style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/about-us.jpg) no-repeat 50% center;background-size: cover;">
                @include('front.components.navbar')

            </div>
        </div>
    </header>
    <!--END HEADER-->

    <section class="content">

        <div id="shop_page" class="mt-4">

            <div class="pageContent">
                <section class="product-detail-section">
                    <div class="container mb-5">
                        <div class="product-detail-view">
                            <div class="card product-detail-card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6 p-0 m-0 border-right">
                                            <img src="{{asset($product->thumbnail)}}" class="zoom-image w-100 bg-transparent product-detail-card-img show-product-img" width="100">
                                        </div>
                                        <div class="col-md-6">

                                            <div class="row">
                                                <div class="col-md-6 ">
                                                    <h3 class="text-left">{{ucfirst($product->title)}}</h3>
                                                    <small class="text-center mr-auto"><span class="badge badge-success">{{ucfirst($product->shopCategory->title)}}</span></small>
                                                    <small class="text-center ml-auto"><span class="badge badge-info">{{ucfirst($product->shopBrand->title)}}</span></small>
                                                    <h4 class="mt-3 text-left">Price: <span class="text-success">${{$product->amount}}</span></h4>
                                                    <h4 class="mt-3 text-left">Varient: <span class="text-success">{{$product->shopVariant->title??''}}</span></h4>
                                                </div>
                                                <div class="col-md-6 mt-2 text-right">
                                                    <span class="badge badge-primary p-2">{{$product->type??'New'}}</span>
                                                    <div class="add-to-cart-btn-div pt-4">
                                                        <input type="button" data-id="{{$product->uuid}}" value="Add to cart" class="form-control btn-outline-success add-to-cart mt-4 cursor-pointer">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-4">
                                                <div class="col-md-12">
                                                    <label><h3>Product Detail:</h3></label>
                                                    <p class="text-justify">{{$product->description}}</p>
                                                </div>

                                            </div>

                                            <div class="row mt-3 tags-row">
                                                <label class="ml-2">TAGS:</label>
                                                <div class="col-md-12 tags-div">
                                                    @foreach(commaSeparatedString($product->tags) as $tag)

                                                        <a href="{{route('shop.index')}}?tag={{$tag}}" class="btn btn-sm bg-default rounded-0"><i class="fa fa-angle-right"></i> {{ ucfirst($tag) }}</a>

                                                    @endforeach
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <hr>
                        </div>
                    </div>
                </section>
                <section class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12 col-lg-12 col-md-12 col-sm-12">
                                <h2>Related Products <span class="responsive-accordian1"></span></h2>
                            </div>
                            <div id="productCenterColumn" class="col-xs-12 col-md-12">


                                <div class="products-list">
                                    <div class="product-content clearfix">
                                        <div class="row" id="show-products-row">
                                            @include('front.shop.ajax.products')
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>

                <div class="modal fade quick-show-modal"  role="dialog" aria-labelledby="myLargeModalLabel"
                     aria-hidden="true">
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
                                            <h5 class="quick-show-product-price">Price : <span
                                                    class="text-primary"></span></h5>
                                            <p class="pt-3 quick-show-product-detail"></p>
                                        </div>
                                        <div class="col-md-12 text-right">
                                            <button type="button" data-id=""
                                                    class="btn btn-outline-success modal-add-to-cart">Add To Cart
                                            </button>
                                        </div>
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>
                </div>

                <!-- compare product  modal -->
                <div class="modal fade bd-compare-product-modal-lg"  role="dialog"
                     aria-labelledby="myLargeModalLabel" aria-hidden="true" style="overflow: hidden">
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
                                            <div class="card"><img
                                                    src="http://127.0.0.1:8000/uploads/products/pointing.png"
                                                    class="card-img-top select-product-img" width="100%">
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
                                                        <div class="d-flex flex-column"><span
                                                                class="text-muted ">Price</span></div>
                                                        <div class="d-flex flex-column">
                                                            <h5 class="mb-0 select-product-price">$0.00</h5>
                                                        </div>

                                                    </div>

                                                    <div class="mx-3 mt-3 mb-2">
                                                        <button type="button" data-id=""
                                                                class="btn btn-outline-danger btn-block select_product_add_to_cart_btn add-to-cart">
                                                            <small>Add To Cart</small></button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-6 mt-2">
                                            <select class="select2 select-comparewith-product form-control">
                                                <option value="">Select Product</option>
                                                @foreach($products_all as $item)
                                                        <option value="{{$item->uuid}}">{{$item->title}}</option>
                                                @endforeach
                                            </select>
                                            <div class="card compare-product-card"><img
                                                    src="http://127.0.0.1:8000/uploads/products/pointing.png"
                                                    class="card-img-top compare-product-img" width="100%">
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
                                                        <div class="d-flex flex-column"><span
                                                                class="text-muted ">Price</span></div>
                                                        <div class="d-flex flex-column">
                                                            <h5 class="mb-0 compare-product-price">$0.00</h5>
                                                        </div>

                                                    </div>
                                                    <div class="mx-3 mt-3 mb-2">
                                                        <button type="button" data-id=""
                                                                class="btn btn-outline-danger btn-block compare_product_add_to_cart_btn add-to-cart">
                                                            <small>Add To Cart</small></button>
                                                    </div>
                                                </div>
                                            </div>
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
                    $(".select2").select2({
                        dropdownParent: $(".bd-compare-product-modal-lg .modal-content")
                    });
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
