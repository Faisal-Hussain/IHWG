<div class="slide-logo">
  <a href=""><img src="http://127.0.0.1:8000/front/assets/uploads/1621064519-h-40-logo.png"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">Let's set you up!</h2>
    <h5 class="wizard-primary-title">Social</h5> 
    <strong>Connect with...</strong>
    <br>
    <p>Connect with your friends.</p>
  </div>

  <div class="row mt-4">

    <div class="col-sm-12 col-lg-10">
      <div class="row ck-button">
          @for($i=1; $i<9; $i++)
                      <div class="col-sm-3">
                        <label>
                          <input type="checkbox" value="{{ $i }} Nutrition"><span>{{ $i }} Boiron</span>
                      </label>
                      </div>
                       
                    @endfor        
      </div>
    </div>


  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-10-tab" data-toggle="pill" href="#slide-10" role="tab" aria-controls="slide-10" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>