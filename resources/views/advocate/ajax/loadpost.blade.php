@foreach($posts as $post)

    <div class="card">

        <div class="card-header post-timeline-card-header">
            <div class="d-flex justify-content-start align-items-center">
                <div class="avatar mr-1">
                    <img class="profile-avatar-small1" src="{{ asset($post->user->avatar) }}" alt="{{ $post->user->name }}">
                </div>

                <div class="user-page-info">
                    <strong class="mb-0 d-block">{{$post->user->name ?? 'N/A'}}</strong>
                    <span class="font-small-2">{{\Carbon\Carbon::createFromTimeStamp(strtotime($post->created_at))->diffForHumans()}}</span>
                </div>
            </div>

            @if(Auth::id() == $post->user_id)
                <div class="ellips ml-auto p-0">
                    <i class="fa fa-ellipsis-v fa-1x"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                    <div class="dropdown-menu dropdown-menu-center">
                        <button class="dropdown-item post_delete_btn" data-url="{{route('social.post.delete',$post->id)}}" type="button"><i class="fa fa-trash mr-1"></i>Delete</button>
                    </div>
                </div>
            @endif



        </div>

        <hr class="m-0">
        <div class="card-body">
            <p class="caption-paragraph">{{$post->caption}}</p>
            @if($post->media_type != '')

                @if($post->media_type=='video')
                    <video  class="video-preview post-timeline-video" src="{{asset($post->file)}}" controls="controls"/>
                @else
                    <img class="post-timeline-img" src="{{asset($post->file)}}" alt="">
                @endif

            @endif

        </div>
        <div class="card-footer bg-white post-actions">
            <div class="row text-center">
                <input type="hidden" class="social_post_id" value="{{$post->id}}">
                <div class="col-sm-4">
                    @if(count($post->likes)>0)
                        <a class="text-dark like-btn"><i class="fas fa-heart text-danger"></i> Like <span class="total-likes">{{count($post->likes)}}</span></a></a>
                    @else
                        <a class="text-dark like-btn"><i class="fas fa-heart"></i> Like <span class="total-likes">{{count($post->likes)}}</span></a></a>
                    @endif
                </div>
                <div class="col-sm-4">
                    <a href="##" class="text-dark comment-btn"><i class="far fa-comments"></i> Comment</a>
                </div>
                <div class="col-sm-4">
                    <a href="##" class="text-dark" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-share"></i> Share</a>
                    <div class="dropdown-menu dropdown-menu-center">
                        <a href="#" target="_blank" class="dropdown-item"><i class="fa fa-facebook-f mr-1"></i>Share on Facebook</a>
                        <a href="#" target="_blank" class="dropdown-item"><i class="fa fa-instagram mr-1"></i>Share on Instagram</a>
                    </div>
                </div>

                <div class="col-md-12 comments-div border-top mt-2">
                    
                    <div class="card pt-0 mb-0">
                        <div class="card-body pt-0">
                            <div class="row comments-row text-left">
                                @include('advocate.social-network.comments',['comments'=>$post->comments,'post_id'=>$post->id])
                            </div>

                        </div>

                    </div>


                    <!---=============================================-->
                                    <!--COMMENT FORM-->
                    <!---=============================================-->

                    <form action="{{route('social.save.comment')}}" class="comment-form" method="post" enctype="multipart/form-data">
                        @csrf
                        <input class="parent_post_id" type="hidden" value="{{$post->id}}" name="parent_post_id">
                        <input class="comment_id" type="hidden" value="" name="parent_comment_id">

                        <div class="row">
                            <div class="col-sm-12">
                                <div class="media px-2">
                                    <img class="m-auto profile-avatar-extra-small" src="{{ asset(Auth::user()->avatar) }}" alt="{{ Auth::user()->name }}">
                                    <div class="media-body">
                                        <input type="text" class="form-control comment-input" name="comment" required="" placeholder="Write here comment...">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>

                    <!---=============================================-->
                                    <!--END COMMENT FORM-->
                    <!---=============================================-->


                </div>

            </div>
        </div>

    </div>
@endforeach
