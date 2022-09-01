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


  <div class="container container-book-appointment mb-4">
    <div class="appointment-banner p-5 shadow text-center">
      <img src="{{ asset($prescription->HomeopathService->homeopath->avatar) }}" style="width: 130px;">
        <h2>{{ $prescription->HomeopathService->homeopath->name }}</h2>
    </div>


    <div class="row px-4 mb-4">

          
      
      <div class="col-lg-10 offset-lg-1 col-sm-12 mt-3">
          <h3 class="text-danger">Detail:</h3>
          <hr class="mt-0">
          <h5 class="mb-3">{{ $prescription->prescription->prescription }}</h5>
          

          @if($prescription->prescription->attachement != '')
            <h3 class="text-danger">Attachement:</h3>
          <hr class="mt-0">

          <img src="{{ asset($prescription->prescription->attachement) }}" class="w-100">

          @endif


      </div>


      <div class="col-lg-12 text-right mt-4">
        <button class="btn btn-checkout px-4" onclick="window.print()">Print</button>
      </div>

    </div>

    <div style="background-color: #212529;color: #fff;" class="text-center">
        <h4 class="mb-0 pt-2">{{ $prescription->HomeopathService->homeopath->HomeopathProfile->location }} </h4>
        <h6 class="mb-0"> 
          <i class="fas fa-phone"></i> {{ $prescription->HomeopathService->homeopath->phone }} | 
          <i class="fas fa-envelope"></i> {{ $prescription->HomeopathService->homeopath->email }}
        </h6>
    </div>

  </div>




  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
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