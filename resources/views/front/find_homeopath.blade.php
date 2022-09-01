@extends('layouts.front')
@section('title', 'Find Homeopath')
@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/ihwg-for-homeopaths.jpg) no-repeat 50% center;background-size: cover; height: 100vh;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
            <div class="container">
                <div class="row align-center">
                    <div class="col-md-6">
                        <div class="hero__copy">
                            <h1>IHWG for Homeopaths</h1>
                            <p>Finally, a living, breathing directory that can provide a home for your clinic among a
                            community that needs you.</p>
                            <p>Interested in IHWG for Homeopaths?</p>
                            <p class="cmp-button-row non-mobile-only">
                                <button class="btn btn-primary  text-white" data-toggle="modal" data-target="#modalRegistration">Register now</button>
                                or
                                <a href="{{ route('browse.homeopath') }}" class="btn btn-primary text-white">Browse Homeopath</a>
                            </p>
                            
                            @include('auth.registration_modal')

                            



                    </div>
                </div>
                <div class="col-md-6">
                    <div class="right-box">
                        <div class="">
                            <img src="{{ asset('front/assets') }}/homeopath.png" alt="">
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
<div class="container mt-5 pb-5">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <section id="comp-kp4dmpkp" class="JSM9k">
                <div id="bgLayers_comp-kp4dmpkp" class="X-jRX">
                    <div data-testid="colorUnderlay" class="mlsxv _22Lsw"></div>
                    <div id="bgMedia_comp-kp4dmpkp" class="_1J6n9"></div>
                            </div>
                            <div data-testid="columns" class="_2EoGw">
                                <div id="comp-kp4dmpks" class="_31Ne5">
                                    <div id="bgLayers_comp-kp4dmpks" class="X-jRX">
                                        <div data-testid="colorUnderlay" class="mlsxv _22Lsw"></div>
                                        <div id="bgMedia_comp-kp4dmpks" class="_1J6n9"></div>
                                    </div>
                                    <div data-mesh-id="comp-kp4dmpksinlineContent" data-testid="inline-content" class="">
                                        <div data-mesh-id="comp-kp4dmpksinlineContent-gridContainer" data-testid="mesh-container-content">
                                            <div id="comp-kp4dmpku" class="_2bafp" data-testid="richTextElement">
                                                <p class="font_7" style="font-size:40px; line-height:1.1em; text-align:center"><span style="font-size:40px"><span style="color:#414141"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">A social </span></span>
                                                </span><span style="color:#558A83"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">platform </span></span>
                                                </span><span style="color:#414141"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">that is built with Homeopathy at its forefront</span></span>
                                            </span>
                                        </span>
                                    </p>
                                </div>
                                <div id="comp-kp4dmpkw" class="_2bafp" data-testid="richTextElement">
                                    <p class="font_7" style="font-size:18px; line-height:1.1em; text-align:center"><span style="font-size:18px"><span style="font-family:proxima-n-w01-reg,sans-serif"><span class="color_20">Finally, a community that is sheltered from scrutiny, censorship, and capitalistic agendas. Let IHWG be a health haven for you and your loved ones.</span></span>
                                </span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            </div>
            </section>
        </div>
        <div class="col-md-2"></div>
    </div>
</div>
<!-- end -->
<!-- third section -->
<div id="comp-kp4dmpla" class="_2bafp  pb-5" data-testid="richTextElement" style="background-color: rgb(231, 228, 228);">
<br />
<p class="font_7 " style="font-size:25px; text-align:center;"><span style="color:#414141;"><span style="font-size:25px"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">A directory that is </span></span>
</span>
</span>

<span id="directory_changingword">Interactive</span> > </span>

