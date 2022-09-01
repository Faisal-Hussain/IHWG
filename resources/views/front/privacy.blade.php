@extends('layouts.front')
@section('title', 'About Us')

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')

            <!--PAGE BANNER-->
            <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="">
                        <h2 class="text-dark">Innerself Homeopathy Wellness Group</h2>
                        <p class="text-dark">Learn where we came from and what we are Innerself Homeopathy Wellness Group</p>
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
            <br>
            <p style="text-align:center;"><strong>INNERSELF HOMEOPATHY WELLNESS GROUP</strong></p>
            <h2  style="text-align:center;">"We are about providing solutions to a better,<br> more connected future."</h2>
            <div class="row">
                <div class="col-sm-5 mt30">
                    <div class="text-center">
                        <svg style="width:85px" preserveAspectRatio="xMidYMid meet" data-bbox="15.459 15.459 169.082 169.082" viewBox="15.459 15.459 169.082 169.082"  width="85" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img"><defs><style>#comp-kou9x6y0 svg [data-color="1"] {fill: #58C763;}</style></defs>
                            <g>
                            <path d="M184.541 100c0-10.784-8.773-19.557-19.557-19.557h-17.77l12.565-12.565c7.625-7.626 7.625-20.032 0-27.658-7.625-7.624-20.032-7.625-27.657.001l-12.565 12.565v-17.77c0-10.784-8.773-19.557-19.557-19.557-10.783 0-19.557 8.773-19.557 19.557v17.77L67.878 40.22c-7.625-7.624-20.032-7.624-27.657 0-7.625 7.626-7.625 20.032 0 27.658l12.565 12.565h-17.77c-10.784 0-19.557 8.773-19.557 19.557s8.773 19.557 19.557 19.557h17.77l-12.565 12.565c-7.625 7.626-7.625 20.032 0 27.658 7.625 7.624 20.032 7.624 27.657 0l12.565-12.566v17.77c0 10.784 8.773 19.557 19.557 19.557s19.557-8.773 19.557-19.557v-17.77l12.565 12.566c7.625 7.625 20.032 7.624 27.657 0 7.625-7.626 7.625-20.032 0-27.658l-12.565-12.565h17.77c10.783 0 19.557-8.773 19.557-19.557zM100 123.326c-12.883 0-23.326-10.443-23.326-23.326S87.117 76.674 100 76.674 123.326 87.117 123.326 100 112.883 123.326 100 123.326z" fill="#58C763" data-color="1"></path>
                        </g>
                    </svg>
                </div>
                <div class="txt16">
                    <h2 class="txt30">A solution for change</h2>
                    IHWG was born because of the shift that needs to be made to assist Homeopathy in Canada.  As Canadians, we are aware of the enormous potential the country holds as a global leader. We believe that Canada can become a key facilitator in the shift to widen prospective health systems around the globe.
                </div>
            </div>
            <div class="col-sm-7 text-right mt30">
                <div class="img-box2">
                    <img alt="" src="{{ asset('front/assets/frontend') }}/img/img5.webp">
                </div>
            </div>
        </div>
        <div class="row dr">
            <div class="col-sm-5 mt30">
                <div class="img-box2">
                    <img alt="" src="{{ asset('front/assets/frontend') }}/img/img6.webp">
                </div>
            </div>
            <div class="col-sm-6 offset-sm-1 mt30">
                <div class="text-center">
                    <svg preserveAspectRatio="xMidYMid meet" data-bbox="26.715 12.058 146.57 175.884" xmlns="http://www.w3.org/2000/svg" width="71" height="86" viewBox="26.715 12.058 146.57 175.884" data-type="color" role="img" aria-labelledby="svgcid--mmy3uic2xtpf"><defs>
                        <style>#comp-koua1jcz svg [data-color="1"] {fill: #008AFC;}</style></defs><title id="svgcid--mmy3uic2xtpf"></title>
                        <g>
                            <path fill="#008AFC" d="M100 12.058c-40.468 0-73.285 32.209-73.285 71.929 0 40.344 32.062 67.921 73.285 103.955 41.223-36.034 73.285-63.612 73.285-103.955 0-39.721-32.817-71.929-73.285-71.929zm0 131.913c-32.385 0-58.628-26.251-58.628-58.628S67.616 26.715 100 26.715c32.385 0 58.628 26.251 58.628 58.628 0 32.377-26.243 58.628-58.628 58.628z" data-color="1"/>
                            <path d="M88.672 68.848a9.195 9.195 0 1 1-18.39 0 9.195 9.195 0 0 1 18.39 0z" fill="#008AFC" data-color="1"/>
                            <path d="M130.471 68.848a9.195 9.195 0 1 1-18.39 0 9.195 9.195 0 0 1 18.39 0z" fill="#008AFC" data-color="1"/>
                            <path d="M109.573 76.033a9.195 9.195 0 1 1-18.39 0 9.195 9.195 0 0 1 18.39 0z" fill="#008AFC" data-color="1"/>
                            <path fill="#008AFC" d="M92.508 86.817a18.307 18.307 0 0 0-13.032-5.43c-8.967 0-16.425 6.42-18.052 14.913h20.137a21.708 21.708 0 0 1 10.947-9.483z" data-color="1"/>
                            <path fill="#008AFC" d="M121.273 81.387a18.306 18.306 0 0 0-13.031 5.43 21.702 21.702 0 0 1 10.946 9.483h20.137c-1.627-8.493-9.085-14.913-18.052-14.913z" data-color="1"/>
                            <path fill="#008AFC" d="M115.349 96.3c0-.001 0-.001 0 0-.153-.214-.321-.416-.482-.623-.146-.188-.286-.38-.44-.562-.197-.234-.408-.453-.616-.677-.129-.138-.252-.281-.385-.415-.245-.248-.504-.481-.763-.715-.104-.094-.204-.191-.31-.283-.294-.253-.6-.492-.91-.727-.077-.058-.151-.119-.228-.175a18.362 18.362 0 0 0-1.054-.713c-.049-.031-.096-.063-.145-.093a18.334 18.334 0 0 0-1.185-.671l-.074-.039a18.163 18.163 0 0 0-1.296-.603l-.022-.009a18.049 18.049 0 0 0-1.38-.511l-.002-.001c-1.791-.583-3.696-.913-5.682-.913s-3.891.331-5.682.913h-.001c-.47.153-.93.323-1.382.512l-.018.008c-.443.185-.876.386-1.3.604l-.069.036a18.48 18.48 0 0 0-1.19.673l-.139.089a18.53 18.53 0 0 0-1.059.716c-.076.056-.149.115-.225.172-.311.235-.618.475-.913.729-.106.091-.205.188-.309.281-.259.234-.518.468-.764.716-.133.134-.256.277-.385.415-.208.223-.419.443-.616.677-.154.183-.295.377-.442.566-.16.206-.327.406-.479.618v.001a18.319 18.319 0 0 0-3.078 7.185h36.104a18.336 18.336 0 0 0-3.079-7.181z" data-color="1"/>
                        </g>
                    </svg>
                </div>
                <div class="txt16">
                    <h2 class="txt30">Professionals sharing the same vision</h2>
                    Our team of associates consist of field professionals who have both experience and passion. We are an international group of people and have living experiences from many different countries around the world - South Africa, Israel, Ukraine and Canada to name a few.
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-5 mt30">
                <div class="text-center">
                    <svg preserveAspectRatio="xMidYMid meet" data-bbox="20 29.932 160 140.135" xmlns="http://www.w3.org/2000/svg" width="70" height="70" viewBox="20 29.932 160 140.135" data-type="color" role="img" aria-labelledby="svgcid-vfgg81jb9k0p"><defs><style>#comp-kouange31 svg [data-color="1"] {fill: #FF8080;}</style></defs><title id="svgcid-vfgg81jb9k0p"></title>
                        <g>
                        <path fill="#FF8080" d="M167.584 42.349c-16.554-16.555-43.394-16.555-59.948 0L100 49.984l-7.636-7.636c-16.554-16.555-43.394-16.555-59.948 0-16.554 16.554-16.554 43.394 0 59.948l7.636 7.636-.186.186 59.949 59.949.186-.186.186.186 59.949-59.949-.186-.186 7.636-7.636c16.553-16.553 16.553-43.393-.002-59.947z" data-color="1"></path>
                    </g>
                </svg>
            </div>
            <div class="txt16">
                <h2 class="txt30">Putting Homeopathy first</h2>
                We understand that Homeopathy is not only a system of medicine, but a way of understanding true health. Because of this, Homeopathy is taking a leadership role as the driving force behind our ideas and implementations.
            </div>
        </div>
        <div class="col-sm-7 text-right mt30">
            <div class="img-box2">
                <img alt="" src="{{ asset('front/assets/frontend') }}/img/img7.webp">
            </div>
        </div>
    </div>
    <div class="row dr">
        <div class="col-sm-5 mt30">
            <div class="img-box2">
                <img alt="" src="{{ asset('front/assets/frontend') }}/img/img8.webp">
            </div>
        </div>
        <div class="col-sm-6 offset-sm-1 mt30">
            <div class="text-center">
                <svg preserveAspectRatio="xMidYMid meet" data-bbox="10 25.5 180 149" viewBox="10 25.5 180 149" height="80" width="80" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid-acf86fjsf567"><defs><style>#comp-kouas29m svg [data-color="1"] {fill: #FF8C62;}</style></defs><title id="svgcid-acf86fjsf567"></title>
                    <g>
                    <path fill="#FF8C62" d="M176.861 46.373h-43.872v-6.101h4.484V25.5H111.53v14.772h4.484v24.726h-3.843V46.373H22.958L10.232 83.302h179.323l-12.694-36.929z" data-color="1"></path>
                <path d="M177.189 163.261v-71.61H23.452v71.61H10V174.5h180v-11.239h-12.811zm-108.257 0H38.505v-55.554h30.427v55.554zm58.292-27.617H96.797v-27.616h30.427v27.616zm40.997 0h-30.427v-27.616h30.427v27.616z" fill="#FF8C62" data-color="1"></path>
            </g>
        </svg>
    </div>
    <div class="txt16">
        <h2 class="txt30">A big, and happy community</h2>
        While there is publicly funded healthcare in Canada, there is lack of awareness towards the integration of reputable alternative healthcare into our medical systems. Together with our community, we are going to help.
    </div>
</div>
</div>
<p><br></p>
</div>
<div class="banner-top v2 text-center">
<div class="inner">
<h2>Work with us</h2>
<p style="max-width:400px; margin:0 auto;">We are welcoming associates who value what we are trying to achieve. Contact us if you would like to work with us be it partnership or service.
    <br> <br> <br>
    Interested in working with us?
</p>
<br>
<a href="../page/contact-us.html" class="btn btn-primary  v2-btn-blue">Contact Us</a>
</div>
<img alt="" src="{{ asset('front/assets/frontend') }}/img/imgb.webp" >
</div>
</div>
</section>


@endsection



@section('js')
    
@endsection