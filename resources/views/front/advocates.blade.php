@extends('layouts.front')
@section('title', $setting['advocates_title'] ?? '')

@section('meta')
    <meta name="keywords" content="{{$setting['about_keywords'] ?? ''}}">
    <meta name="description" content="{{$setting['about_description'] ?? ''}}">
@endsection
@section('css')
<style type="text/css">


</style>
@endsection
@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/vancouver.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
            <div class="banner-box2" style="height: 493px !important;">
                <div class="container">
                    <div class="row align-center">
                        <div class="col-md-6">
                            <div class="hero__copy">
                                <h1 class="text-capitalize">{{$setting['advocates_keywords'] ?? ''}}</h1>
                                <p>{{$setting['advocates_description'] ?? ''}}</p>
                                <p>Interested in IHWG for Homeopaths? </p>
                                <p class="cmp-button-row non-mobile-only">
                                    <a href="{{ route('find.homeopath') }}" class="btn btn-primary  text-white">Start Your Subscription Today</a>
                                </p>
                                <p class="cmp-button-row non-mobile-only" style="font-size:15px; line-height:1.2em"><span
                                    style="font-family:proxima-n-w01-reg,sans-serif;"><span style="letter-spacing:0em"><span
                                        style="font-size:15px"><span class="color_20">Or </span>
                                        <a href="#" data-toggle="modal" data-target="#modalRegistration">
                                            <span style="color:#008AFC"><span style="font-weight:bold">sign-up
                                            now</span></span></a>
                                            <span class="color_20"> for a free trial.</span>
                                        </span>
                                    </span>
                                </span>
                            </p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="right-box">
                            <div class="">
                                <img src="{{ asset($setting['advocates_banner_image'] ?? '')  }}" alt="">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</header>
<!--END HEADER-->
<!--MAIN CONTENT SECTION-->
<section class="content">
<!-- second section -->
<div class="container mt-5 pb-5 ">
    <div class="row ">
        <div class="col-md-2 ">
        </div>
        <div class="col-md-8 ">
            <section id="comp-kp4dmpkp " class="JSM9k ">
                <div id="bgLayers_comp-kp4dmpkp " class="X-jRX ">
                    <div data-testid="colorUnderlay " class="mlsxv _22Lsw "></div>
                    <div id="bgMedia_comp-kp4dmpkp " class="_1J6n9 "></div>
                </div>
                <div data-testid="columns " class="_2EoGw ">
                    <div id="comp-kp4dmpks " class="_31Ne5 ">
                        <div id="bgLayers_comp-kp4dmpks " class="X-jRX ">
                            <div data-testid="colorUnderlay " class="mlsxv _22Lsw "></div>
                            <div id="bgMedia_comp-kp4dmpks " class="_1J6n9 "></div>
                        </div>
                        <div data-mesh-id="comp-kp4dmpksinlineContent " data-testid="inline-content" class=" ">
                            <div data-mesh-id="comp-kp4dmpksinlineContent-gridContainer " data-testid="mesh-container-content ">
                                <div id="comp-kp4dmpku " class="_2bafp " data-testid="richTextElement ">
                                    <p class="font_7 " aria-colspan="socail-text ">
                                        <p class="social-text1 text-center ">
                                            <span class="color-3 ">
                                                <span class="socail-text-3">
                                                    <span class="socail-text-2">
                                                        {{$setting['advocates_body_heading'] ?? ''}}
                                                    </span>
                                                </span>
                                            </span>
                                        </p>
                                    </div>
                                    <div id="comp-kp4dmpkw" class="_2bafp " data-testid="richTextElement">
                                        <p class="font_7 "><span class="socail-text-5 ">
                                            <span class="font-1 ">
                                                <span class="color_20">
                                                    {{$setting['advocates_body_description'] ?? ''}}
                                                </span>
                                            </span>
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <div class="col-md-2">
        </div>
    </div>
</div>
<!-- end -->
<!-- third section -->
<div id="comp-kp4dmpla " class="_2bafp   bg-caro " data-testid="richTextElement ">
    <br />
    <p class=" font_7 ">
        <span class="color-3 ">
            <span class="font-2 "><span style="font-weight:bold "><span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_section_1_title'] ?? ''}}  </span></span>
        </span>
    </span>
    <span class="color-4 ">
        <span class="font-2 ">
            <span style="font-weight:bold ">
                <span style="font-family:poppins-semibold,poppins,sans-serif" class="animation_text" id="information">information >
                </span>
            </span>
        </span>
    </span>
