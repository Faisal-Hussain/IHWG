@extends('layouts.front')
@section('css')

@endsection
@section('title', 'Shop')
@section('content')
    @php
        $cart=Cart::instance('shopping')->content();
        $total=Cart::instance('shopping')->total();
        $filter_array=['sortable_value'=>'','brand_id'=>'','category_id'=>''];
    @endphp
    <header>
        <div class="wrapper">
            <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/about-us.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')

            <!--PAGE BANNER-->
                <div class="banner-top text-center pb-4">
                    <div class="inner2 text-white">
                        <h2 class="txt60">Checkout</h2>
                        <p class="cmp-button-row non-mobile-only">
                        <div class="right-box">
                            <div class="screenshot"></div>
                        </div>
                        </p>
                    </div>
                </div>

            </div>
        </div>
    </header>
    <!--END HEADER-->

    <section class="shopping-cart my-5">
        @include('front.shop.ajax.checkout_page')
    </section>



<form method="post" action="{{ route('shop.make.checkout') }}" id="payment-form">
    @csrf
        <div class="container mb-4 p-0">

        <div class="row container-payment px-4 mb-4">
          
            <div class="col-lg-12 py-5">
                <div class="form-row">
                    <div class="form-group col-md-6">
                      <label>Name<span class="text-danger">*</span></label>
                      <input type="text" class="form-control" name="name" required="" value="{{ Auth::user()->name ?? '' }}">
                    </div>
                    <div class="form-group col-md-6">
                      <label>Email address<span class="text-danger">*</span></label>
                      <input type="email" class="form-control" name="email" required="" value="{{ Auth::user()->email ?? '' }}">
                    </div>
                    
                    
                  </div>
                  <div class="form-group">
                      <label>Shipping address<span class="text-danger">*</span></label>
                      <input type="text" class="form-control" name="address_1" required="">
                  </div>
                  <div class="form-group">
                    <label>Shipping address 2</label>
                    <input type="text" class="form-control" name="address_2">
                  </div>
                  
                  <div class="form-row">
                    
                    <div class="form-group col-md-4">
                       <label>Country<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="country" required="">
                    </div>

                    <div class="form-group col-md-4">
                       <label>State<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="state" required="">
                    </div>

                    <div class="form-group col-md-4">
                       <label>City<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="city" required="">
                    </div>

                    <div class="form-group col-md-6">
                        <label>Zip<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="zip" required="">
                    </div>

                    <div class="form-group col-md-6">
                        <label>Phone<span class="text-danger">*</span></label>
                        <input type="text" class="form-control" name="phone" required="">
                    </div>

                    
                    
                  </div>
            </div>




          <div class="col-lg-12 payments-tab mt-2">
            
            <ul class="nav nav-pills mb-3 text-center" id="pills-tab" role="tablist">
              <li class="nav-item w-50 pr-2">
                <a class="nav-link active py-3" id="pills-home-tab" data-toggle="pill" href="#pills-home" data-method="stripe" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fas fa-credit-card"></i> Visa/Debit</a>
              </li>
              <li class="nav-item w-50 pl-2">
                <a class="nav-link py-3" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" data-method="paypal" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fab fa-paypal"></i> Paypal Payments</a>
              </li>
            </ul>
            
            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="col-lg-12 col-sm-12">
                  <h6>Provide your card information:</h6>
                  <div class="row card-body  card-payment shop-payment-stripe">
                    <div class="col-md-8 offset-md-2 offset-sm-0 m-auto">
                      <div class="credit-cards pb-3" style="text-align: center; width: 100%">
                        <img class="p-3"style="width: 40%;" src="https://lh4.googleusercontent.com/CSUg6331rRxvvdxMJXTPTHpiXZljpp4P_X64UZowSTCFds3s53P1Q0eMLQx-8hOHpjLtxg0dEge3bnaXJe79eAvbi5OWUEhurzUDqRo8T7VoiEhhkNUvGj4cK-87u-kmwih5e1ne"><br>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_visa.png"/>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_master.png"/>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_amex.png"/>
                      </div>
                      <div class="group">
                        <label>Card Information</label>
                        <div id="card-element" class="field"></div>
                      </div>
                      <div id="card-errors" class="error text-danger"></div>
                      <div class="text-center">
                        <small class="note-alert">Click the "Checkout" button below to confirm your payments and book an appointment</small>
                      </div>
                      
                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <div class="col-md-8 offset-md-2 offset-sm-0 m-auto text-center">
                  <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg">
                  <h6 class="alert alert-warning text-left">
                  PayPal is an online payment system that makes paying for things online and sending and receiving money safe and secure. When you link your bank account, credit card or debit card to your PayPal account, you can use PayPal to make purchases online with participating stores.</h6>
                  <small class="note-alert">Click the "Checkout" button below to confirm your payments and book an appointment</small>
                </div>
              </div>
            </div>
            
          </div>
          <div class="col-lg-12 text-right mb-4">
            <input type="hidden" name="payment_method" id="payment_method" value="stripe">
            <button type="submit" class="btn btn-checkout" id="card-button" >Proceed to Checkout</button>
          </div>
        </div>
    </div>
</form>



@endsection



@section('js')



    <script>
    $(document).on('click', '#card-button', function(){
    
    var value = $('.required-entry:visible').filter(function () {
    return this.value === '';
    });
    if (value.length == 0)
    {
    if($('#payment_method').val() == 'paypal')
    {
    $('#payment-form').submit();
    }
    
    }
    else if (value.length > 0)
    {
    toastr.warning("Please fill out form fields.");
    return false
    }
    
    
    })


    $(document).on('click', '.payments-tab .nav-link', function(){
    $('#payment_method').val($(this).data('method'));
    })
    </script>
    <script src="https://js.stripe.com/v3/"></script>




    <script>
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

            const card = elements.create('card', {style: style, hidePostCode:true});
      const cardButton = document.getElementById('card-button');
        const clientSecret = cardButton.dataset.secret;
            card.mount('#card-element');
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
  if (result.error) 
  {  
    document.getElementById('card-button').disabled = false;
  } 
  else 
  {

    
    fetch('{{ route('shop.intent') }}', {
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
        amount: $('.total-amount').data('amount'),
     
      })
    }).then(function(result) {
      // Handle server response (see Step 4)
      result.json().then(function(json) {
    
    var  payment_intent_id = null;
        handleServerResponse(json);
      })
    });
  }
}
  
  
  
  function handleServerResponse(response ) {
    if (response.error) 
    {
    
    } 

    else if (response.requires_source_action) 
    {
        stripe.handleCardAction(response.payment_intent_client_secret).then(handleStripeJsResult);
    } 
    else 
    { 
    
    stripe.createToken(card).then(function(respo) 
    {
        if (respo.error) 
        {

            var errorElement = document.getElementById('card-errors');
            errorElement.textContent = respo.error.message;
            document.getElementById('card-button').disabled = false;
        } 
        else 
        {        
            stripeTokenHandler();
        }
    });
  }
}

function handleStripeJsResult(result) {
  if (result.error) 
  { 
   
   
  } 
  else 
  {
  
     var payment_intent_id=result.paymentIntent.id;
     fetch('{{ route('shop.intent') }}', {
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
       
       handleServerResponse(json);
     }
        
      })
    });
  }
}
  

function stripeTokenHandler() {        
    var form = document.getElementById('payment-form');
     form.submit();
}
</script>






@endsection
