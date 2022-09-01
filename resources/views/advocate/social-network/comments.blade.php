@foreach($comments as $comment)



    <div class="col-sm-12 mt-2 ">
        <div class="img-div">
            <img class="profile-avatar-small1 float-left" src="{{ asset(Auth::user()->avatar) }}" alt=""><sapn class="ml-1"><strong class="image-name">{{ Auth::user()->name }}</strong></sapn>
        </div>
        <div class="comments ml-3 " style="border-radius: 5px; background-color: #f4f4f4;">
            
            
            <div class="comment-text-div comments-show">

                <p class=" mb-0 justify-content-around">{{$comment->comment}}</p>
                <div class="reply-div">
                    <input type="hidden" value="{{$comment->id}}" class="reply_comment_id">
                    <a href="#" class=" mb-1 reply">Reply</a>
                </div>
            </div>


        </div>

        @if(count($comment->child))
            @include('advocate.social-network.comments',['comments'=>$comment->child])
        @endif
    </div>

@endforeach

