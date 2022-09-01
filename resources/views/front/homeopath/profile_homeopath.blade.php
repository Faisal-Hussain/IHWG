@extends('layouts.front')
@section('title', $homeopath->name??'')
@section('css')
 <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery-ui.css') }}">
 <style>
 .v-box1 {
    display: flex !important;
    height: 65px !important;
    justify-content: space-between !important;
    line-height: 13px !important;

}
 </style>
@endsection
@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
        </div>
    </div>
</header>
<!--END HEADER-->

<section>

    <div class="container mt-5">

        <div class="row">

            <!--=====================================================-->
                       <!-- INCLUDE SOCIAL SIDEBAR CARD -->
            <!--=====================================================-->
            <div class="col-lg-2 col-md-12 col-12 col-sm-12 profile-sidebar m-0 p-0">
               @include('front.homeopath.includes.social_sidebar')
            </div>

            <!--=====================================================-->
                       <!-- INCLUDE PROFILE SIDEBAR -->
            <!--=====================================================-->
            <div class="col-lg-3 profile-sidebar" style="overflow: auto;">
               @include('front.homeopath.includes.features_sidebar')
            </div>

            <div class="col-lg-7 profile-right-sidebar">

                <!--=====================================================-->
                               <!-- INCLUDE SERVICES -->
                <!--=====================================================-->
                <div class="profile-services">
                    @include('front.homeopath.includes.services')
                </div>

                <!--=====================================================-->
                               <!-- INCLUDE MAP -->
                <!--=====================================================-->
                <div class="profile-map mt-5" style="padding-top: 5rem;">
                    <h4>Geographic Location</h4>
                    <div id="map" style="width: 100%; height: 300px;"></div>
                </div>

                <!--=====================================================-->
                               <!-- INCLUDE PHOTOS -->
                <!--=====================================================-->
                <div class="profile-photos mt-5">
                    @include('front.homeopath.includes.photos')
                </div>

                <!--=====================================================-->
                               <!-- INCLUDE TESTIMONIALS -->
                <!--=====================================================-->
                <div class="profile-testimonials mt-5">
                   @include('front.homeopath.includes.testimonials')
                </div>

                <!--=====================================================-->
                               <!-- INCLUDE RESOURCES -->
                <!--=====================================================-->
                <div class="profile-resources profile-services mt-5 mb-5">
                    @include('front.homeopath.includes.resources')
                </div>

            </div>
    </div>
</section>


        <!--=====================================================-->
                       <!-- BOOKING PROMPTS MODAL -->
        <!--=====================================================-->

            <div class="modal fade service_book_modal pr-0" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header p-2">
                      <div class="modal-title">
                          <h5 class="m-0 p-0 font-weight-bold">Book Service</h5>
                      </div>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body service__prompts__data">
                    </div>
                  </div>
                </div>
              </div>

        <!--=====================================================-->
                       <!-- END BOOKING PROMPTS MODAL -->
        <!--=====================================================-->


<input type="hidden" id="service_price">
@endsection



@section('js')
<script src="https://js.stripe.com/v3/"></script>

<script>
    $(document).on('click','.age__type',function(){
        var val=$(this).val();

        if (val=='adult') {

            $('.adult-form-download-btn').toggleClass('d-none');
            $('.child-form-download-btn').toggleClass('d-none');

            $('.adult-form-download-heading').toggleClass('d-none');
            $('.child-form-download-heading').toggleClass('d-none');

        }else{
            $('.adult-form-download-btn').toggleClass('d-none');
            $('.child-form-download-btn').toggleClass('d-none');
            $('.child-form-download-heading').toggleClass('d-none');
            $('.adult-form-download-heading').toggleClass('d-none');
        }

    });


        $(document).on('click','.show-hide-caption',function(e){

            $('.caption__homeo__short').toggleClass('d-block d-none');
            $('.caption__homeo__long').toggleClass('d-block d-none');

        });

        $(document).on('click','.book_btn',function(e){

            $self = $(this);
            $self.text('Loading...').attr('disabled', true);
            $s_id= $(this).data('service_id');
            
            

            $.ajax({
            url: "{{ route('include.service.prompt') }}?service_id="+$s_id,
            success: function(response)
            {
                $('.service__prompts__data').html(response);
                $('#viewAllServices').modal('hide');
            
                $('.service_book_modal').modal('show').delay(3000).fadeIn();
                
                $('.service_book_modal').css('overflow', 'auto');
               

                dateTimeInt();
                $self.text('Book').attr('disabled', false);

            },
            complete: function(response)
            {
                stripeCheckout();
            }
            });


        })

            $.ajax({
            url: "{{ route('include.service.prompt') }}?service_id="+$s_id,
            success: function(response)
            {
                $('.service__prompts__data').html(response);
                $('#viewAllServices').modal('hide');
                $('.service_book_modal').modal('show');
                dateTimeInt();
                $self.text('Book').attr('disabled', false);

            },
            complete: function(response)
            {
                stripeCheckout();
            }
            });

        $(document).on('click', '.btn-toggle-badges', function(){
            $('#toggle-chevron-up-down').toggleClass('fa-chevron-down fa-chevron-up')
        });


        $(document).on('click', '.age__type', function(){
            $('.download__form').attr('href', $(this).data('document'));
        });

        $(document).on('click', '.btn-toggle-badges', function(){
            $('#toggle-chevron-up-down').toggleClass('fa-chevron-down fa-chevron-up')
        });

        

