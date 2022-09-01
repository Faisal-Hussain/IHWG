<div class="slide-logo">
  <a href="{{ route('index') }}" target="_blank"><img src="{{ asset($setting['logo']) ?? ''}}"></a>
</div>
<div class="row mb-3">
  <div class="col-sm-12">
    <h2 class="wizard-heading">Let's set you up!</h2>
    <h5 class="wizard-primary-title">Profile Information</h5> 
    <strong>Groups</strong>
    <br>
    <p>Pick the groups you would like to join!...joining groups is a great way to collaborate with members and streamline the information you want to be involved in.</p>
  </div>

  <div class="row mt-4">

    <div class="col-sm-12 col-lg-10">
      <div class="row ck-button">
        @foreach(getLatestSocialGroups() as $group)
            <div class="col-sm-4">
              <label>
                <input type="checkbox" name="groups[]" value="{{ $group->id }}"><span class="text-capitalize">{{ $group->title }}</span>
              </label>
            </div>
        @endforeach
      </div>
    </div>


  </div>


</div>
<div class="btn-next-slide">
  <a class="nav-link" id="slide-8-tab" data-toggle="pill" href="#slide-8" role="tab" aria-controls="slide-8" aria-selected="false">Next <i class="fas fa-chevron-right"></i></a>
</div>