</p>
<p class="font_7" style="font-size:15px; text-align:center"><span style="font-size:15px"><span style="font-family:proxima-n-w01-reg,sans-serif"><span class="color_20">Gain access to important health information that you and <br /> your loved ones deserve.</span></span>
</span>
</p>
<br />
<div class="container mt-5">
<div class="row">
<div class="col-md-12">
<div id="carouselExampleIndicators" class="carousel slide w-75 mx-auto" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
</ol>
<div class="carousel-inner">
<div class="carousel-item active">
<img class="d-block w-100" src="{{ asset('front/assets/frontend') }}/img/laptop1.webp" alt=" First slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop.webp" alt="Second slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop1.webp" alt="Third slide ">
</div>
</div>
<a class="carousel-control-prev " href="#carouselExampleIndicators" role="button " data-slide="prev ">
<span class="carousel-control-prev-icon " aria-hidden="true "></span>
<span class="sr-only ">Previous</span>
</a>
<a class="carousel-control-next " href="#carouselExampleIndicators" role="button " data-slide="next ">
<span class="carousel-control-next-icon " aria-hidden="true "></span>
<span class="sr-only ">Next</span>
</a>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
<!-- fourth -->
<div id="comp-kp4dmpla" class="_2bafp  pb-4" data-testid="richTextElement">
<br />
<p class="font_7" style="font-size:25px; text-align:center"><span style="color:#414141;"><span style="font-size:25px"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">An eClinic you can</span></span>
</span>
</span>
<span id="eClinic_changingword">Customize</span> > </span>
</p>
<script>
document.addEventListener('DOMContentLoaded', function() {
var typed1 = new Typed('#typed2', {
strings: ['customize >', 'customize >', 'customize >'],
typeSpeed: 30,
backSpeed: 30,
backDelay: 3000,
startDelay: 1000,
loop: true,
});
});
</script>
<p class="font_7" style="font-size:15px; text-align:center"><span style="font-size:15px"><span style="font-family:proxima-n-w01-reg,sans-serif"><span class="color_20">Gain access to important health information that you and <br /> your loved ones deserve.</span></span>
</span>
</p>
<br />
<div class="container pb-4">
<div class="row">
<div class="col-md-12">
<div id="carouselExampleIndicators" class="carousel slide w-75 mx-auto" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
</ol>
<div class="carousel-inner">
<div class="carousel-item active">
<img class="d-block w-100" src="{{ asset('front/assets/frontend') }}/img/laptop2.webp" alt=" First slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop.webp" alt="Second slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop1.webp" alt="Third slide ">
</div>
</div>
<a class="carousel-control-prev " href="#carouselExampleIndicators" role="button " data-slide="prev ">
<span class="carousel-control-prev-icon " aria-hidden="true "></span>
<span class="sr-only ">Previous</span>
</a>
<a class="carousel-control-next " href="#carouselExampleIndicators" role="button " data-slide="next ">
<span class="carousel-control-next-icon " aria-hidden="true "></span>
<span class="sr-only ">Next</span>
</a>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
<!-- third section -->
<div id="comp-kp4dmpla" class="_2bafp pb-4 pt-5" data-testid="richTextElement" style="background-color: rgb(231, 228, 228);">
<br />
<div id="comp-kp4dzyit1" class="_2bafp" data-testid="richTextElement">
<p class="font_7" style="font-size:25px; text-align:center"><span style="color:#414141;"><span style="font-size:25px"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">Your own system for </span></span>
</span>

<span id="system_changingword">Customize</span> > </span>

</p>
<script>
document.addEventListener('DOMContentLoaded', function() {
var typed1 = new Typed('#typed3', {
strings: ['booking >', 'booking >', 'booking >'],
typeSpeed: 30,
backSpeed: 30,
backDelay: 3000,
startDelay: 1000,
loop: true,
});
});
</script>
</div>
<p class="font_7" style="font-size:15px; text-align:center"><span style="font-size:15px"><span style="font-family:proxima-n-w01-reg,sans-serif"><span class="color_20">Gain access to important health information that you and <br /> your loved ones deserve.</span></span>
</span>
</p>
<br />
<div class="container pb-4">
<div class="row">
<div class="col-md-12">
<div id="carouselExampleIndicators" class="carousel slide w-75 mx-auto" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
</ol>
<div class="carousel-inner">
<div class="carousel-item active">
<img class="d-block w-100" src="{{ asset('front/assets/frontend') }}/img/laptop3.webp" alt=" First slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop.webp" alt="Second slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop1.webp" alt="Third slide ">
</div>
</div>
<a class="carousel-control-prev " href="#carouselExampleIndicators" role="button " data-slide="prev ">
<span class="carousel-control-prev-icon " aria-hidden="true "></span>
<span class="sr-only ">Previous</span>
</a>
<a class="carousel-control-next " href="#carouselExampleIndicators" role="button " data-slide="next ">
<span class="carousel-control-next-icon " aria-hidden="true "></span>
<span class="sr-only ">Next</span>
</a>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
<!-- fourth -->
<div id="comp-kp4dmpla" class="_2bafp" data-testid="richTextElement">
<br />
<p class="font_7" style="font-size:25px; text-align:center"><span style="color:#414141;"><span style="font-size:25px"><span style="font-weight:bold"><span style="font-family:poppins-semibold,poppins,sans-serif">Built-in automation</span></span>
</span>
<span id="automation_changingword">Customize</span> > </span>
</p>

