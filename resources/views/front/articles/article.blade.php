@extends('layouts.front')
@section('title', $article->title)

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')
                        <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="col-8 offset-2">
                        <h2 style="font-size:4vw;">{{ $article->title }}</h2>
                        <h5>{{ $article->summary }}</h5>
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

<section>
    <div class="container mb-4 mt-5">
        {!! $article->body !!}
    </div>
</section>

@endsection



@section('js')
    
@endsection