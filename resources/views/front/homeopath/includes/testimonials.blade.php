<a href="#"  data-toggle="modal" data-target="#viewAllTestimonials" class="float-right btn-view-all">View all ></a>
                <h4>Testimonials on Homeopathy</h4>

                <div class="row text-center mt-4">

                    @foreach($homeopath->serviceReviews->sortByDesc("id")->take(3) as $review)

                        <div class="col-sm-4">
                            <div class="card p-2">
                                <small>{{ $review->feedback }}</small>
                                <hr class="my-2">
                                <div class="row">
                                    <div class="col-sm-12 text-left star-rating ">
                                        @for($i = 1; $i <= $review->rate; $i++)
                                            <i class="fas fa-star"></i>
                                        @endfor
                                    </div>
                                    <div class="col-sm-12 text-right">
                                        <h6 class="p-0 m-0">- {{ $review->user->name }}</h6>
                                    </div>
                                </div>


                            </div>
                        </div>

                    @endforeach

                </div>




<!-- Modal Testimonials -->
<div class="modal fade" id="viewAllTestimonials" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header p-2">
          <h5 class="modal-title" id="exampleModalLongTitle">Testimonials</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body profile-testimonials" style="max-height:400px; overflow:auto;">
              <div class="row ">

                      @foreach($homeopath->serviceReviews->sortByDesc("id")->take(3) as $review)

                          <div class="col-sm-12 mb-3">
                              <div class="card p-2 shadow">
                                  <small>{{ $review->feedback }}</small>
                                  <hr class="my-2">
                                  <div class="row">
                                      <div class="col-sm-12 text-left star-rating ">
                                          @for($i = 1; $i <= $review->rate; $i++)
                                              <i class="fas fa-star"></i>
                                          @endfor
                                      </div>
                                      <div class="col-sm-12 text-right">
                                          <h6 class="p-0 m-0">- {{ $review->user->name }}</h6>
                                      </div>
                                  </div>


                              </div>
                          </div>



                      @endforeach

                  </div>
        </div>
      </div>
    </div>
  </div>
