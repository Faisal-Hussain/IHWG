<div class="less-comments-div">
    @foreach($comments as $comment)


        @if($loop->iteration<3)

            <div class="col-sm-12 mt-2 parent-div commentno{{$comment->id}}">
                <div class="img-div">
                    <img class="profile-avatar-small1 float-left" src="{{ asset($comment->user->avatar) }}" alt=""><sapn class="ml-1"><strong class="image-name">{{ $comment->user->name }}</strong></sapn>
                </div>
                <div class="comments ml-3 " style="border-radius: 5px; background-color: #f4f4f4;">


                    <div class="comment-text-div comments-show ">

                        <!-- <div class="ellips ml-auto p-0 float-right" style="font-weight: 700;">
                                <i class="fa fa-ellipsis-v fa-1x"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                                <div class="dropdown-menu dropdown-menu-right">
                                    <button class="dropdown-item delete_comment" data-id="{{$comment->id}}" type="button"><i class="fa fa-trash mr-1"></i>Delete</button>

                                </div>
                        </div> -->

                        <p class=" mb-0 justify-content-around">{{$comment->comment}}</p>
                        <div class="reply-div">
                            <input type="hidden" value="{{$comment->id}}" class="reply_comment_id">
                            <a href="#" class=" mb-1 reply">Reply</a>
                            @if(Auth::user()->id==$comment->user_id)
                            <a class=" delete_comment text-danger pl-1" data-id="{{$comment->id}}" data-removeclass="commentno{{$comment->id}}">Delete</a>
                            @endif
                        </div>
                    </div>


                </div>

                @if(count($comment->child))
                    @include('vendor.social-network.ajax.comments',['comments'=>$comment->child])
                @endif
            </div>
        @else
        <a href="#" class="pl-2 show_more_comments" style="text-decoration: underline;">Show All Comments</a>
        @break
        @endif

    @endforeach
</div>

<div class="show-all-comments-div d-none">
    @foreach($comments as $comment)



        <div class="col-sm-12 mt-2 parent-div commentno{{$comment->id}}">
            <div class="img-div">
                <img class="profile-avatar-small1 float-left" src="{{ asset($comment->user->avatar) }}" alt=""><sapn class="ml-1"><strong class="image-name">{{ $comment->user->name }}</strong></sapn>
            </div>
            <div class="comments ml-3 " style="border-radius: 5px; background-color: #f4f4f4;">


                <div class="comment-text-div comments-show">

                    <!-- <div class="ellips ml-auto p-0 float-right" style="font-weight: 700;">
                            <i class="fa fa-ellipsis-v fa-1x"  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></i>
                            <div class="dropdown-menu dropdown-menu-right">
                                <button class="dropdown-item delete_comment" data-id="{{$comment->id}}" type="button"><i class="fa fa-trash mr-1"></i>Delete</button>

                            </div>
                    </div> -->

                    <p class=" mb-0 justify-content-around">{{$comment->comment}}</p>
                    <div class="reply-div">
                        <input type="hidden" value="{{$comment->id}}" class="reply_comment_id">
                        <a href="#" class=" mb-1 reply">Reply</a>
                        @if(Auth::user()->id==$comment->user_id)
                            <a class=" delete_comment text-danger pl-1" data-id="{{$comment->id}}" data-removeclass="commentno{{$comment->id}}">Delete</a>
                        @endif

                    </div>
                </div>


            </div>

            @if(count($comment->child))
                @include('vendor.social-network.ajax.comments',['comments'=>$comment->child])
            @endif
        </div>

    @endforeach
            <a href="#" class="pl-2 show_less_comments_btn  mt-5" style="text-decoration: underline;">Show less</a>

</div>


@section('js')

@endsection

