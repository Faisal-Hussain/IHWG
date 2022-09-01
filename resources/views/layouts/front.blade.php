<!doctype html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>@yield('title') - Canadian Homeopathy Wellness Group</title>
        <link rel="icon" type="image/png" href="{{ asset($setting['favicon']) }}">
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="csrf-token" content="{{ csrf_token() }}">
        @yield('meta')
        <link rel="canonical" href="{{ url()->current() }}" />
        <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
        <link rel="stylesheet" href="{{ asset('front/assets') }}/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/font-awesome/css/font-awesome.min.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/datatable/datatables.bootstrap4.min.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/datatable/responsive.bootstrap4.min.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/sweetalert/sweetalert.css" />
{{--        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/select2/select2.min.css" />--}}
        <link rel="stylesheet" href="{{ asset('front/assets') }}/dropzone/css/dropzone.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/designer/designer.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/designer/scroll/jquery.mcustomscrollbar.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/ionslider/ion.rangeslider.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/ionslider/ion.rangeslider.skinmodern.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/bootstrap-slider/slider.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/frontend/css/common.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        
        <link rel="stylesheet" href="{{ asset('front/assets') }}/frontend/css/price-range.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/plugins/icheck/square/purple.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/modal/css/modal.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/modal/css/modal-extra.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/slick/slick.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/slick/slick-theme.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/footer/black-crazy/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/header/ice-cream/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/home/customfy/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/blog/crazy/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/product/crazy/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/templates-assets/single-product/crazy/style.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/frontend/css/panel.css">
        <link rel="stylesheet" href="{{ asset('front/assets') }}/frontend/css/styles.css" />
        <link rel="stylesheet" href="{{ asset('front/assets') }}/frontend/css/select.css" />
        <link rel="stylesheet" href="{{ asset('front/assets/css') }}/custom.css">
        <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
        <style type="text/css">
            
            .custom-toast {
                background-color: #ffffff;
                color: #000;
                border: none;
                box-shadow: 0 0.25rem 0.75rem rgb(34 41 47 / 15%);
            }
        </style>

        @yield('css')

    </head>
    <body>

@php 

$last = url()->current();
$split = explode("/", $last);

$text_name=$split[count($split)-1];

$text=$setting['feedback-toast']??'';





@endphp
    <!-- toaster -->

@if($text_name=='contact-us')
    <div class="toast custom-toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="6000" style="position: absolute; z-index:100 ; top: 1rem; right: 1rem;">

        <div class="toast-body" style="font-size: 14px;">
        <div style="display: flex; padding: 5px 8px;"> 
            <i class="fa fa-info-circle" aria-hidden="true" style="background-color:#ffffff; color: black;font-size: 26px; margin-top: 10px;">
            </i>
             <span style="padding: 15px 15px;" class="toast-text">
                {{$text}}
             </span>   
        </div>
        </div>
    </div>
@endif
    
    @yield('content')


<!--FOOTER SECTION-->
<footer id="footer" class="footer-wrapper">
    <div class="footer-top full-width">
        <div class="footer-top-background">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-3">
                        <h3 class="widget-title">Company</h3>
                        <div class="is-divider small"></div>
                        <div class="footer-desc">
                            <ul class="links-list">
                                <li><a  href="{{ route('about.us') }}">About Us</a></li>
                                <li><a  href="{{ route('our.mission') }}">Our Mission</a></li>
                                <li><a  href="{{ route('terms') }}">Terms & Conditions</a></li>
                                <li><a  href="{{ route('privacy.policy') }}">Privacy Policy</a></li>
                                <li><a  href="{{ route('end.user.register') }}">Free Signup</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-3">
                        <h3 class="widget-title">My Account</h3>
                        <div class="is-divider small"></div>
                        <div class="footer-desc">
                            <ul class="links-list">
                                <li><a  href="{{ route('advocates') }}">Advocates</a></li>
                                <li><a  href="{{ route('find.homeopath') }}">Homeopath</a></li>
                                <li><a  href="{{ route('explore.homeopathy') }}">Explore Homeopaths</a></li>
                                <li><a  href="{{ route('contact.us') }}">Contact us</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-2">
                        <h3 class="widget-title">Service</h3>
                        <div class="is-divider small"></div>
                        <div class="footer-desc">
                            <ul class="links-list">
                                <li><a href="{{ route('shop.index') }}">Shop</a></li>
                                <li><a href="{{ route('social.index') }}">Social Community</a></li>
                                <li><a  href="{{ route('find.homeopath') }}">Find a homeopath</a></li>
                                <li><a  href="{{ route('faqs') }}">FAQ</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <h3 class="widget-title">Subscribe to our Newsletter</h3>

                        <form method="post" action="{{route('newsletter.save')}}">
                            @csrf
                            <div class="input-group mb-3 newsletter-subscription">
                              <input type="email" name="email" class="form-control" placeholder="johndoe@gmail.com">

                              <div class="input-group-append">
                                <button class="btn btn-primary" type="submit">Get Started</button>
                              </div>
                                 
                            </div>

                        </form>

                        <p class="mt15">Call us: <strong>{{$setting['phone'] ?? ''}}</strong></p>
                        <div class="is-divider small"></div>
                        <ul class="social-media">
                            <li><a class="facebook" href="{{$setting['facebook'] ?? ''}}" target="_blank"><i class="fa fa-facebook"></i></a></li>
                            <li><a class="twitter" href="{{$setting['twitter'] ?? ''}}" target="_blank" ><i class="fa fa-twitter"></i></a></li>
                            <li><a class="linkedin" href="{{$setting['linkedin'] ?? ''}}" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                            <li><a class="dribbble" href="{{$setting['dribbble'] ?? ''}}" target="_blank"><i class="fa fa-dribbble"></i></a></li>
                            <li><a class="instagram" href="{{$setting['instagram'] ?? ''}}" target="_blank"><i class="fa fa-instagram"></i></a></li>
                            <li><a class="youtube-play" href="{{$setting['youtube'] ?? ''}}" target="_blank"><i class="fa fa-youtube-play"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright full-width bg-dark text-white text-center py-2">
            <small>Copyright © {{ now()->year }} {!! $setting['copyright'] ?? '' !!}</small>
        </div>
    </div>
</footer>
<!--END FOOTER SECTION-->

        <input type="hidden" name="hf_base_url" id="hf_base_url" value="https://www.newpcity.com">
        <input type="hidden" name="cart_url" id="cart_url" value="https://www.newpcity.com/cart">
        <input type="hidden" name="currency_symbol" id="currency_symbol" value="&amp;#36;">
        <div id="shadow-layer"></div>
        <div id="loader-1"></div>
        <div id="loader-2"></div>
        <div id="loader-3"></div>
        <div class="svgs" style="display: none;">
            <svg xmlns="http://www.w3.org/2000/svg">
                <symbol id="icon-close" viewBox="0 0 16.196 16.197">
                <title>Close</title>
            <path d="M15.615,3.07c0.619-0.62,0.77-1.618,0.258-2.329c-0.652-0.906-1.924-0.981-2.679-0.226L8.627,5.084 c-0.292,0.292-0.765,0.292-1.057,0L3.069,0.582c-0.62-0.62-1.617-0.771-2.328-0.258C-0.165,0.976-0.24,2.248,0.516,3.003 l4.567,4.569c0.292,0.292,0.292,0.765,0,1.057l-4.501,4.503c-0.619,0.619-0.771,1.617-0.259,2.328 c0.652,0.902,1.924,0.976,2.679,0.226l4.568-4.569c0.291-0.291,0.765-0.291,1.057,0l4.501,4.503 c0.619,0.626,1.616,0.772,2.327,0.259c0.906-0.652,0.981-1.924,0.227-2.68l-4.568-4.569c-0.291-.292-0.291-0.765,0-1.057 L15.615,3.07z"></path>
            </symbol>
        </svg>
    </div>
    <div class="shopist-modal" id="quick_view_modal">
        <div class="modal__window">
            <button class="modal__close-btn" type="button" data-close-modal>
            <svg class="modal__close-icon">
                <use xlink:href="#icon-close"></use>
            </svg>
            </button>
            <div class="modal__content"></div>
        </div>
    </div>    <div class="svgs" style="display: none;">
    <svg xmlns="http://www.w3.org/2000/svg">
        <symbol id="icon-close" viewBox="0 0 16.196 16.197">
        <title>Close</title>
    <path d="M15.615,3.07c0.619-0.62,0.77-1.618,0.258-2.329c-0.652-0.906-1.924-0.981-2.679-0.226L8.627,5.084 c-0.292,0.292-0.765,0.292-1.057,0L3.069,0.582c-0.62-0.62-1.617-0.771-2.328-0.258C-0.165,0.976-0.24,2.248,0.516,3.003 l4.567,4.569c0.292,0.292,0.292,0.765,0,1.057l-4.501,4.503c-0.619,0.619-0.771,1.617-0.259,2.328 c0.652,0.902,1.924,0.976,2.679,0.226l4.568-4.569c0.291-0.291,0.765-0.291,1.057,0l4.501,4.503 c0.619,0.626,1.616,0.772,2.327,0.259c0.906-0.652,0.981-1.924,0.227-2.68l-4.568-4.569c-0.291-.292-0.291-0.765,0-1.057 L15.615,3.07z"></path>
    </symbol>
</svg>
</div>
<div class="shopist-modal" id="subscriptions_modal" style="width:100px;">
<div class="modal__window">
    <button class="modal__close-btn" type="button" data-close-modal>
    <svg class="modal__close-icon">
        <use xlink:href="#icon-close"></use>
    </svg>
    </button>
    <div class="modal__content">
        <div class="subscribe-content"></div>
        <div class="subscribe-options">
            <input type="text" id="subscribe_options_name"  placeholder="Enter your name" />
            <input type="text" id="subscribe_options_email"  placeholder="Enter your email" />
            <button type="button" id="subscribtion_submit">Subscribe Now</button>
        </div>
        <div class="popup-cookie-set">
            <a href="#" class="set-popup-cookie">No thanks, i am not interested!</a>
        </div>
    </div>
</div>
</div>
<div class="add-to-cart-loader">
<img src="{{ asset('front/assets') }}/images/ajax-loader.gif" id="img-load" />
<div class="cart-updating-msg">Wait - Your Cart Updating...</div>
</div>
</div>
<input type="hidden" name="lang_code" id="lang_code" value="en">
<input type="hidden" name="subscription_type" id="subscription_type" value="mailchimp">




        <!--DONATION BAR HTML-->
            @auth
                @include('front.components.donation_bar')
            @endauth
            @include('auth.registration_modal')
        <!--END DONATION BAR HTML-->


        <script type="text/javascript" src="{{ asset('front/assets') }}/jquery/jquery-1.10.2.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/jquery/jquery-ui-1.11.4.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/dropzone/dropzone.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/bootstrap/js/popper.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/datatable/jquery.datatables.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/datatable/datatables.bootstrap4.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/datatable/datatables.responsive.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/datatable/responsive.bootstrap4.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/jquery.scrollup.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/sweetalert/sweetalert.min.js"></script>
{{--        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/select2/select2.full.min.js"></script>--}}
        <script type="text/javascript" src="{{ asset('front/assets') }}/designer/colorpicker/jscolor.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/designer/scroll/jquery.mcustomscrollbar.concat.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/ionslider/ion.rangeslider.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/products-variation.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/products-add-to-cart.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/price-range.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/plugins/icheck/icheck.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/modal/js/modal.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/jquery.validate.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/footer/black-crazy/script.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/header/ice-cream/script.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/home/customfy/script.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/blog/crazy/script.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/product/crazy/script.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/single-product/crazy/script.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/templates-assets/single-product/crazy/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/common.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/frontend/js/social-network.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/slick/slick.min.js"></script>
        <script type="text/javascript" src="{{ asset('front/assets') }}/common/base64.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.2/jquery.validate.min.js"></script>
        <script type="text/javascript" src="{{ asset('js/jquery-ui.js') }}"></script>
        <script type="text/javascript" src="https://www.google.com/jsapi"></script>
        <script src="{{ asset('admin/js/map_autocomplete.js') }}"></script>
        <script src="{{ asset('front/assets/js/custom.js') }}"></script>
        
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>



    <script type="text/javascript">
        $(document).ready(function(){
            
            
            setTimeout(function() {
                
                $('.toast').hide();
              }, 7000);
        });
        $(document).on('click','#homeopath-register-btn',function(){
            window.location.href="{{route('register.homeopath')}}"
        })
        
    </script>

        <script type="application/javascript">

            $(function () {
              $('[data-toggle="popover"]').popover()
            })


        jQuery('.left-panel .demo-panel-trigger').on("click", function(e) {
        jQuery('.left-panel').toggleClass('demo-panel-open');
        });
        jQuery('.right-panel .demo-panel-trigger').on("click", function(e) {
        jQuery('.right-panel').toggleClass('demo-panel-open');
        });
        </script>

          <script>
              toastr.options.positionClass = 'toast-bottom-right';
              @if(session('message'))
              toastr.success("{{ session('message') }}");
              @elseif(session('error'))
              toastr.error("{{ session('error') }}");
          @endif



      </script>
    <!-- add-to-cart product script -->
    <script>

    $(document).on('click','.add-to-cart',function (e){
    e.preventDefault()
    var id =$(this).data('id');
    add_to_cart(id)

    })
    $(document).on('click','.modal-add-to-cart',function (e){
    e.preventDefault()
    var id =$(this).data('id');
    add_to_cart(id)
    $('.quick-show-modal').modal('hide')

    })

    function add_to_cart(id)
    {
        var qty=$('#single-product-qty').val();
        if (qty)
        {
        }else{
            qty=1
        }
    var url="{{route('shop.cart.add',":id")}}"
    url=url.replace(':id',id)
    $.ajax({
    method:'get',
    url:url,
    data:{qty:qty},
    success:function (data){
        console.log(data)
    if (data){
    toastr.success('Item has been Added to cart Successfully')
    $('.mini-cart-content .cart-container').html('')
    $('.mini-cart-content .cart-container').html(data)
    getCartQuantity();

    }else {
    toastr.error('Product Not Found')
    }
    }
    })
    }

    </script>

    <!-- cart update delete script-->
    <script>

    $(document).on('click','.delete-cart-item',function (e){
        e.preventDefault()
        var thiss=$(this)
        var rowid=$(this).attr('data-rowId');
        var url="{{route('shop.cart.destroy',":id")}}"
        url=url.replace(':id',rowid)
        $.ajax({
            method: 'get',
            url:url,
            success:function (data)
            {
                thiss.closest('tr').css('background-color','pink')
                thiss.closest('tr').fadeOut(300)
                $('.mini-cart-content .cart-container').html('')
                $('.mini-cart-content  .cart-container').html(data)
                toastr.success('Item remove successfully')
                    getCartQuantity();

            }
        })
    })

    $(document).on('change','.item-qty',function (e){
        e.preventDefault()
        var rowid=$(this).closest('tr').find('.row-id').val();
        var qty=$(this).val();
        var url="{{route('shop.cart.update',":id")}}"
        url=url.replace(':id',rowid)
        $.ajax({
            method: 'get',
            url:url,
            data:{qty:qty},
            success:function (data)
            {

                $('.mini-cart-content .cart-container').html('');
                $('.mini-cart-content .cart-container').html(data);
                    getCartQuantity();


            }
        })
    })

    </script>


    <!-- wish list script start!-->

    <script>

        $(document).on('click','.cart-product-wishlist',function (){
            var thiss=$(this)
            var id=$(this).data('id')
            var url="{{route('shop.wish.list.add',":id")}}"
            url=url.replace(':id',id)
            $.ajax({
                method:'get',
                url:url,
                success:function (data)
                {
                    console.log(data)
                    if (data)
                    {
                        if (data=='not login')
                        {
                            toastr.info('Please first Login ')
                            window.location.href='/login'
                        }if (data=='delete')
                        {
                            toastr.error('item remove from wishlist')
                            thiss.toggleClass('text-danger')
                            thiss.toggleClass('text-white')
                            // thiss.closest('.single-product-add-to-cart').find('.fa-heart').toggleClass('text-danger')
                        }if (data.id) {
                        thiss.toggleClass('text-danger')
                        thiss.toggleClass('text-white')
                        // thiss.closest('.single-product-add-to-cart').find('.fa-heart').toggleClass('text-danger')
                            toastr.success('Item has been Added to Wishlist')
                        }
                    }
                }
            })
        })

    </script>


    <!-- wish list script end!-->


    <!-- filter product script start!-->
    <script>
        $(document).on('click','#reset_btn',function (){
                $('.filter-panel .filter-checkbox').each(function (){
                   $(this).prop('checked',false);
                   window.location.href('{{ route('shop.index') }}');
                });

            $(this).css('color','white')
        });

        $(document).on('change','.filter',function (e){
            $('#show-products-row .bg-transparent').toggleClass('p-loader')
            filterRecord()
        })
        function filterRecord()
        {
            var perameter=getUrlVars()
            var perameterVal=getUrlVarsVal()
            var url=$('#dropdown-filter-form').attr('action')
            $.ajax({
                method:'get',
                url:url,
                data:$('#dropdown-filter-form').serialize()+ "&parameter="+perameter +"&per_val="+perameterVal,
                success:function (data)
                {
                    $('#show-products-row .bg-transparent').toggleClass('p-loader')
                    $('#show-products-row').html('')
                    $('#show-products-row').html(data)
                }
            })
        }
        function getUrlVarsVal()
        {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('=') + 1).split('&');
            for(var i = 0; i < hashes.length; i++)
            {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }function getUrlVars()
        {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for(var i = 0; i < hashes.length; i++)
            {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }

        $(document).on('click','#reset_btn',function (e){
            e.preventDefault()
            $('.shopist-iCheck').each(function (){
                $(this).closest('.icheckbox_square-purple').attr('aria-checked',false)

            })
            filterRecord();

        })
        $(document).on('submit','#filter-options-form',function (e){
            e.preventDefault()
            var perameter=getUrlVars()
            var perameterVal=getUrlVarsVal()

            $('#show-products-row .bg-transparent').toggleClass('p-loader')
            var url=$(this).attr('action')
                $('.filter-form-submit-btn').attr('disabled',true)
            $.ajax({
                method:'get',
                url:url,
                data:$(this).serialize()+ "&parameter="+perameter +"&per_val="+perameterVal,
                success:function (data)
                {
                    $('#show-products-row .bg-transparent').toggleClass('p-loader')
                    $('#show-products-row').html('')
                    $('#show-products-row').html(data)
                    $('.filter-form-submit-btn').attr('disabled',false)

                }
            })

        })


    function showMyCart()
    {
        $.ajax({
            url: '{{ route('shop.my.cart') }}',
            type: 'GET',
            success: function (response) {
                $('.shopping-cart').html(response);
                $('#cartModalPopup').modal('show');
            }
        });
    }



    function getCartQuantity()
    {
        $.ajax({
            url: '{{ route('shop.cart.get.quantity') }}',
                    type: 'GET',
                    success: function (response) {
                        
                        $('.mini-cart-content .nav-link #cart-total').text(response);

                    }
                });
    }
    </script>
    <!-- filter product script end!-->
    <script>

$(document).on('click', '.shopping-cart .close', function() {

    $id = $(this).data('id');

     $.ajax({
                    url: '{{ route('shop.cart.remove.item') }}',
                    type: 'GET',
                    data: {id: $id},
                    success: function (response) {
                        $('.shopping-cart').html(response);
                        toastr.success('Item has been removed');
                        getCartQuantity();
                    }
                });

})


$(document).on('change keyup', '.quantity-input', function() {

    $id = $(this).data('id');
    $qty = $(this).val();

         $.ajax({
                    url: '{{ route('shop.cart.update.item.quantity') }}',
                    type: 'GET',
                    data: {id: $id, qty:$qty},
                    success: function (response) {
                        $('.shopping-cart').html(response);
                        toastr.success('Cart has been updated.');
                        getCartQuantity();
                    }
                });

})

</script>
    <!-- compare product script start!-->
    <script>
        $(document).on('click','.product-compare',function (){

            $(".select2").select2({
                dropdownParent: $(".bd-compare-product-modal-lg .modal-content")
            });
            var id=$(this).data('id')
            var img=$(this).data('img')
            var title=$(this).data('title')
            var price=$(this).data('price')

            $('.select-product-card .select-product-img').attr('src',img)
            $('.select-product-card .select-product-name').val(title)
            $('.select-product-card .select-product-price').text('$'+price)
            $('.select-product-card .select_product_add_to_cart_btn').attr('data-id',id)
        })
        $(document).on('change','.select-comparewith-product',function (){
             var id=$(this).val()
            var url="{{route('shop.compare.product')}}?id="+id
            $.ajax({
                url:url,
                type: 'GET',
                success: function (response) {
                    console.log(response.img)
                    $('.compare-product-card .rating').removeClass('d-none')
                    $('.compare-product-card .no-rating').addClass('d-none')

                    $('.compare-product-card .compare-product-img').attr('src',response.img)
                    $('.compare-product-card .compare-product-name').text(response.title)
                    $('.compare-product-card .compare-product-price').text('$'+response.amount)
                    $('.compare-product-card .compare_product_add_to_cart_btn').attr('data-id',response.uuid)
                }
            });
        })
    </script>
    <!-- compare product script end!-->

    <script>
        $(document).on('change', '.radioSelectRole', function() {

            if($("input[name='role']:checked").val() == 'advocate')
            {
                window.location.href = '{{ route('register') }}';
            }
        })



jQuery(document).ready(function($) {
   var bsDefaults = {
         offset: false,
         overlay: true,
         width: '330px'
      },
      bsMain = $('.bs-offset-main'),
      bsOverlay = $('.bs-canvas-overlay');

   $('[data-toggle="canvas"][aria-expanded="false"]').on('click', function() {
      var canvas = $(this).data('target'),
         opts = $.extend({}, bsDefaults, $(canvas).data()),
         prop = $(canvas).hasClass('bs-canvas-right') ? 'margin-right' : 'margin-left';

      if (opts.width === '100%')
         opts.offset = false;

      $(canvas).css('width', opts.width);
      if (opts.offset && bsMain.length)
         bsMain.css(prop, opts.width);

      $(canvas + ' .bs-canvas-close').attr('aria-expanded', "true");
      $('[data-toggle="canvas"][data-target="' + canvas + '"]').attr('aria-expanded', "true");
      if (opts.overlay && bsOverlay.length)
         bsOverlay.addClass('show');
      return false;
   });

   $('.bs-canvas-close, .bs-canvas-overlay').on('click', function() {
      var canvas, aria;
      if ($(this).hasClass('bs-canvas-close')) {
         canvas = $(this).closest('.bs-canvas');
         aria = $(this).add($('[data-toggle="canvas"][data-target="#' + canvas.attr('id') + '"]'));
         if (bsMain.length)
            bsMain.css(($(canvas).hasClass('bs-canvas-right') ? 'margin-right' : 'margin-left'), '');
      } else {
         canvas = $('.bs-canvas');
         aria = $('.bs-canvas-close, [data-toggle="canvas"]');
         if (bsMain.length)
            bsMain.css({
               'margin-left': '',
               'margin-right': ''
            });
      }
      canvas.css('width', '');
      aria.attr('aria-expanded', "false");
      if (bsOverlay.length)
         bsOverlay.removeClass('show');
      return false;
   });
});

// $( document ).ready(function() 
// {
//         $('.toast').toast('show');
// });

    </script>

@yield('js')
</body>
</html>
