@extends('layouts.front')
@section('title', $setting['terms_title'] ?? '')

@section('meta')
    <meta name="keywords" content="{{$setting['terms_keywords'] ?? ''}}">
    <meta name="description" content="{{$setting['terms_description'] ?? ''}}">
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
                        <h2 class="text-dark">{{$setting['terms_title'] ?? ''}}</h2>
                        <p>{{$setting['terms_description'] ?? ''}}</p>
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
                <p>{!! $setting['terms_body'] ?? '' !!}</p>
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