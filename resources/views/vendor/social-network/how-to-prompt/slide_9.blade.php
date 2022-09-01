<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
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

    <div class="col-sm-12">
      <div class="row ck-button">

        @foreach(getSocialHomeopathCompanies() as $item)
            <div class="col-sm-4">
              <label>
                <input type="checkbox" name="companies[]" value="{{ $item->id }}"><span class="text-capitalize">{{ $item->name }}</span>
              </label>
            </div>

        @endforeach

      </div>
    </div>


  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-9-tab" data-toggle="pill" href="#slide-9" role="tab" aria-controls="slide-9" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>