<a class="float-right btn-view-all" data-toggle="modal" data-target="#viewAllServices">View all ></a>
<h4>Featured Services</h4>

<div class="row text-center mt-4">

    @foreach($homeopath->HomeopathServices->where('type', 'featured') as $service)
        @if($loop->iteration<5)
          <div class="col-sm-3 mb-4">
              <div class="position-relative mb-3">
                  
                        @if($service->thumbnail)
                            <img class="" src="{{ asset($service->thumbnail) }}">
                        @else
                            <img class="" src="{{ asset('uploads/img/service.PNG') }}">
                        @endif
                  <p>{{ $service->title }}</p>
              </div>
              @if(Auth::user())
                @if(Auth::user()->role != 'homeopath')
                  <a
                      data-service_id="{{Crypt::encryptString($service->id)}}"
                      class="btn-book book_btn">
                      Book
                  </a>
                @else

                @endif
              @else
                  <a href="{{route('login')}}" class="btn-book bg-dark">Login to Book</a>
              @endif
          </div>
        @endif

    @endforeach

</div>


<!-- Modal Services -->
<div class="modal fade" id="viewAllServices" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h5 class="modal-title" id="exampleModalLongTitle">Services</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
              <div class="row text-center profile-services">
                      @foreach($homeopath->HomeopathServices as $service)
                          <div class="col-sm-3 mb-4">
                              <div class="position-relative mb-4">
                                  @if($service->thumbnail)
                                      <img class="" src="{{ asset($service->thumbnail) }}">
                                  @else
                                      <img class="" src="{{ asset('uploads/img/service.PNG') }}">
                                  @endif
                                  <p>{{ $service->title }}</p>
                              </div>
                              @if(Auth::user())
                                @if(Auth::user()->role != 'homeopath')
                                  <a
                                      data-service_id="{{Crypt::encryptString($service->id)}}"
                                      class="btn-book book_btn">
                                      Book
                                  </a>
                                @endif
                              @else
                                <a href="{{route('login')}}" class="btn-book bg-dark">Login to Book</a>
                              @endif
                          </div>
                      @endforeach
              </div>
        </div>
      </div>
    </div>
  </div>
