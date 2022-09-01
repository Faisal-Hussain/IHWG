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
                        <p></p>
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
            <div class="col-md-12 text-center">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row justify-content-center mt-3">
                            <div class="col-xs-12 text-center">
                                <h3>Verify your Account</h3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                                    <div class=" alert alert-warning text-dark ">
                                                <x-slot name="logo">
                                            <!-- <a href="/">
                                                <x-application-logo class="w-20 h-20 fill-current text-gray-500" />
                                            </a> -->
                                                </x-slot>

                                        <div class="mb-4 text-sm text-gray-600">
                                            {{ __('Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.') }}
                                        </div>

                                        @if (session('status') == 'verification-link-sent')
                                            <div class="mb-4 font-medium text-sm text-green-600">
                                                {{ __('A new verification link has been sent to the email address you provided during registration.') }}
                                            </div>
                                        @endif

                                        <div class="mt-4 flex items-center justify-between">
                                            <form method="POST" action="{{ route('verification.send') }}">
                                                @csrf

                                                <div class="btn-group">
                                                    <button type="submit" class="btn btn-primary btn-lg btn-block">Resend Verification Email</button>
                                                </div>
                                            </form>

                                        </div>
                                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




@endsection
@section('js')

@endsection



































