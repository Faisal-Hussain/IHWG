<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/hbg.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')

            <!--PAGE BANNER-->



            <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="inner2 text-white">
                        <h2 class="txt60 text-dark">{{ $heading ?? '' }}</h2>
                        <p class="text-dark">{{ $description ?? '' }}</p>
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
