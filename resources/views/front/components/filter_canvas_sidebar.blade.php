<div class="canvas-sidebar">
    <div id="slide-out" style="padding: 45px 25px; z-index: 9999 !important; height: 100vh; overflow-y: auto; overflow-x: hidden;">
<div id="welcome" >
    <div class="row">
    <div class="col-lg-8">
    <h2 id="wlcm-hdn" >Welcome!</h2>      
    </div>
    <div class="col-lg-4">
        <img src="{{ asset('front/assets/filter_son.png') }}">
    </div>
  </div>
  <div class="row">
    <div class="col-md-12" style="margin-top: 40px; min-height: 300px;">
        <p>You can always browse homeopath in the derectory by <u><button class="btn-none" onclick="locationFunction()">location search</button></u> for specific area</p>

        <p>The directory displays homeopaths closest to you first. Meaning the further you scroll down, the farther the homeopath's distance is. </p>
        <p>You can always browse by <u><button class="btn-none"  onclick="focusFunction()">clinical focus</button></u> for a more specific approach, or if you already know the homeopath you're looking for, you can search them by <u><button class="btn-none" onclick="nameFunction()">their name</button></u></p>
    </div>
  </div>


  </div>
  <!-- name start -->
  <div id="byname" style="display: none; height: 100%;">
      <button class="btn-none" onclick="nameFunction()">X</button>

      <div class="row">
        <div class="col-md-8">
          <h2 class="hdn-window">Search by Name</h2>
        </div>
        <div class="col-md-4 text-right">
            <img src="{{ asset('front/assets/filter_man.png') }}" class="mr-4" style="width: 50%;">
        </div>
      </div>

      <div class="row" style="height:80%">
        <div class="col-md-11 mx-auto" style="height:100%">

          <p>Looking for a specific homeopath? Use our directory to find out more information about them</p>
          
          <form class="srch-form" method="GET" id="searchName" action="">
            <div class="form-group">
              <input type="text" name="q">
            </div>
            <button type="submit" class="btn btn-info" onclick="submitSearchForm('searchName')">Search</button>
          </form>

        </div>
      </div>

  </div>
  <!-- name end -->

  <!-- focus start -->
  <div id="focus"  style="display: none; height:100%;">
      <button class="btn-none" onclick="focusFunction()">X</button>

      <div class="row">
        
        <div class="col-lg-8">
          <h2 class="hdn-window" >
            Search by clinical focus
          </h2>
        </div>
        <div class="col-md-4 text-right">
            <img src="{{ asset('front/assets/filter_man.png') }}" class="mr-4" style="width: 50%;">
        </div>

      </div>
      
      <div class="row slide-h" >
        <div class="col-md-11 mx-auto" >
          <p>Homeopathy is not disease focused - therefore, we avoid the word "specialization." Instead, we approach the branches of a 
          directory of practitioners by looking at a practitioner's clinical focuses.</p>
          <p style="padding-top: 10px;">Some common focuses include:</p>
          <div class="btns">
              @foreach($specializations as $key => $value)
                <button class="btn btn-white btn-focus" onclick="setFocusValue('{{ $value }}')" data-value="{{ $value }}">{{ $value }}</button>    
                @if($loop->iteration == 20)
                  @break
                @endif
              @endforeach
          </div>

            


          <p style="padding-top:10px;">
            Search for Specific clinical focus:
          </p>
          <form class="srch-form" id="searchSpecialization" method="GET" action="">
            <div class="form-group">
              <input type="text" name="specialization" id="textSpecialization">
            </div>
            <button type="submit" class="btn btn-info" onclick="submitSearchForm('searchSpecialization')">Search</button>
          </form>

        </div>

      </div>

  </div>
  <!-- focus end -->





    <!-- focus start -->
  <div id="location"  style="display: none; height:100%;">
      <button class="btn-none" onclick="locationFunction()">X</button>

      <div class="row">
        
        <div class="col-lg-8">
          <h2 class="hdn-window" >
            Search by location
          </h2>
        </div>
        <div class="col-md-4 text-right">
            <img src="{{ asset('front/assets/filter_man.png') }}" class="mr-4" style="width: 50%;">
        </div>

      </div>
      
      <div class="row slide-h" >
        <div class="col-md-11 mx-auto" >
          <p>Homeopathy is not disease focused - therefore, we avoid the word "specialization." Instead, we approach the branches of a 
          directory of practitioners by looking at a practitioner's clinical location.</p>


          <p style="padding-top:10px;">
            Search for Specific location:
          </p>

          <form class="srch-form" id="searchLocation" action="{{ url()->current() }}" method="get">
            <div class="form-group">
              <input type="text" id="point" placeholder="" name="location">
              <input type="hidden" name="latitude" id="latitude">
              <input type="hidden" name="longitude" id="longitude">
            </div>

            <button type="submit" class="btn btn-info" onclick="submitSearchForm('searchLocation')">Search</button>

          <div class="radius-section">

            <h6>Radius</h6>
            <select class="form-control my-2 radius" name="radius">
              <option hidden="" value="3">Select radius of miles</option>
              <option value="1">1 mile</option>
              <option value="2">2 miles</option>
              <option value="3">3 miles</option>
              <option value="4">4 miles</option>
              <option value="5">5 miles</option>
              <option value="6">6 miles</option>
              <option value="7">7 miles</option>
              <option value="8">8 miles</option>
              <option value="9">9 miles</option>
              <option value="10">10 miles</option>
            </select>
            <div id="radius" class="mb-3" style="width: 100%; height: 240px;"></div>
          
          </div>


          </form>




        </div>

      </div>

  </div>
  <!-- focus end -->









    
  <!-- copdata -->
</div>
<!-- slide-out div close -->


<!--================================================================-->
                  <!---BUTTON PULL/PUSH NAVBAR-->
<!--================================================================-->
<!-- Button to pull in nav -->
    <div id="slide-down-circle">
        <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
    </div>

    <!-- Button to pull out nav -->
    <div id="click-toggle-circle" onclick="slideOut()">
        <i class="fa fa-long-arrow-right" aria-hidden="true"></i>
    </div>


</div>