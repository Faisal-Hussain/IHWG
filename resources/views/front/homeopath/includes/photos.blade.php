
<!-- <div class="col-8 p-0">

<a class="float-right btn-view-all"  data-toggle="modal" data-target="#viewAllPhotos">View all ></a>
<h4>Photos</h4>

<div class="row text-center mt-4 homeo-profile-small-photos">

    @foreach($homeopath->HomeopathImages->sortByDesc('id')->take(4) as $image)
        <div class="col-sm-3 mb-3">
            <img src="{{ asset($image->image) }}">
        </div>
    @endforeach

</div>
</div> -->


<a class="float-right btn-view-all mt-4"  data-toggle="modal" data-target="#viewAllPhotos">View all ></a>
                <h4 class="mt-4">Photos</h4>

                <div class="row text-center mt-4">

                    @foreach($homeopath->HomeopathImages as $image)
                        @if($loop->iteration == 5)
                            @break
                        @endif

                        <div class="col-sm-3 mb-3">
                            <img src="{{ asset($image->image) }}">
                        </div>

                    @endforeach

                </div>


{{-- MODAL PHOTOS --}}
<div class="modal fade" id="viewAllPhotos" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h5 class="modal-title" id="exampleModalLongTitle">Photos</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">


          <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">

            <ol class="carousel-indicators">
                @foreach($homeopath->HomeopathImages as $key => $value)
                   <li data-target="#carouselExampleIndicators" data-slide-to="{{ $key }}" class="@if($loop->iteration) active @endif"></li>
                @endforeach
            </ol>

            <div class="carousel-inner">
              @foreach($homeopath->HomeopathImages as $image)
                  <div class="carousel-item @if($loop->first) active @endif">
                    <img class="d-block w-100" src="{{ asset($image->image) }}">
                  </div>
              @endforeach
            </div>

            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>

          </div>

        </div>
      </div>
    </div>
  </div>
