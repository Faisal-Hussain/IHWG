<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">Let's set you up!</h2>
    <h5 class="wizard-primary-title">Identity Information</h5> 
    <br>
    <p>Please provide an anonymous name. Your 'anonymous' name can be used whenever you want. Simply click "anonymous" when posting or commenting. Posting or commenting anonymously is a great way to convey any information of yours that if you feel is too personal but is nonetheless important.</p>
  </div>

  <div class="col-sm-6 offset-sm-3 text-center mt-4">
    <h5 class="wizard-primary-title">Username:</h5> 
    <input type="text" value="{{ Auth::user()->user_name }}" name="user_name" class="form-control username-input" required="" placeholder="Charlesxavier381">
  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-5-tab" data-toggle="pill" href="#slide-5" role="tab" aria-controls="slide-5" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>