</p>
<p class="font_7">
    <span class="font-3 ">
        <span class="font-4 ">
            <span class="color_20 ">{{$setting['advocates_section_1_description'] ?? ''}}</span></span>
        </span>
    </p>
    <br />
    <div class="container">
        <div class="row pb-5 ">
            <div class="col-md-6 ">
                <div id="adv__sec__1_left_slider" class="carousel slide w-75 mx-auto " data-ride="carousel">
                    <ol class="carousel-indicators ">
                        <li data-target="#adv__sec__1_left_slider " data-slide-to="0 " class="active "></li>
                        <li data-target="#adv__sec__1_left_slider " data-slide-to="1 "></li>
                        <li data-target="#adv__sec__1_left_slider " data-slide-to="2 "></li>
                    </ol>
                    <div class="carousel-inner ">
                        <div class="carousel-item active ">
                            <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_left_image_1'] ?? '')  }}">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_left_image_2'] ?? '')  }}">
                        </div>
                        <div class="carousel-item ">
                            <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_left_image_3'] ?? '')  }}">
                        </div>
                    </div>
                </div>
                <div style="margin-top:30px">
                    <div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
                        <p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
                            <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_1_slider_left_heading'] ?? ''}}</span></span>
                    </span>
                </span>
            </p>
<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_1_slider_left_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 ">

    <div id="adv__sec__1_right_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__1_right_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__1_right_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__1_right_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_right_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_right_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_1_slider_right_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>


    <div style="margin-top:30px">
    <div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
    <p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
        <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_1_slider_right_heading'] ?? ''}}</span></span>
    </span>
    </span>
    </p>
    <br />
    <div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
    <p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
        <span class="color_20 ">{{$setting['advocates_sec_1_slider_right_description'] ?? ''}}</span></span>
    </span>
    </p>
    </div>
    </div>
    </div>
</div>
</div>
</div>
<!-- end -->
</div>
<!-- third section -->
<div id="comp-kp4dmpla " class="_2bafp   " data-testid="richTextElement">
<br />
<p class="font_7">
<span class="color-3">
<span class="font-2 "><span style="font-weight:bold "><span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_section_2_title'] ?? 'Information and exciting'}}</span></span>
</span>
</span>
<span class="color-5">
<span class="font-2">
<span style="font-weight:bold">
<span style="font-family:poppins-semibold,poppins,sans-serif" class="animation_text" id="seminars"> seminars >
</span>
</span>
</span>
</span>
</p>
<p class="font_7">
<span class="font-3 ">
<span class="font-4">
<span class="color_20 ">{{$setting['advocates_section_2_description'] ?? ''}}</span></span>
</span>
</p>
<br />
<div class="container">
<div class="row pb-5">
<div class="col-md-6 ">


    <div id="adv__sec__2_left_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__2_left_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__2_left_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__2_left_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_left_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_left_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_left_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>




<div style="margin-top:30px">
<div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_2_slider_left_heading'] ?? ''}} </span></span>
</span>
</span>
</p>
<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_2_slider_left_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
<div class="col-md-6 ">

    <div id="adv__sec__2_right_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__2_right_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__2_right_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__2_right_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_right_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_right_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_2_slider_right_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>


<div style="margin-top:30px">
<div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_2_slider_right_heading'] ?? ''}}</span></span>
</span>
</span>
</p>
<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_2_slider_right_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
<!-- fourth section -->
<div id="comp-kp4dmpla " class="_2bafp   bg-caro " data-testid="richTextElement ">
<br />
<p class=" font_7 ">
<span class="color-3">
<span class="font-2"><span style="font-weight:bold "><span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_section_3_title'] ?? ''}} </span></span>
</span>
</span>
<span class="color-1">
<span class="font-2 ">
<span style="font-weight:bold ">
<span style="font-family:poppins-semibold,poppins,sans-serif" class="animation_text" id="contribute">contribute >
</span>
</span>
</span>
</span>
</p>
<p class="font_7">
<span class="font-3">
<span class="font-4">
<span class="color_20 ">
    {{$setting['advocates_section_3_description'] ?? ''}}
</span></span>
</span>
</p>
<br />
<div class="container">
<div class="row pb-5">
<div class="col-md-6 ">


    <div id="adv__sec__3_left_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__3_left_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__3_left_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__3_left_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_left_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_left_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_left_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>



<div style="margin-top:30px">
<div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_3_slider_left_heading'] ?? ''}}</span></span>
</span>
</span>
</p>

<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_3_slider_left_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
<div class="col-md-6">

    <div id="adv__sec__3_right_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__3_right_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__3_right_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__3_right_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_right_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_right_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_3_slider_right_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>


<div style="margin-top:30px">
<div id=" comp-kp46srqp " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_3_slider_right_heading'] ?? ''}}</span></span>
</span>
</span>
</p>

