<div class="row">

    <div class="col-lg-12 col-12">


        <div class="card">
            <div class="card-body main-clickable-links">
                <a data-page="news_feed" class="news_feed pr-1"><i class="fas fa-comment-alt "></i> News</a>
                <a data-page="articals" class="articals pr-1"><i class="fas fa-info-circle "></i> Articals</a>
                <a data-page="resources" class="resources pr-1"><i class="fas fa-book "></i> Resource</a>
                <a data-page="about" class="about pr-1"><i class="fas fa-book "></i> About</a>
                <a data-page="events" class="events pr-1"><i class="fas fa-book "></i> Events</a>
            </div>
        </div>

        <div class="col-sm-12 mb-2 card p-1">
            <div class="media">
                <div class="media-body post-feed-section pt-0">
                    <button
                        class=" btn-post btn-block text-primary font-weight-bold border-0 popover-button input-type" data-value="Articals">
                        Share articles with the community!
                    </button>
                </div>
            </div>
        </div>



        <div class="results" id="results">
            @include('vendor.social-network.ajax.load_posts')
        </div>

    </div>




    <div class="col-lg-4 col-12 d-none">
        <div class="card">
            <div class="card-body pt-1">
                <h6>Photo Albums</h6>
                <div class="row">
                    @foreach(Auth::user()->socialPosts->where('media_type', '!=', "")->sortByDesc('id')->take(3) as $item)
                        @if($item->media_type == 'photo')
                            <div class="col-md-12">
                                <img src="{{ asset($item->file) }}" class="w-100 mb-1 rounded-sm" alt="">
                            </div>
                        @endif
                    @endforeach
                </div>
                {{--                 <h6>Videos</h6>
                                <div class="row">


                                        @foreach(Auth::user()->socialPosts->where('media_type', '!=', "")->sortByDesc('id')->take(3) as $item)
                                            @if($item->media_type == 'video')
                                                <div class="col-md-12">
                                                    <video src="{{ asset($item->file) }}" class="w-100 mb-1 rounded-sm" controls="controls"></video>
                                                </div>
                                            @endif
                                        @endforeach

                                </div> --}}
            </div>
        </div>
    </div>
</div>
