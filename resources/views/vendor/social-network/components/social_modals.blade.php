<style type="text/css">

  .create-post-model .modal-content .modal-body{
    height: 348px;
    overflow-x:hidden;

}
 .create-post-model .modal-content .modal-body::-webkit-scrollbar {
  width: 7px;
}

/* Track */
.create-post-model .modal-content .modal-body::-webkit-scrollbar-track {
  background: #f1f1f1;
}

/* Handle */
.create-post-model .modal-content .modal-body::-webkit-scrollbar-thumb {
  background: #888;
}

/* Handle on hover */
.create-post-model .modal-content .modal-body::-webkit-scrollbar-thumb:hover {
  background: #555;
}
.rounded-circle {
    border-radius: 81% !important;
    width: 45px;
    height: 43px;
}
</style>
    <!--============================================================-->
                    <!--UPDATE STATUS/POST MODAL-->
    <!--============================================================-->


    <div class="modal fade create-post-model" data-backdrop="static" data-keyboard="false" id="modalUpdatePostStatus" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-center font-weight-bold" id="post-modalLabel">Create Post</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="d-flex align-items-center pt-1 border-bottom pb-1">
                    <div class="user-img">
                        <img src="{{ asset(Auth::user()->avatar) }}" width="40" height="40" alt="{{ Auth::user()->name }}" class="avatar-60 rounded-circle img-fluid ml-2">
                    </div>
                    <div class="post-text pl-1" action="">
                        <strong>{{ Auth::user()->name }}</strong>
                        <select class="select2" name="status" id="post_status_type">
                          <option class="font-weight-bold" value="Public" selected="">Public</option>
                          <option class="font-weight-bold" value="Private">Private</option>
                        </select>
                    </div>
                </div>

                <form id="post-form" action="{{route('social.save.post')}}" method="post" enctype="multipart/form-data">
                    @csrf

                    <div class="post-hidden-input"></div>

                    <input type="hidden" name="media_type" value="" id="media_type">
                    <input type="hidden" name="post_type" value="" id="post_type">
                    <input type="hidden" name="id" value="" id="post_id">
                    <input type="hidden" name="group_id" value="" id="user_social_group_id">
                    <input type="hidden" name="post_status" value="Public" id="post_status_input">
                    <div class="modal-body create-post-model-contents">
                        
                        
                        <textarea class="form-control  caption_textarea" rows="5" placeholder="What's in your Mind..." name="caption" required=""></textarea>
                        <textarea class="form-control" type="hidden"  placeholder="Write Resources or Articals Content..." name="desc"  id="desc_textarea" ></textarea>
                        <div class="showable-img">
                            <img src="" id="output" class="show-image">
                        </div>
                        <div class="showable-video">
                            <video width="100%" id="video" controls>
                                <source src="mov_bbb.mp4" id="video_here">
                                Your browser does not support HTML5 video.
                            </video>
                        </div>

                        <ul class="d-flex flex-wrap align-items-center shadow-lg list-inline m-0 p-0 rounded">

                            <li class="col-md-6">
                                <div class="iq-bg-primary rounded p-2 pointer mr-3"><h6><b>Add to your Post</b></h6></div>
                            </li>
                            <li class="col-md-6">
                                <input type="file" name="file" id="imgupload" accept="video/mp4,video/x-m4v,video/*,image/*"  class="form-control">
                                <a id="OpenImgUpload" data-toggle="tooltip" data-placement="bottom" title="Photo/Video"><div class="iq-bg-primary rounded p-2 pointer mr-3"><img src="{{ asset('admin/multimedia-icon.png') }}" alt="icon" class="img-fluid"> Photo/Video</div>
                                </a>
                            </li>
                        </ul>
                        <button type="submit" class="btn-block save-post">Post</button>
                    </div>




                </form>
            </div>
        </div>
    </div>








    <!--============================================================-->
                    <!--type modal start which include view -->
    <!--============================================================-->
    <div class="modal fade"  id="modalPostType" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-center font-weight-bold" id="post-modalLabel"> Select Post Type</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div class="type">
                    <div class="row px-1 pt-2">
                        <div class="col-md-4">
                            <input type="text" readonly value="News" class="form-control input-type text-center cursor-pointer">
                        </div>
                        <div class="col-md-4">
                            <input type="text" readonly value="Articals" class="form-control input-type text-center cursor-pointer">
                        </div>
                        <div class="col-md-4">
                            <input type="text" readonly value="Resources" class="form-control input-type text-center cursor-pointer">
                        </div>

                    </div>
                </div>
                <button id="post_type_btn" type="button" class="btn btn-primary m-1"  data-toggle="modal" data-target="#modalUpdatePostStatus">Go To Post</button>

            </div>
        </div>
    </div>



    <!--============================================================-->
                    <!--type modal start which include view -->
    <!--============================================================-->










    <!--============================================================-->
                    <!--chat modal start which include view -->
    <!--============================================================-->

    <div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog"
         aria-labelledby="myHugeModalLabel" data-backdrop="static" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Messages</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body render-messages" id="render-messages">

                </div>

            </div>
        </div>
    </div>




    <!--============================================================-->
                    <!--UPDATE COVER AVATAR MODAL-->
    <!--============================================================-->