<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_3_slider_right_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
</div>
<!-- third section -->
<div id="comp-kp4dmpla " class="_2bafp  " data-testid="richTextElement">
<br />
<p class="font_7">
<span class="color-3">
<span class="font-2 "><span style="font-weight:bold "><span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_section_4_title'] ?? ''}}</span></span>
</span>
</span>
<span class="color-6">
<span class="font-2 ">
<span style="font-weight:bold ">
<span style="font-family:poppins-semibold,poppins,sans-serif" class="animation_text" id="updated"> updated >
</span>
</span>
</span>
</span>
</p>
<p class="font_7">
<span class="font-3 ">
<span class="font-4 ">
<span class="color_20 ">{{$setting['advocates_section_4_description'] ?? ''}}</span></span>
</span>
</p>
<br />
<div class="container">
<div class="row">
<div class="col-md-6">


    <div id="adv__sec__4_left_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__4_left_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__4_left_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__4_left_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_left_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_left_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_left_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>


<div style="margin-top:30px">
<div id=" comp-kp46srqp" class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px "><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_4_slider_left_heading'] ?? ''}}
</span></span>
</span>
</span>
</p>

<br />
<div id="comp-kp46szjn " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20 ">{{$setting['advocates_sec_4_slider_left_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
<div class="col-md-6">

    <div id="adv__sec__4_right_slider" class="carousel slide w-75 m-auto" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#adv__sec__4_right_slider" data-slide-to="0" class="active"></li>
          <li data-target="#adv__sec__4_right_slider" data-slide-to="1"></li>
          <li data-target="#adv__sec__4_right_slider" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_right_image_1'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_right_image_2'] ?? '')  }}">
            </div>
            <div class="carousel-item ">
                <img class="d-block w-100 " src="{{ asset($setting['advocates_sec_4_slider_right_image_3'] ?? '')  }}">
            </div>
        </div>

      </div>


<div style="margin-top:30px">
<div id=" comp-kp46srqp " class="_2bafp" data-testid="richTextElement ">
<p class="font_7 " style="font-size:20px"><span style="font-size:20px "><span style="color:#414141 "><span style="font-weight:bold ">
    <span style="font-family:poppins-semibold,poppins,sans-serif ">{{$setting['advocates_sec_4_slider_right_heading'] ?? ''}}
</span></span>
</span>
</span>
</p>

<br />
<div id="comp-kp46szjn" class="_2bafp " data-testid="richTextElement ">
<p class="font_7 " style="font-size:12px "><span style="font-size:12px "><span style="font-family:proxima-n-w01-reg,sans-serif ">
    <span class="color_20">{{$setting['advocates_sec_4_slider_right_description'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
</div>
<!-- bottom section -->
<div class="bg-caro ">
<div class=" container mt-5">
<div class="row">
<div class="col-md-6">
<div class="text-center ">
<img src="{{ asset($setting['adv_test_avatar'] ?? '')  }}" alt="image " class="rounded-image mt-4 mb-4 " />
</div>
</div>
<div class="col-md-6 mt-5">
<div id="comp-kp4dmpp8 " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 font-3 "><span class="bold-1 ">
<span class="font-1 "><span class="font-3 ">
<span class="color_20 ">
"{{$setting['adv_test_desription'] ?? ''}}"</span></span>
</span>
</span>
</p>
</div>
<div id="comp-kp4dmpp91" class="_2bafp" data-testid="richTextElement">
<p class="font_7 font_8 text-left">
<span class="color-5">
<span class="font-11 ">{{$setting['adv_test_name'] ?? ''}}</span></span>
</p>
</div>
<div id="comp-kp4dmppc " class="_2bafp " data-testid="richTextElement ">
<p class="font_7 size-11 text-left">
<span class="color_22 ">
<span class="size-11">
<span class="font-11">{{$setting['adv_test_designation'] ?? ''}}</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
</div>


@include('front.components.work_with_us')



</section>
@endsection
@section('js')
<script type="text/javascript">

    (function(){
      var words = [
          'organized >',
          'specific >',
          'gorgeous >',
          'interactive >'
          ], i = 0;
      setInterval(function(){
          $('#updated').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);

  })();
  (function(){
      var words = [
          'Clue >',
          'Instruction >',
          'Knowledge >',
          'Message >'
          ], i = 0;
      setInterval(function(){
          $('#information').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);

  })();
  (function(){
      var words = [
          'Devote >',
          'Grant >',
          'Pony Up >',
          'Share >'
          ], i = 0;
      setInterval(function(){
          $('#contribute').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);

  })();
  (function(){
      var words = [
          'Convention >',
          'Discussion >',
          'Forum >',
          'Meeting >'
          ], i = 0;
      setInterval(function(){
          $('#seminars').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);

  })();

</script>
@endsection
