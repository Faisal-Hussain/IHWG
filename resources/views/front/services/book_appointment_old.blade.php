<!doctype html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Fira+Sans" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://www.jquerycookbook.com/demos/css/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="{{ asset('front/assets/css/custom.css') }}">
    <title>Book Appointment</title>
  </head>
  <body>

  <!--================================-->
           <!-- 1 of 4 STEP -->
  <!--================================-->

  <div class="container container-book-appointment mb-4">
    <div class="appointment-banner p-5" style="background-image:url('{{ asset('front/assets/images/banner-5.jpg') }}')">
        <strong class="float-right">1 of 4</strong>
        <h2>Book an Appointment</h2>
        <p>Please select a service, and book an available time-slot.</p>
        <p>Thank you!</p>
    </div>


    <div class="row px-4">
      <div class="col-lg-12">          
          <strong>Your Selected Service</strong>
      </div>
      <div class="col-lg-6 mb-3">
          <div class="inputGroup">
            <input id="option1" name="option2" type="radio"/>
              <label for="option1">
              <span>Initial Consultation</span>
              <small>2-3 hours</small>
              <i class="fas fa-info-circle float-right" data-toggle="tooltip" data-placement="top" title="Initial Consultation services for IHWG organizaiton for homeopaths"></i>
            </label>
          </div>
      </div>
      <div class="col-lg-6 mb-3">
          <div class="inputGroup">
            <input id="option2" name="option2" type="radio" checked="" />
              <label for="option2">
              <span>Acute Consultation</span>
              <small>1 hour</small>
              <i class="fas fa-info-circle float-right" data-toggle="tooltip" data-placement="top" title="Initial Consultation"></i>
            </label>
          </div>
      </div>
      <div class="col-lg-6 mb-3">
          <div class="inputGroup">
            <input id="option3" name="option2" type="radio"/>
              <label for="option3">
              <span>First-aid Consultation</span>
              <small>1 hour</small>
              <i class="fas fa-info-circle float-right" data-toggle="tooltip" data-placement="top" title="Initial Consultation"></i>
            </label>
          </div>
      </div>
      <div class="col-lg-6 mb-3">
          <div class="inputGroup">
            <input id="option4" name="option2" type="radio"/>
              <label for="option4">
              <span>Information Consul.</span>
              <small>30 minutes</small>
              <i class="fas fa-info-circle float-right" data-toggle="tooltip" data-placement="top" title="Initial Consultation"></i>
            </label>
          </div>
      </div>

    </div>


    <div class="row p-4">
      <div class="col-lg-12">          
          <strong>Select Date & Time</strong>
      </div>

      <div class="col-lg-6">
            <input type="text" id="datep" class="date-pick" placeholder="{{ date('F') }}" readonly />
      </div>

      <div class="col-lg-6">
        <div class="card card-time">
          <div class="card-body">
            <div class="row">
          
              @for($i=1; $i< 7; $i++)
                <div class="col-sm-4">
                  <div class="timeInput">
                  <input id="{{ $i }}" name="time" type="radio"/>
                    <label for="{{ $i }}">
                    <span>0{{ $i }}:30</span>
                  </label>
                </div>
              </div>
              @endfor
          
        </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!--================================-->
           <!-- 2 of 4 STEP -->
  <!--================================-->

  <div class="container container-book-appointment mb-4">
    <div class="appointment-banner p-5" style="background-image:url('{{ asset('front/assets/images/banner-5.jpg') }}')">
        <strong class="float-right">2 of 4</strong>
        <h2>Provide your Health information</h2>
        <p>To better serve you, please fill-out the following health information.</p>
        <p>Thank you!</p>
    </div>


    <div class="row px-4 mb-4">
      <div class="col-lg-12">          
          <strong>1. Check any past or current illnesses you have</strong>
      </div>
      
      @for($i=1; $i<7; $i++)
        <div class="col-lg-4 mb-3">
            <div class="inputGroup">
              <input id="illnesses{{ $i }}" name="illnesses" type="radio"/>
                <label for="illnesses{{ $i }}">
                <span>{{ $i }} Consultation</span>
              </label>
            </div>
        </div>
        
      @endfor
      
      <div class="col-lg-8 col-sm-12">
        <strong>Allergies?</strong> <input type="" class="input-alergies" name="">
        <strong class="d-block mt-2">What are your health concerns?</strong>
        <textarea class="input-health-concern" rows="10"></textarea>
      </div>

    </div>



  </div>


  <!--================================-->
           <!-- 3 of 4 STEP -->
  <!--================================-->


  <div class="container container-book-appointment mb-4">
    <div class="appointment-banner p-5" style="background-image:url('{{ asset('front/assets/images/banner-5.jpg') }}')">
        <strong class="float-right">3 of 4</strong>
        <h2>Payment</h2>
        <p>Please provide the following payment information.</p>
        <p>Thank you!</p>
    </div>


    <div class="row px-4 mb-4">
      <div class="col-lg-12">          
          <strong>Provide the method you will be paying with:</strong>
      </div>
      
      @for($i=1; $i<6; $i++)
        <div class="col-lg-4 mb-3">
            <div class="inputGroup">
              <input id="payment{{ $i }}" name="illnesses" type="radio"/>
                <label for="payment{{ $i }}">
                <span>{{ $i }} Visa</span>
              </label>
            </div>
        </div>
        
      @endfor
      
      <div class="col-lg-8 col-sm-12">
        <h6>Provide your card information:</h6>

        <strong class="d-block">Name on card</strong> 
        <input type="" class="input-card-number" name="">
      </div>

      <div class="col-lg-12 text-right">
        <button class="btn btn-checkout">Checkout</button>
      </div>

    </div>



  </div>



  <!--================================-->
           <!-- 4 of 4 STEP -->
  <!--================================-->


  <div class="container container-book-appointment mb-4">
    <div class="appointment-banner p-5" style="background-image:url('{{ asset('front/assets/images/banner-5.jpg') }}')">
        <strong class="float-right">4 of 4</strong>
        <h2>Thank you!</h2>
        <p>Thank you for your cooperation.<br>I look forward to helping you.</p>
        <p>Farewell!</p>
    </div>


    <div class="row px-4 mb-4">

          
      
      <div class="col-lg-10 offset-lg-2 col-sm-12 mt-3">
          <strong>Customer Receipt</strong>
          <small class="d-block font-weight-bold text-secondary">Your booking is now confirmed!</small>

        <table class="table table-borderless mt-4">

          <tbody>
            <tr>
              <th class="text-secondary">Patient name</th>
              <th>Roxas Cyrus Woo</th>
            </tr>
            <tr>
              <th class="text-secondary">Service</th>
              <th>Initial Consultation</th>
            </tr>
            <tr>
              <th class="text-secondary">Date</th>
              <th>9:30am Tuesday, February 8th</th>
            </tr>
            <tr>
              <th>
                <strong class="d-block">Price</strong>
                <span class="text-secondary d-block">Taxes</span>
                <span class="text-secondary">25% Senior Discount</span>
              </th>
              <th>
                <strong class="d-block">$250.00</strong>
                <strong class="d-block">$32.50</strong>
                <strong class="d-block">-$70.45</strong>
              </th>
            </tr>
            <tr>
              <th class="text-secondary">Total</th>
              <th>$211.71</th>
            </tr>
            
          </tbody>
        </table>

      </div>

      <div class="col-lg-12 text-right">
        <button class="btn btn-checkout px-4">Print</button>
        <a href="" class="link-return">Return to profile > </a>
      </div>

    </div>



  </div>




























  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="http://www.jquerycookbook.com/demos/scripts/jquery-ui.min.js"></script>
  <script type="text/javascript">
    $(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
  </script>
  <script>
        $(function () {
            $("#datep").datepicker();
        });
    </script>
  </body>
</html>