<!-- Modal -->
<div class="modal fade" id="modalUpdateAvatar" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Cover Photo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form id="cover-form" method="POST" action="{{ route('social.cover.update') }}" enctype="multipart/form-data">
        @csrf
        <div class="modal-body">
            <input type="file" name="cover" class="form-control dropify">
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Update Cover</button>
          </div>
      </form>
    </div>
  </div>
</div>



    <!--============================================================-->
                    <!--CREATE GROUP MODAL-->
    <!--============================================================-->

<div class="modal fade" id="modalCreateGroup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Create group</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="{{ route('social.group.create') }}" method="post" enctype="multipart/form-data">
         @csrf
         <div class="modal-body">
            <label>Group name *</label>
            <input type="text" class="form-control" name="title" required="" placeholder="Group name">
            @if($errors->has('title'))
                <div class="text-danger">{{ $errors->first('title') }}</div>
            @endif

            <label>About *</label>
            <input type="text" class="form-control" name="description" required="" placeholder="About group">
            @if($errors->has('description'))
                <div class="text-danger">{{ $errors->first('description') }}</div>
            @endif


            <label>Group Profile *</label>
            <input type="file" class="form-control dropify" name="avatar" required="">
            @error('avatar')
                <div class="text-danger">{{ $errors->first('avatar') }}</div>
            @enderror

            <label>Group Cover *</label>
            <input type="file" class="form-control dropify" name="cover" required="">
            @if($errors->has('cover'))
                <div class="text-danger">{{ $errors->first('cover') }}</div>
            @endif


          </div>
          <div class="modal-footer">
            <button type="submit" class="btn btn-primary">Create group</button>
          </div>
      </form>


    </div>
  </div>
</div>









    <!--============================================================-->
                    <!--TAG CLICK MODAL-->
    <!--============================================================-->

    <div class="modal" id="modalClickTag" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <h4 class="text-info font-weight-bold"></h4>
                    <a class="btn btn-primary text-white btn-tag-follow-unfollow" class="btn btn-primary">Follow</a>
                </div>

            </div>
        </div>
    </div>
    <!-- chat modal end which include view -->







    <!--====================================================-->
                    <!--SHOW ADVOCATE SLIDESHOW-->
    <!--====================================================-->

    <div class="modal fade" id="modalAdvocateSlideshow" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-zoom modal-lg" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title font-weight-bold" id="exampleModalLongTitle">Welcome to CHWG for Advocates</h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
                <h5>Sponsorship <small>(Slideshow preview)</small> </h5>
                  <div id="slideShowAds" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner rounded">

                      @foreach(adsSponsorship() as $item)
                        <div class="carousel-item @if($loop->first) active @endif">
                            <img class="d-block slider-img-show w-100" src="{{asset($item->image)}}" alt="First slide">
                            <div class="carousel-caption d-none d-md-block">
                              <a href="{{$item->url}}" target="_blank"><h2 class="ads-heading">{{$item->heading}}</h2></a>
                            </div>
                          </div>
                      @endforeach

                    </div>
                    <a class="carousel-control-prev" href="#slideShowAds" role="button" data-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#slideShowAds" role="button" data-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
            </div>
          </div>
        </div>
      </div>






    <!--====================================================-->
                    <!--SHOW MEDIA POPUP MODAL-->
    <!--====================================================-->

