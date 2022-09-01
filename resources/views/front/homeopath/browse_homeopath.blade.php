@extends('layouts.front')
@section('title', 'Find A Homeopath')

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background-image: url('{{ asset('front/assets/templates-assets/header/img/hbg.jpg') }}');background-size: cover;">
            @include('front.components.navbar')

            <!--PAGE BANNER-->
            <div class="banner-box pt-1">
                <div class="banner-top text-center">
                    <div class="">

                        <form method="get" action="">
                            <div class="input-group search-homeopath-box">
                            <input type="text" class="form-control" name="q" placeholder="Search by Name" value="{{ $req->q ?? '' }}">
                            <div class="input-group-append">
                              <button class="btn btn-secondary" type="submit">
                                <i class="fas fa-search"></i>
                              </button>
                            </div>
                          </div>
                        </form>

                        <h5 class="text-dark pt-2">Don't know a homeopath? Find one...</h5>
                        <button class="btn btn-primary mt-1"  data-toggle="modal" data-target="#browseBySpecialization">Browse by Specialization</button><br>
                        <a class="btn-scroll"><i class="fas fa-arrow-down arrow-homeo"></i></a>
                    </div>
                </div>
            </div>

        </div>
    </div>
</header>
<!--END HEADER-->

<!--MAIN CONTENT SECTION-->
<section class="border p-1 d-flex justify-content-center mb-1" id="go__down">
    <div class="container">
                            @if($req->specialization)
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h5>About <span class="text-success font-weight-bold">{{ count($homeopaths) }}</span> result(s) found for
                                            <span class="font-weight-bold text-success">{{ $req->specialization ?? '' }}</span>
                                        </h5>
                                    </div>
                                        <div class="col-sm-6 text-right">
                                            <h5>Filter type: <span class="font-weight-bold text-success">Specialization</span></h5>
                                        </div>
                                </div>
                                <hr>
                            @endif

                            @if($req->q)
                                <div class="row">
                                    <div class="col-lg-6">
                                        <h5>About <span class="text-success font-weight-bold">{{ count($homeopaths) }}</span> result(s) found for
                                            <span class="font-weight-bold text-success">{{ $req->q ?? '' }}</span>
                                        </h5>
                                    </div>
                                        <div class="col-lg-6 text-right">
                                            <h5>Filter type: <span class="font-weight-bold text-success">Name Search</span></h5>
                                        </div>
                                </div>
                                <hr>
                            @endif

    <div id="vendors_list">
        <div class="row mt-5">

            @foreach($homeopaths as $item)
                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-3 mb-4">
                <div class="vendors-list-content">
                    <div class="pr" style="position: absolute; top: -13%; left: 32%;">
                        <span class="v-tag"></span>
                        <div class="vendors-list-profile-image">
                            <img src="{{ asset($item->avatar) }}">
                        </div>
                    </div>
                    <div class="vendors-list-profile-details mt-4 pt-3">
                        <div class="vendor-name"><h4 class="font-weight-bold mb-0 pb-0"><a href="{{ route('profile.homeopath', $item->user_name) }}">{{ $item->name }}</a></h4></div>
                        <div class="text-center vendor-address txt14 font-weight-bold" style="color:#10E8CB;">
                            {{ $item->HomeopathProfile->designation }}
                        </div>

                        <div class="info mt-3">
                            <hr class="my-1">
                            <h6 class="font-weight-bold text-success browse-card-email"><i class="fas fa-envelope fa-1x"></i> {{ $item->email ?? 'N/A' }}</h6>
                            <hr class="my-1">
                            <h6 class="font-weight-bold text-info browse-card-phone"><i class="fas fa-phone fa-1x"></i> {{ $item->phone ?? 'N/A' }}</h6>
                            <hr class="my-1">
                            <small class="font-weight-bold"><i class="fas fa-calendar-alt fa-1x"></i> {{ $item->created_at->format('M d, Y') }}</small>
                            <hr class="my-1">
                        </div>


                        <div class="v-box1 mt-3">


                            <div class="item1">
                                <img src="{{ asset(badge($item->badge)['path']) }}"  class="profile-bowl"
                                data-container="body" data-trigger="hover" data-toggle="popover" data-placement="top" data-content="{{ badge($item->badge)['title'] }}"
                                >
                            </div>

                            <div class="item2 ">
                                <div>
                                    <span class="txt20">{{ count(getHomeopathBookings($item->id)) }}</span>   <br>
                                    <span class="txt9">Booking Milestone </span>
                                </div>
                            </div>
                            <div class="item3">
                                <div>
                                    <span class="txt20">{{ $item->HomeopathProfile->estabilished_at }}</span><br>
                                    <span class="txt9">Years </span>
                                </div>

                            </div>

                        </div>
                    </div>
                    <hr class="my-2">
                    <div class="btn-group w-100 homeo-profile-buttons">
                        <a class="btn btn-connect btn-primary m-0 btn-block" data-id="{{ Crypt::encrypt($item->id) }}">
                            @if(checkUserFollowing(Auth::id(), $item->id) > 0)
                                Unfollow
                            @else
                                Follow
                            @endif
                        </a>
                        <a href="{{ route('profile.homeopath', $item->user_name) }}" class="btn btn-success m-0 btn-block">View</a>
                    </div>
                </div>
            </div>
            @endforeach

        </div>
    </div>
</div>
</section>




