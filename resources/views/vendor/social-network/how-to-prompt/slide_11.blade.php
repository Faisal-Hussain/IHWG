<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">Let's set you up!</h2>
    <h5 class="wizard-primary-title">Social</h5> 
    <br>
    <p>Practitioners can offer an array of services through our platform. Connect with your homeopath to see what they are up to.</p>

      <div class="col-sm-6 offset-sm-3 text-center mt-4">
        <h5 class="wizard-primary-title">Connect with your homeopath...</h5> 
        <input type="" name="connect_homeopath_id" id="connect_homeopath_id" class="form-control username-input" placeholder="Charlesxavier381">
        <div id="append-homeopath">
          
        </div>
        

      </div>
      <p class="mt-5">Can't find your homeopath? No problem! Send them an invite.</p>
      <div class="text-center">
        <a class="btn btn-invitation" data-toggle="modal" data-target="#modalInviteHomeopath">Send an invite</a>
      </div>
  </div>

</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-11-tab" data-toggle="pill" href="#slide-11" role="tab" aria-controls="slide-11" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>