<div class="modal fade" id="modalMediaPopup" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-zoom modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body"></div>
    </div>
  </div>
</div>


    <!--====================================================-->
                    <!--FC EVENT MODAL-->
    <!--====================================================-->

<div class="modal fade" id="modalFcEvent" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body text-center">

      </div>
    </div>
  </div>
</div>


    <!--====================================================-->
                    <!--FC DETAIL EVENT MODAL-->
    <!--====================================================-->

<div class="modal fade" id="modalGridEventDetail" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">×</span>
        </button>
      </div>
      <div class="modal-body">

          <h4><strong class="text-success pr-1">Category:</strong><span class="event-grid-category"></h4><hr>
          <h4><strong class="text-success pr-1">Vanue:</strong><span class="event-grid-venue"></h4><hr>
          <h4><strong class="text-success pr-1">Location:</strong><span class="event-grid-location"></h4>
            <hr>
          <h6 class="event-grid-description"></h6>

      </div>
    </div>
  </div>
</div>






<!-- EVENT Modal -->
<div class="modal fade" id="eventModal">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom" role="document">
      <div class="modal-content">
        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body text-center">
          <h2>
              Want to add/organize new event in upcoming days?
          </h2>
          <a href="{{route('advocate.events.create')}}" class="btn btn-primary">Click Here</a>
        </div>

      </div>
    </div>
  </div>


<!-- Album Modal -->
<div class="modal fade" id="albumModal">
    <div class="modal-dialog modal-dialog-centered modal-dialog-zoom modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header">

          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">

        </div>

      </div>
    </div>
  </div>


<!-- create new Album Modal -->
<div class="modal fade" id="createNewalbumModal">
    <div class="modal-dialog modal-dialog-zoom " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" >Create New Album</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form action="{{route('social.create.new.album')}}" method="post" id="createNewAlbumForm">
              @csrf
              <input type="hidden" name="id" value="" id="album_id_for_edit">
              <div class="form-group">
                <label>Album Title</label>
                <input type="text" name="name" class="form-control name" required="" >
              </div>
              <button type="submit" class="btn btn-primary flaot-right">Save</button>
            </form>
        </div>

      </div>
    </div>
  </div>


  <!--upload photo in Album Modal -->
<div class="modal fade" id="uploadAlbumModelTitle" tabindex="-1" role="dialog" aria-labelledby="uploadAlbumModelTitle" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" >Upload Photo In Album</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" id="model-body">
        
      </div>
      
    </div>
  </div>
</div>



<!-- upload photo in  Album Modal -->
<div class="modal fade" id="uploadPhotoInalbumModal">
    <div class="modal-dialog modal-dialog-zoom " role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" >Upload Photo In <span id="album-name-in-model"></span> Album</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <form action="{{route('social.create.new.album')}}" method="post" id="uploadPhotoInAlbumForm">
              @csrf
              <div class="form-group">
                <label>Image</label>
                <input type="text" name="name" class="form-control" required="">
              </div>
              <button type="submit" class="btn btn-primary flaot-right">Save</button>
            </form>
        </div>

      </div>
    </div>
  </div>

