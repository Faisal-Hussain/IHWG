<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
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

    <div class="col-sm-12">
      <div class="row ck-button">
          @foreach(getSocialFriends() as $item)
          
              <div class="col-sm-4">
                <label>
                  <input type="checkbox" name="friends[]" value="{{ $item->id }}"><span class="text-capitalize">{{ $item->name }}</span>
                </label>
              </div>

          @endforeach
      </div>
    </div>


  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-10-tab" data-toggle="pill" href="#slide-10" role="tab" aria-controls="slide-10" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>