<!-- MODAL SPECIALIZATION -->
<div class="modal fade" id="browseBySpecialization" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Homeopath Specialization(s)</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form method="get" action="">

        <div class="modal-body">

            <div class="row px-2">
                @foreach($specializations as $key => $value)
                  <div class="col-lg-4 mb-1 p-1">
                    <div class="inputGroup">
                      <input id="illnesses{{ $key }}" class="required-entry" name="specialization" value="{{ $value }}" type="radio" />
                      <label for="illnesses{{ $key }}">
                        <span>{{ $value }}</span>
                      </label>
                    </div>
                  </div>

                  @endforeach
            </div>


          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary btn-sm px-4 py-2"><i class="fas fa-filter"></i> Apply Filter</button>
          </div>
      </form>

    </div>
  </div>
</div>

<div class="text-center">
    {{ $homeopaths->appends($data)->links() }}
</div>


@include('front.components.filter_canvas_sidebar')


@endsection



@section('js')
    <script>

        $(document).ready(function(){

            if(new URLSearchParams(window.location.search) == "")
            {

                @if(!Session::has('canvas__sidebar'))
                    slideOut();
                @endif

            }

        });



        $(document).on('click', '.btn-connect', function(){

            $id = $(this).data('id');
            $self  = $(this);

            @if(!Auth::check())

                toastr.warning('Please login to connect with homeopath.');

            @else

                $.ajax({
                  type: 'GET',
                  url: '{{ route('social.connect.disconnect') }}?id='+$id,
                  success: function (response) {
                    toastr.success('You have '+response+' the connection.');
                    response == 'followed' ? $self.text('Unfollow') : $self.text('Follow');
                    }

                });

            @endif




        })
    </script>


<script>





    function slideOut(){
         $( "#slide-out").toggle( "slide",{direction: "left"},700 );

          $( "#click-toggle-circle").hide( "slide", {direction: "right"},700 );
          $( "#click-toggle-arrow").hide( "slide", {direction: "right"},700 );
          $( "#slide-down-arrow").toggle( "slide", {direction: "right"},700);
          $( "#slide-down-circle").toggle( "slide", {direction: "right"},700);
          return false;
    }



  //Slide out nav bar
     $("#slide-out").click(function()
     {
          $( "#slide-down").toggle( "slide", {direction: "up"},200);

          return false;
     });

     //Slide nav bar back in
     $("#slide-down-circle").click(function()
     {
         //Hide button on click
          $( "#slide-down-circle").toggle( "slide", {direction: "up"},200);
          $( "#slide-down-arrow").toggle( "slide", {direction: "up"},200);
          //Slide nav menu back in
          $( "#slide-out").toggle( "slide", {direction: "left"});
          //Reveal nav button again
          $( "#click-toggle-arrow").toggle( "slide", {direction: "up"},200);
          $( "#click-toggle-circle").toggle( "slide", {direction: "up"},200);
          return false;
     });

     function focusFunction(){
  var x = document.getElementById("focus");
  var welcome = document.getElementById("welcome");
  var name = document.getElementById("byname");
  if (x.style.display === "none") {
    x.style.display = "block";
    welcome.style.display = "none";
    name.style.display = "none";


  } else {
    x.style.display = "none";
    welcome.style.display = "block";
   name.style.display = "none";
  }
}

function nameFunction(){
  var x = document.getElementById("focus");
  var welcome = document.getElementById("welcome");
  var name = document.getElementById("byname");
  if (name.style.display === "none") {
    name.style.display = "block";
    welcome.style.display = "none";
    x.style.display = "none";

  } else {
    name.style.display = "none";
    welcome.style.display = "block";
    x.style.display = "none";
  }
}

function locationFunction()
{

  var x = document.getElementById("location");
  var welcome = document.getElementById("welcome");
  var name = document.getElementById("location");
  if (x.style.display === "none") {
    x.style.display = "block";
    welcome.style.display = "none";
    // x.style.display = "none";

  }
  else
  {
    name.style.display = "none";
    welcome.style.display = "block";
    x.style.display = "none";
  }
}


function submitSearchForm($query)
{

    $form = $('#'+$query);


    if($form.find('input').val() == "")
    {
        toastr.warning('Fill the input field please');
        $form.find('input').focus();
        return false;
    }

    $form.submit();

}


function setFocusValue($value)
{
    $('#textSpecialization').val($value);
}


</script>
<script>



        $(document).on('change', '.radius', function() {


            if($('#latitude').val() == "")
            {
                $('#radius').addClass('d-none');
                toastr.warning('Please select your location area to choose radius');
                return false;
            }




            var map;

            $radius = $(this).val() * 1609.344;

            var latitude = parseFloat($('#latitude').val()); // YOUR LATITUDE VALUE
            var longitude = parseFloat($('#longitude').val()); // YOUR LONGITUDE VALUE



            var myLatLng = {lat: latitude, lng: longitude};

            map = new google.maps.Map(document.getElementById('radius'), {
              center: myLatLng,
              zoom: 12
            });

            var marker = new google.maps.Marker({
              position: myLatLng,
              radius: $radius,
              map: map,
              title: latitude + ', ' + longitude
            });


        var circle = new google.maps.Circle({
            center: myLatLng,
            map: map,
            radius: $radius,          // IN METERS.
            fillColor: '#1877F2',
            fillOpacity: 0.3,
            strokeColor: "#1877F2",
            strokeWeight: 2         // DON'T SHOW CIRCLE BORDER.
        });


            $('#radius').removeClass('d-none');


        })



$(".btn-scroll").click(function() {
    $('html, body').animate({
        scrollTop: $("#go__down").offset().top
    }, 1000);
});



@php

    if(!Session::has('canvas__sidebar'))
    {
        Session::put('canvas__sidebar', true);
    }

@endphp

</script>




@endsection