</script>




<script type="text/javascript">

        $(document).on('click','.btn-read', function(){
            $('#viewAllResources').modal('hide');

            $('#resource-title').text($(this).data('title'));
            $('#resource-description').text($(this).data('description'));
            
            if($(this).data('pdf').length == 0)
            {
            $('#pdf').addClass('d-none');
            }
            else
            {
            $('#pdf').removeClass('d-none');
                $('#pdf').attr('href',$(this).data('pdf'))
            }
            

            $('#viewsingleResource').modal('show');
        })

    $(function () {
    $('[data-toggle="tooltip"]').tooltip()
    })
    </script>
    <script>
    $(document).on('click', '#card-button', function(){

    var value = $('.required-entry:visible').filter(function () {
    return this.value === '';
    });
    if (value.length == 0)
    {
    if($('#payment_method').val() == 'paypal' || $('#payment_method').val() == 'pay-later')
    {
    $('#payment-form').submit();
    }

    }
    else if (value.length > 0)
    {
    toastr.warning("Please fill out booking form fields.");
    return false
    }


    })



    $(document).on('click', '.modal-body .payments-tab .nav-link', function(){
    $('.modal-body #payment_method').val($(this).data('method'));
    })
    </script>





    <script>
            $('.modal-body #nav-detail').addClass('d-none');
            $('.modal-body #nav-payment').addClass('d-none');

        function dateTimeInt()
        {
        $(".modal-body #datep").find(".ui-state-active").removeClass("ui-state-active");

            $(".modal-body #datep").datepicker({
               minDate: 0,
               dateFormat:'yy-mm-dd',
               setDate: null
            }).on('change',function(e){

                $('#service_price').val($(this).data('service_price'));
                $('.search-slot-loader').toggleClass('d-none');
                $('.btn-payment-next').addClass('d-none');
                $input_service = $("input[name='input_service']:checked").val();
                $homeopath_id= $("input[name='input_service']:checked").data('homeopath-id');

                $('.service_id').val($input_service);

                $('#service_price').val($("input[name='input_service']:checked").data('service_price'));

                $('.input_date').val($(this).val());

                $.get("{{ route('get.service.slot') }}?service_id="+$input_service+'&date='+$(this).val(),'&homeopath_id='+$homeopath_id, function(response){

                  $('.booking-time-slot').html(response);
                  $('.search-slot-loader').toggleClass('d-none');
                  checkSlideOneValidity();
                  
                  $('.btn-detail-next').addClass('d-none');

                });

        });
        }

        $(document).on('change',"input[name='time_slot']",function(){
            var thiss=$(this).val();
             $('.btn-detail-next').addClass('d-none');

            checkSlotAvailablity(thiss);
        })

        function checkSlotAvailablity(thiss)
        {
                
                $('.btn-detail-next').removeClass('d-none');

                $input_service = $("input[name='input_service']:checked").val();
                $homeopath_id= $("input[name='input_service']:checked").data('homeopath-id');

                var date_val=$('.input_date').val();



                $.get("{{ route('check.service.slot') }}?slot="+thiss+'&date='+date_val+'&service_id='+$input_service+'&homeopath_id='+$homeopath_id, function(response){

            
                  if (response) {
                    $('.btn-detail-next').removeClass('d-none');

                  }else{
                    $('.btn-detail-next').addClass('d-none');

                    toastr.success('This slot not match with the service duration time.')
                  }


                });
        }

        $(document).on('change', '.modal-body .input__paying__type', function(){


            if($(this).val() == 'pay_later')
            {
                $('.modal-body .payment-methods-btns').addClass('d-none');
                $('.modal-body #pills-later-tab').click();
            }
            else
            {
                $('.modal-body .payment-methods-btns').removeClass('d-none');
                $('.modal-body #pills-home-tab').click();
            }

        })


    </script>

    <script>
      $(document).on('keyup', '.input-health-concern', function(){

          if($(this).val() != "")
          {
            $('.btn-payment-next').removeClass('d-none');
          }
          else
          {
            $('.btn-payment-next').addClass('d-none');
          }



      })
    </script>
    <script>
        function checkSlideOneValidity() {
            $next_btn = $('.btn-detail-next');

            if ($(':radio[name=time_slot]', '.booking-time-slot').length)
            {
                $disabled_length = $('.disabled-radio', '.booking-time-slot').length;
                $total_slots =  $('input', '.booking-time-slot').length;

                $disabled_length < $total_slots ? $next_btn.removeClass('d-none') : $next_btn.addClass('d-none');



            }
            else
            {
                $next_btn.addClass('d-none');
            }


        }


        $(document).on('change', '.modal-body .timeInput input', function() {

            $('.timeInput input').removeClass('.select_time');
            $(this).closest('.col-sm-4').find('.timeinput').addClass('.select_time');
          $('.modal-body .btn-detail-next').removeClass('d-none');

        })

        $(document).on('change', '.modal-body .input_service', function() {

            $('.modal-body .booking-time-slot').html('');
            $('.modal-body .btn-detail-next').addClass('d-none');

        })
        $(document).on('click', '.modal-body .btn-detail-next', function() {

            $('.modal-body #nav-home').addClass('d-none');


            $('.modal-body #nav-detail').addClass('active show');
            $('.modal-body #nav-detail').removeClass('d-none');
            // $('.modal-body #nav-detail .btn-payment-next').addClass('active show');


        })
        $(document).on('click', '.modal-body .continue_btn', function() {

            $('.modal-body #nav-detail').removeClass('active show');
            $('.modal-body #nav-detail').addClass('d-none');


            $('.modal-body #nav-payment').addClass('active show');
            $('.modal-body #nav-payment').removeClass('d-none');

            // $('.modal-body #nav-detail .btn-payment-next').addClass('active show');


        })
        // function checkboxMetting(thiss) {
           
        //     if (thiss=='Offline') 
        //     {
        //         $('#meeting_handled_via_online').attr('checked',false);
        //         $('#meeting_handled_via_offline').attr('checked',true);
        //     }
        //     if (thiss=='Online')
        //     {

        //         $('#meeting_handled_via_offline').attr('checked',false);
        //         $('#meeting_handled_via_online').attr('checked',true);
                
        //     }


        // }




    </script>

        <script>


        function stripeCheckout()
        {

      const stripe = Stripe('{{ env('STRIPE_KEY') }}', { locale: 'en' });
      const elements = stripe.elements(); // Create an instance of Elements.
            var style = {
                base: {
                    color: '#32325d',
                    fontFamily: '"proxima-nova", "Helvetica Neue", Helvetica, sans-serif',
                    fontSmoothing: 'antialiased',
                    fontSize: '16px',
                    '::placeholder': {
                    color: '#aab7c4'
                    }
                },
                invalid: {
                    color: '#fa755a',
                    iconColor: '#fa755a'
                }
            };

      const card = elements.create('card', {style: style, hidePostalCode:true});
      const cardButton = document.getElementById('card-button');
      const clientSecret = cardButton.dataset.secret;
            card.mount('.modal-body #card-element');
            // Handle real-time validation errors from the card Element.
            card.on('change', function(event) {
                var displayError = document.getElementById('card-errors');
                if (event.error) {
                    displayError.textContent = event.error.message;
                } else {
                    displayError.textContent = '';
                }
            });

            // Handle form submission.
            var form = document.getElementById('payment-form');
            console.log($('#payment-form').html());
            form.addEventListener('submit', function(event) {

                event.preventDefault();

                // Disable The submit button on click
                document.getElementById('card-button').disabled = true;

        stripe.createPaymentMethod({
          type: 'card',
          card: card,
          billing_details: {
            // Include any additional collected billing details.
            name: 'John Doe',
          },
          }).then(stripePaymentMethodHandler);
            });



  function stripePaymentMethodHandler(result) {
  if (result.error) {
    // Show error in payment form
    // toastr.error('Whoops! looks like issue in your card');
    document.getElementById('card-button').disabled = false;
  } else {
   // console.log(result.paymentMethod.id);
    // Otherwise send paymentMethod.id to your server (see Step 4)

    fetch('{{ route('intent') }}', {
      method: 'POST',
     headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-Requested-With": "XMLHttpRequest",
        "X-CSRF-Token": $('input[name="_token"]').val()
      },
    credentials: "same-origin",
      body: JSON.stringify({
        payment_method_id: result.paymentMethod.id,
        amount: $('#service_price').val() ,
        location:'{{$homeopath->HomeopathProfile->location}}',

      })
    }).then(function(result) {
      // Handle server response (see Step 4)
      result.json().then(function(json) {

    var  payment_intent_id = null;
        handleServerResponse(json, payment_intent_id);
      })
    });
  }
}



  function handleServerResponse(response , payment_intent_id) {
  if (response.error) {
    $('#modalStripe').modal('hide');
    if(response.error =='hotel price is update')
    {
      Swal.fire(
          'Hotel Booking',
          'Hotel Price has been updated',
          'warning'
        )
      setTimeout(function(){
      location.reload();
    }, 6000);

    }
    // Show error from server on payment form
  } else if (response.requires_source_action) {
    // Use Stripe.js to handle required card action

    stripe.handleCardAction(
      response.payment_intent_client_secret
    ).then(handleStripeJsResult);
  } else {

    stripe.createToken(card).then(function(respo) {
                if (respo.error) {
                    // Inform the user if there was an error.
                    var errorElement = document.getElementById('card-errors');
                    errorElement.textContent = respo.error.message;
                    // Enable The submit button
                    document.getElementById('card-button').disabled = false;
                } else {
                    // Send the token to your server.
                    stripeTokenHandler(payment_intent_id,respo.token.id);
                }
            });
  }
}

