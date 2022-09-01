

<div class="mobile-navbar">
    <div class="clearfix">
        <div class="float-left">
            <a href="{{ route('index') }}"><img style="width: 120px;" src="{{ asset($setting['logo']) ?? ''}}" title="{{ env('APP_NAME') }}" alt="{{ env('APP_NAME') }}"></a>
        </div>
        <div class="float-right">
            <button class="btn btn-dark mr-2" data-toggle="canvas" data-target="#bs-canvas-left" aria-expanded="false" aria-controls="bs-canvas-left">&#9776;</button>
        </div>
    </div>
</div>




    <div id="bs-canvas-left" class="bs-canvas bs-canvas-anim bs-canvas-left position-fixed bg-light h-100">
        <header class="bs-canvas-header p-3 bg-success">
            <h4 class="d-inline-block text-light mb-0">CHWG</h4>
            <button type="button" class="bs-canvas-close close" aria-label="Close"><span aria-hidden="true" class="text-light">&times;</span></button>
        </header>
        <div class="bs-canvas-content">
            <div class="list-group">
              <a href="{{ route('index') }}" class="list-group-item">Home</a>
              <a href="{{ route('about.us') }}" class="list-group-item">About US</a>
              <a href="{{ route('our.mission') }}" class="list-group-item">our mission</a>
              <a href="{{ route('explore.homeopathy') }}" class="list-group-item">explore homeopathy</a>
              <a href="{{ route('find.homeopath') }}" class="list-group-item">find a homeopath</a>
              <a href="{{ route('shop.index') }}" class="list-group-item">Shop</a>

                <h6 class="mt-3 mb-1 ml-2">Shopping Cart</h6>
              <a href="#" class="list-group-item cursor-pointer" onclick="showMyCart()">
                    My Cart
                    <sup class="badge badge-dark p-1 cart-total" id="cart-total">{{count(Cart::instance('shopping')->content())}}</sup>
                </a>
                <h6 class="mt-3 mb-1 ml-2">Account</h6>

              @auth
                <a class="list-group-item" href="{{ route('redirect.dashboard') }}">Dashboard</a>
                <a class="list-group-item" href="{{ route('logout') }}">Logout</a>
              @else
                <a class="list-group-item" target="" href="{{ route('login') }}">Login</a>
                <a class="list-group-item" href="#" data-toggle="modal" data-target="#modalRegistration">Subscription</a>

              @endauth


            </div>


        </div>
    </div>





<!--MAIN NAVBAR-->

<div class="header-content-bottom-all desktop-navbar">
    <div class="header-content-middle ">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="logo text-left mt-3">
                        <a href="{{ route('index') }}"><img src="{{ asset($setting['logo']) ?? ''}}" title="{{ env('APP_NAME') }}" alt="{{ env('APP_NAME') }}"></a>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="header-content-menu">
                        <div id="sticky_nav">
                            <nav class="navbar navbar-expand-lg navbar-dark nav-main" id="navbar">
                                <div class="container-sticky">
                                    <a class="navbar-brand" href="{{ route('index') }}">
                                        <img src="{{asset($setting['favicon']) ?? ''}}" style="width:40px" alt=""  class="logo-rotate">
                                    </a>
                                    <div class="collapse navbar-collapse mt-2" id="navbarSupportedContent">
                                        <ul class="navbar-nav nav-list-main">
                                            <li class="nav-item"><a href="{{ route('about.us') }}" class="nav-link">About US</a></li>
                                            <li class="nav-item"><a href="{{ route('our.mission') }}" class="nav-link">Our Mission</a></li>
                                            <li class="nav-item"><a href="{{ route('explore.homeopathy') }}" class="nav-link">Explore Homeopathy</a></li>
                                            <li class="nav-item"><a href="{{ route('find.homeopath') }}" class="nav-link">Find a homeopath</a></li>
                                            <li class="nav-item"><a href="{{ route('shop.index') }}" class="nav-link">Shop</a></li>

                                            <li class="nav-item dropdown">
                                                <a href="#" class="nav-link" data-toggle="dropdown" data-hover="dropdown">My Account</a>
                                                <div class="new-dropdown-menu dropdown-content my-account-menu">
                                                    @auth
                                                        <a href="{{ route('redirect.dashboard') }}">Dashboard</a>
                                                        <a href="{{ route('logout') }}">Logout</a>
                                                    @else
                                                        <a target="" href="{{ route('login') }}">Login</a>
                                                        <a href="#" data-toggle="modal" data-target="#modalRegistration">Subscription</a>
                                                    @endauth
                                                </div>
                                            </li>
                                            <li class="mini-cart-content nav-item">
                                                <a class="nav-link cursor-pointer" onclick="showMyCart()">
                                                        <span class="fa fa-shopping-cart"></span>
                                                        <sup class="badge badge-dark p-1 cart-total" id="cart-total">{{count(Cart::instance('shopping')->content())}}</sup></a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>




<div class="modal fade" style="background-color:rgba(0, 0, 0, 0.9);" id="cartModalPopup" tabindex="-1" role="dialog" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" style="max-width:90%" role="document">
    <div class="modal-content p-0" style="background:transparent;">
        <section class="shopping-cart">
            @include('front.shop.ajax.checkout_page')
        </section>
        <div class="text-center mt-2">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            <a href="{{ route('shop.checkout') }}" class="btn btn-success">Go to Checkout</a>
        </div>

    </div>
  </div>
</div>
