@extends('layouts.front')
@section('title', 'Login')
@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/account.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
            <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="inner">
                        <h2>{{ env('APP_NAME') }} User Registration</h2>
                        <p>Provide your correct credentials to register free at CHWG</p>
                        <p class="cmp-button-row non-mobile-only">
                        <div class="right-box">
                            <div class="screenshot"></div>
                        </div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--END HEADER-->



<section class="content mb-5" id="login">
    <div class="container custom-extra-top-style">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row justify-content-center mt-3">
                            <div class="col-xs-12 text-center">
                                <h3>Register your free Account</h3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                        <x-auth-validation-errors class="mb-4 text-left text-danger" :errors="$errors" />
                        <form method="post" action="{{ route('user.register') }}">
                            @csrf
                            <input type="hidden" name="role" value="user">
                            <div class="form-group has-feedback">
                                <input name="name" id="name" tabindex="1" class="form-control" placeholder="Name*" type="name" required="">
                                <span class="fa fa-user form-control-feedback"></span>
                            </div>
                            <div class="form-group has-feedback">
                                <input name="email" id="email" tabindex="1" class="form-control" placeholder="Email address*" type="email" required="">
                                <span class="fa fa-user form-control-feedback"></span>
                            </div>

                            <div class="form-group has-feedback">
                                <input name="password" id="password" tabindex="2" class="form-control" placeholder="Password*" type="password" required="">
                                <span class="fa fa-lock form-control-feedback"></span>
                            </div>
                            <div class="form-group">
                                <div class="row justify-content-center">
                                    <div class="col-sm-6 text-center">
                                        <button type="submit" class="form-control btn btn-secondary">Register my account</button>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="text-center">
                                            <a href="{{ route('login') }}" tabindex="5" class="register-new-user">I already have an account</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




@endsection
@section('js')

@endsection