function handleStripeJsResult(result) {
  if (result.error) {





  } else {
    // The card action has been handled
    // The PaymentIntent can be confirmed again on the server
     var payment_intent_id=result.paymentIntent.id;
    fetch('{{ route('intent') }}', {
      method: 'POST',
     headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "X-Requested-With": "XMLHttpRequest",
        "X-CSRF-Token": $('input[name="_token"]').val()
      },
    credentials: "same-origin",
      body: JSON.stringify({
        payment_intent_id: result.paymentIntent.id,


      })
    }).then(function(result) {
      // Handle server response (see Step 4)
      result.json().then(function(json) {
     console.log(json);
     if(json.success==true)
     {

       handleServerResponse(json,payment_intent_id);
     }

      })
    });
  }
}



            // Submit the form with the token ID.
            function stripeTokenHandler(paymentIntent,token) {
                // Insert the token ID into the form so it gets submitted to the server
                var form = document.getElementById('payment-form');
                var hiddenInput = document.createElement('input');
                hiddenInput.setAttribute('type', 'hidden');
            hiddenInput.setAttribute('value', paymentIntent);
                form.appendChild(hiddenInput);

        var hideInput = document.createElement('input');
            hideInput.setAttribute('type', 'hidden');
            hideInput.setAttribute('value', token);
            form.appendChild(hideInput);
        // Submit the form
                form.submit();
            }



        }
</script>

<script>

var map;

function initMaps() {
    var latitude = {{ $homeopath->HomeopathProfile->latitude??'' }}; // YOUR LATITUDE VALUE
    var longitude = {{ $homeopath->HomeopathProfile->longitude??'' }}; // YOUR LONGITUDE VALUE

    var myLatLng = {lat: latitude, lng: longitude};

    map = new google.maps.Map(document.getElementById('map'), {
      center: myLatLng,
      zoom: 14
    });

    var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      //title: 'Hello World'

      // setting latitude & longitude as title of the marker
      // title is shown when you hover over the marker
      title: latitude + ', ' + longitude
    });
}
</script>




@endsection
