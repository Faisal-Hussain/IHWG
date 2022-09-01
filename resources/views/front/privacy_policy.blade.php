@extends('layouts.front')
@section('title', $setting['privacy_title'] ?? '')

@section('meta')
    <meta name="keywords" content="{{$setting['privacy_keywords'] ?? ''}}">
    <meta name="description" content="{{$setting['privacy_description'] ?? ''}}">
@endsection

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')

            <!--PAGE BANNER-->
            <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="">
                        <h2 class="text-dark">{{$setting['privacy_title'] ?? ''}}</h2>
                        <p>{{$setting['privacy_description'] ?? ''}}</p>
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

<!--MAIN CONTENT SECTION-->
<section class="content">
    <div id="custom_single_page">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 py-5">
                <p>{!! $setting['privacy_body'] ?? '' !!}</p>
                </div>
            </div>
        </div>
        <div class="banner-bottom  text-center">
            <div class="inner">
                <h2>{{$setting['pages_bottom_heading'] ?? 'Join the CHWG Today'}}</h2>
            </div>
        </div>
    </div>
</section>


@endsection



@section('js')
    
@endsection