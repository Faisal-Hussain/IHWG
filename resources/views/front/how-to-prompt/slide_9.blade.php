<div class="slide-logo">
  <a href=""><img src="http://127.0.0.1:8000/front/assets/uploads/1621064519-h-40-logo.png"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">Let's set you up!</h2>
    <h5 class="wizard-primary-title">Profile Information</h5> 
    <strong>Companies & Organizations</strong>
    <br>
    <p>Pick the companies & organizations you would like to follow...<br>
Following companies and organizations involved in health and Homeopathy is a great way to <br>see what they are up to and get involved in their activities.</p>
  </div>

  <div class="row mt-4">

    <div class="col-sm-12 col-lg-10">
      <div class="row ck-button">
          @for($i=1; $i<9; $i++)
                      <div class="col-sm-3">
                        <label>
                          <input type="checkbox" value="{{ $i }} Nutrition"><span>{{ $i }} Defender</span>
                      </label>
                      </div>
                       
                    @endfor        
      </div>
    </div>


  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-9-tab" data-toggle="pill" href="#slide-9" role="tab" aria-controls="slide-9" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>