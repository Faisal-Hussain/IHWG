@extends('layouts.front')
@section('title', 'Articles')

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')
                        <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="">
                        <h2>Articles</h2>
                        <h5>Read our latest and popular articles </h5>
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

        <div class="masonry-events">
    
                @forelse($articles as $item)            
                <div class="item p-0">
                    <a href="{{ route('article.detail', ['uuid' => $item->uuid, 'slug' => $item->slug]) }}">
                        <div class="img-container">
                            <img src="{{ asset($item->featured_image) }}">
                            <div class="bottom-left-text">
                                <h2>{{ $item->title }}</h2>
                            </div>
                        </div>
                    </a>
                </div>
                
                @empty
                @endforelse
            </div>

            <div class="text-center mb-5 mt-4">{{ $articles->onEachSide(5)->links() }}</div>
</div>
</section>

@endsection



@section('js')
    
@endsection