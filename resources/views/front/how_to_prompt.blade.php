<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
        <link rel="stylesheet" href="{{ asset('front/assets/css') }}/form-wizard.css">
    <link rel="stylesheet" type="text/css" href="{{asset('admin/dropify/css/dropify.min.css') }}">
    <title>Hello, world!</title>
  </head>
  <body>




    <div class="container-wizard">

        <div class="tab-content" id="pills-tabContent">
          
          <div class="tab-pane fade show active">
                @include('front.how-to-prompt.slide_1')
          </div>

          <div class="tab-pane fade" id="slide-1" role="tabpanel" aria-labelledby="slide-1-tab">
                @include('front.how-to-prompt.slide_2')
          </div>

          <div class="tab-pane fade" id="slide-2" role="tabpanel" aria-labelledby="slide-2-tab">
                @include('front.how-to-prompt.slide_3')
          </div>

          <div class="tab-pane fade" id="slide-3" role="tabpanel" aria-labelledby="slide-3-tab">
                @include('front.how-to-prompt.slide_4')
          </div>

          <div class="tab-pane fade" id="slide-4" role="tabpanel" aria-labelledby="slide-4-tab">
                @include('front.how-to-prompt.slide_5')
          </div>

          <div class="tab-pane fade" id="slide-5" role="tabpanel" aria-labelledby="slide-5-tab">
                @include('front.how-to-prompt.slide_6')
          </div>

          <div class="tab-pane fade" id="slide-6" role="tabpanel" aria-labelledby="slide-6-tab">
                @include('front.how-to-prompt.slide_7')
          </div>

          <div class="tab-pane fade" id="slide-7" role="tabpanel" aria-labelledby="slide-7-tab">
                @include('front.how-to-prompt.slide_8')
          </div>

          <div class="tab-pane fade" id="slide-8" role="tabpanel" aria-labelledby="slide-8-tab">
                @include('front.how-to-prompt.slide_9')
          </div>

          <div class="tab-pane fade" id="slide-9" role="tabpanel" aria-labelledby="slide-9-tab">
                @include('front.how-to-prompt.slide_10')
          </div>

          <div class="tab-pane fade" id="slide-10" role="tabpanel" aria-labelledby="slide-10-tab">
                @include('front.how-to-prompt.slide_11')
          </div>

          <div class="tab-pane fade" id="slide-11" role="tabpanel" aria-labelledby="slide-11-tab">
                @include('front.how-to-prompt.slide_12')
          </div>

          
        </div>




    </div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{asset('admin/dropify/js/dropify.min.js') }}"></script>

    <script>
      $(document).ready(function(){
        $('.dropify').dropify();
      })
    </script>

  </body>
</html>