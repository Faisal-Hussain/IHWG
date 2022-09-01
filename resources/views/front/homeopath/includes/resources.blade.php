<a href="#" class="float-right btn-view-all" data-toggle="modal" data-target="#viewAllResources">View all ></a>
<h4>Resource Materials</h4>

<div class="row text-center mt-4">

     @foreach($homeopath->HomeopathResources->sortByDesc('id') as $item)
        @if($loop->iteration<5)
        <div class="col-sm-3 mb-4">
            <div class="position-relative mb-4">
              @if($item->image)
                <img src="{{ asset($item->image) }}" title="{{ Str::limit($item->title,30)}}">
              @else
                <img src="{{ asset('uploads/img/resource.png') }}">

              @endif
                <!-- <p class="title-bg">{{ Str::limit($item->title,10)}}</p> -->
            </div>
            <button type="button" data-title="{{ $item->title }}" data-description="{{ $item->description}}" 
            data-pdf="@if(isset($item->attachment)) {{asset($item->attachment)}} @endif"  class="btn-read">Read</button>
        </div>
        @endif
    @endforeach




</div>





<!-- Modal Resource Singal -->
<div class="modal fade" id="viewsingleResource" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h5 class="modal-title" id="resource-title"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
              <span id="resource-description"></span>
              <a href="" id="pdf" target="_blank">View Document</a>
        </div>
      </div>
    </div>
  </div>



  <!-- Modal All Resources -->
<div class="modal fade" id="viewAllResources" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h5 class="modal-title" id="exampleModalLongTitle">Resource Materials</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
              <div class="row text-center profile-services">
                      @foreach($homeopath->HomeopathResources->sortByDesc('id') as $item)
                          <div class="col-sm-3 mb-4">
                              <div class="position-relative mb-4">
                                  @if($item->image)
                                    <img src="{{ asset($item->image) }}" title="{{ Str::limit($item->title,30)}}">
                                  @else
                                    <img src="{{ asset('uploads/img/resource.png') }}">

                                  @endif
                                  <!-- <p class="title-bg">{{ $item->title }}</p> -->
                              </div>
                              <button type="button" data-title="{{ $item->title }}" 
                              data-pdf="@if(isset($item->attachment)) {{asset($item->attachment)}} @endif" 
                              data-description="{{ $item->description }}" class="btn-read">Read</button>
                          </div>
                      @endforeach
              </div>
        </div>
      </div>
    </div>
  </div>