<p class="font_7" style="font-size:15px; text-align:center"><span style="font-size:15px"><span style="font-family:proxima-n-w01-reg,sans-serif"><span class="color_20">Gain access to important health information that you and <br /> your loved ones deserve.</span></span>
</span>
</p>
<br />
<div class="container pb-4">
<div class="row">
<div class="col-md-12">
<div id="carouselExampleIndicators" class="carousel slide w-75 mx-auto" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
</ol>
<div class="carousel-inner">
<div class="carousel-item active">
<img class="d-block w-100" src="{{ asset('front/assets/frontend') }}/img/laptop3.webp" alt=" First slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop.webp" alt="Second slide ">
</div>
<div class="carousel-item ">
<img class="d-block w-100 " src="{{ asset('front/assets/frontend') }}/img/laptop1.webp" alt="Third slide ">
</div>
</div>
<a class="carousel-control-prev " href="#carouselExampleIndicators" role="button " data-slide="prev ">
<span class="carousel-control-prev-icon " aria-hidden="true "></span>
<span class="sr-only ">Previous</span>
</a>
<a class="carousel-control-next " href="#carouselExampleIndicators" role="button " data-slide="next ">
<span class="carousel-control-next-icon " aria-hidden="true "></span>
<span class="sr-only ">Next</span>
</a>
</div>
</div>
</div>
</div>
</div>
<!-- end -->
<!-- bottom section -->
<div class="bg" style="background-color: rgb(231, 228, 228);">
<div class="container mt-4">
<div class="row">
<div class="col-md-6">
<div class="text-center">
<img src="{{ asset('front/assets/frontend') }}/img/woman.webp" alt="image" class="rounded-image mt-4 mb-4" />
</div>
</div>
<div class="col-md-6 mt-5 ">
<div id="comp-kp4dmpp8" class="_2bafp" data-testid="richTextElement">
<br />
<p class="font_7" style="font-size:15px"><span style="font-weight:bold"><span style="font-family:poppins-extralight,poppins,sans-serif"><span style="font-size:15px"><span class="color_20">"By joining IHWG, I've given myself the peace of mind that I any future decisions I make about my health, can be made with confidence and factual information."</span></span>
</span>
</span>
</p>
</div>
<div id="comp-kp4dmpp91" class="_2bafp" data-testid="richTextElement">
<p class="font_7" style="font-size:20px"><span style="color:#008AFC;"><span style="font-family:poppins-semibold,poppins,sans-serif; font-weight:700">Natasha Lewis</span></span>
</p>
</div>
<div id="comp-kp4dmppc" class="_2bafp" data-testid="richTextElement">
<p class="font_7" style="font-size:12px"><span class="color_22"><span style="font-size:12px"><span style="font-family:poppins-semibold,poppins,sans-serif; font-weight:700">Homeopath/Advocate</span></span>
</span>
</p>
</div>
</div>
</div>
</div>
</div>
</section>




<!-- Modal -->
<div class="modal fade" id="modalHomeopathWelcome" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content"  style="background:#2B3452;min-height: 410px;">


      <div class="modal-body">

            <div class="row">
                <div class="col-sm-6" style="color:#bbb;">
                    <h3 class="mt-5 font-weight-bold" >Welcome to Homeopath Directory</h3>
                    <p>{{$setting['homeopath_popup_description'] ?? ''}}</p>

                    <button type="button" class="close float-left" data-dismiss="modal" aria-label="Close">
                      GOT IT
                    </button>



                </div>

                <div class="col-sm-6 m-auto">
                    <img src="{{ asset('front/assets') }}/homeopath.png" alt="" class="w-100 mt-1">
                </div>

            </div>



        

      </div>
    </div>
  </div>
</div>





@section('js')
<script type="text/javascript">
    $('#modalHomeopathWelcome').modal('show');



    (function(){
      var words = [
          'organized',
          'specific',
          'gorgeous',
          'interactive'
          ], i = 0;
      setInterval(function(){
          $('#directory_changingword').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);
        
  })();


    (function(){
      var words = [
          'loremIpsu',
          'dealing',
          'customize'
          ], i = 0;
      setInterval(function(){
          $('#eClinic_changingword').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);
        
  })();


    (function(){
      var words = [
          'travelling',
          'reservation',
          'booking'
          ], i = 0;
      setInterval(function(){
          $('#system_changingword').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);
        
  })();

  
    (function(){
      var words = [
          'inbox',
          'message',
          'emails'
          ], i = 0;
      setInterval(function(){
          $('#automation_changingword').fadeOut(function(){
              $(this).html(words[i=(i+1)%words.length]).fadeIn();
          });
      }, 3000);
        
  })();

  

  





</script>
@endsection