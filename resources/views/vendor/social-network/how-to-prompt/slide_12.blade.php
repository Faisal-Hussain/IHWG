<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">You're done!</h2> 
    <br>
    <p>We recommend going through a quick tutorial of the platform to familiarize yourself with all the value you stand to gain from the platform...</p>
    <br>
    <p>Pick the following tutorial to learn more about social platform directory.</p>
  </div>

</div>
  
  <div class="row mt-4 done-platform">



      @if(Auth::user()->role == 'user')

        <div class="col-lg-4 offset-lg-4 mb-3 text-center">
            <img src="{{ asset('front/assets/images/organization.png') }}">
            <a  class="btn btn-done-org">Organization</a>
        </div>
          
      @elseif(Auth::user()->role == 'homeopath')

          <div class="col-lg-4 offset-lg-4 mb-3 text-center">
              <img src="{{ asset('front/assets/images/practitioner.png') }}">
              <a  class="btn btn-done-prac">Practitioner</a>
          </div>

      @else

          <div class="col-lg-4 offset-lg-4 mb-3 text-center">
              <img src="{{ asset('front/assets/images/advocate.png') }}">
              <a class="btn btn-done-adv">Advocate</a>
          </div>

      @endif









      
  </div>
  
<div class="btn-next-slide">
  <button type="submit" class="nav-link border-0">To Platform <i class="fas fa-chevron-right"></i></button>
</div>
