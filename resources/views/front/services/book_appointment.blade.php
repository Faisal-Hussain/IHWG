
  <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery-ui.css') }}">




<!--END HEADER-->
<!--MAIN CONTENT SECTION-->
<section class="content">
        <!--========================================================-->
                <!--SERVICE PART OF PAYMENT RECEIVED-->
    <!--========================================================-->

    @if(!isset($payment_status))









<div class="tab-content" id="pills-tabContent">
      <!--================================-->
      <!-- 1 of 4 STEP -->
      <!--================================-->
        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
            @include('front.services.appointment-booking.slide_1')
        </div>
      <!--================================-->
      <!-- 2 of 4 STEP -->
      <!--================================-->
        <div class="tab-pane fade" id="nav-detail" role="tabpanel" aria-labelledby="nav-detail-tab">
            @include('front.services.appointment-booking.slide_2')
        </div>
      <!--================================-->
      <!-- 3 of 4 STEP -->
      <!--================================-->
        <div class="tab-pane fade" id="nav-payment" role="tabpanel" aria-labelledby="nav-payment-tab">
            @include('front.services.appointment-booking.slide_3')
        </div>
     

</div>




    <!--========================================================-->
                <!--ELSE PART OF PAYMENT RECEIVED-->
    <!--========================================================-->

    @else




    
    @endif
</section>

    <script type="text/javascript">
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



    $(document).on('click', '.payments-tab .nav-link', function(){
    $('#payment_method').val($(this).data('method'));
    })
    </script>
    <script src="https://js.stripe.com/v3/"></script>










    <script>


        $("#datep").datepicker({
               minDate: 0,
               dateFormat:'yy-mm-dd',
               setDate: null
            }).on('change',function(e){

                $('.search-slot-loader').toggleClass('d-none'); 
                $('.btn-payment-next').addClass('d-none');
                $input_service = $("input[name='input_service']:checked").val();
                console.log($input_service);
                $('.input_date').val($(this).val());

                $.get("{{ route('get.service.slot') }}?service_id="+$input_service+'&date='+$(this).val(), function(response){

                  $('.booking-time-slot').html(response);  
                  $('.search-slot-loader').toggleClass('d-none'); 
                  checkSlideOneValidity();                  
                  $('.btn-detail-next').addClass('d-none');

                });

        });

        $("#datep").find(".ui-state-active").removeClass("ui-state-active");

        
        $(document).on('change', '.input__paying__type', function(){
        

            if($(this).val() == 'pay_later')
            {
                $('.payment-methods-btns').addClass('d-none');
                $('#pills-later-tab').click();
            }
            else
            {
                $('.payment-methods-btns').removeClass('d-none');
                $('#pills-home-tab').click();
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


        $(document).on('change', '.timeInput input', function() { 
          $('.btn-detail-next').removeClass('d-none');
            
        })

        $(document).on('change', '.input_service', function() { 
          
            $('.booking-time-slot').html('');
            $('.btn-detail-next').addClass('d-none');
            
        })
        

    </script>

