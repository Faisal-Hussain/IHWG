@extends('layouts.front')
@section('title', 'Community')

@section('css')
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
@endsection


@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/hbg.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')
        </div>
    </div>
</header>
<!--END HEADER-->

<div class="container-fluid py-5 community-container">
    <div class="container">
        <div class="row">

            <div class="col-lg-12 col-sm-12">



                <div class="main-forum-section mb-4">
                            <div class="row p-4">
                            <div class="col-sm-12">
                                <div class="media">
                                  <img class="mr-3" src="{{ asset($forum->user->avatar) }}" alt="{{ $forum->user->name }}">
                                  <div class="media-body">
                                    <h5 class="mt-2">{{ $forum->user->name }}</h5>
                                    <h6 class="mt-2 font-weight-bold">{{ $forum->created_at->diffForHumans() }}</h6>

                                    @if(Auth::check() && Auth::id() == $forum->user->id)
                                            <div class="text-right" style="position: absolute;right: 0;top: 0;">
                                                <div class="dropdown">
                                                      <span class="btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="fas fa-ellipsis-h"></i>
                                                      </span>
                                                      <div class="dropdown-menu dropdown-menu-right">

                                                        <a class="dropdown-item" data-toggle="modal" data-target="#modalStartDiscussion" href="#!"><i class="fas fa-edit pr-1"></i> Edit</a>

                                                        <a  class="dropdown-item"
                                                            onclick="return confirm('Want to delete? Yes! Press OK...')" 
                                                            href="{{ route('community.remove', base64_encode($forum->id)) }}">
                                                            <i class="fas fa-trash pr-1"></i> Delete
                                                        </a>

                                                        
                                                      </div>
                                                    </div>
                                            </div>


                                            <div class="modal fade" id="modalStartDiscussion" tabindex="-1" role="dialog"  aria-hidden="true">
                                              <div class="modal-dialog modal-dialog-centered" style="max-width:90% !important" role="document">
                                                <div class="modal-content">
                                                  <div class="modal-header p-2">
                                                    <h6 class="modal-title">Update your discussion</h6>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                      <span aria-hidden="true">&times;</span>
                                                    </button>
                                                  </div>
                                                  <div class="modal-body">
                                                    <form method="post" action="{{ route('community.update') }}">
                                                      @csrf
                                                      <input type="hidden" name="forum_id" value="{{ base64_encode($forum->id) }}">
                                                      <div class="row mb-3">
                                                          <div class="col-lg-6">
                                                              <input type="text" required="" name="title" value="{{ $forum->title }}" class="form-control">
                                                          </div>
                                                          <div class="col-lg-6">
                                                            <select class="form-control" required="" name="forum_category_id">
                                                                <option hidden="" value="{{ $forum->forumCategory->id }}">#{{ $forum->forumCategory->title }}</option>
                                                                @foreach(forumCategories() as $item)
                                                                    <option value="{{ $item->id }}">#{{ $item->title }}</option>
                                                                @endforeach
                                                            </select>
                                                          </div>
                                                          
                                                      </div>          
                                                      <textarea id="summernote" required="" name="description" class="form-control">{!! $forum->description !!}</textarea>

                                                  </div>
                                                  <div class="modal-footer">
                                                    <button type="submit" class="btn btn-dark">Update Discussion</button>
                                                  </div>       
                                                </form>
                                                </div>
                                              </div>
                                            </div>




                                        @endif

                                  </div>
                                </div>
                                <h2 class="my-3 forum-title">{{ $forum->title }}</h2>
                                {!! $forum->description !!}
                                <hr>
                                <div class="row text-center">
                                    <div class="col-sm-3 mb-3 col-6" title="Likes">

                                        @auth
                                            <a class="{{ $check_reaction > 0 ? 'text-success' : 'text-dark' }} cursor-pointer btn-reaction">
                                                <span id="likes-count">{{ count($forum->forumReactions) }}</span> <i class="fas fa-thumbs-up"></i>
                                            </a>
                                        @else
                                            <span id="likes-count">{{ count($forum->forumReactions) }}</span> <i class="fas fa-thumbs-up"></i>
                                        @endauth


                                        
                                    </div>
                                    <div class="col-sm-3 col-6 mb-3 text-danger" title="Views">{{ $forum->views }} <i class="fas fa-eye"></i></div>
                                    <div class="col-sm-3 col-6 mb-3"><a href="#comments" class="text-info">{{ count($forum->forumComments) }} <i class="fas fa-comments"></i></a></div>
                                    <div class="col-sm-3 col-6 mb-3 text-center"><span class="badge badge-secondary"><i class="fas fa-tag"></i> {{ $forum->forumCategory->title }}</span></div>

                                </div>
                            </div>
                        </div> 
                    </div>
                    <h6 class="bg-dark p-2 text-white mb-4" id="comments">Comments</h6>


                    @foreach($forum->forumComments as $comment)

                        <div class="main-forum-section mb-4">
                            <div class="row p-4">
                                <div class="col-sm-12">
                                    <div class="media">
                                      <img class="mr-3" src="{{ asset($comment->user->avatar) }}" alt="G">
                                      <div class="media-body">
                                        <h5 class="mt-2 forum-title">{{ $comment->user->name }}</h5>
                                        <h6 class="mt-2 font-weight-bold">{{ $comment->created_at->diffForHumans() }}</h6>


                                        @if(Auth::check() && Auth::id() == $comment->user->id)
                                            <div class="text-right" style="position: absolute;right: 0;top: 0;">
                                                <div class="dropdown">
                                                      <span class="btn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                        <i class="fas fa-ellipsis-h"></i>
                                                      </span>
                                                      <div class="dropdown-menu dropdown-menu-right">
                                                        <a  class="dropdown-item"
                                                            onclick="return confirm('Want to delete? Yes! Press OK...')" 
                                                            href="{{ route('community.comment.remove', base64_encode($comment->id)) }}">
                                                            <i class="fas fa-trash pr-1"></i> Delete
                                                        </a>
                                                      </div>
                                                    </div>
                                            </div>
                                        @endif

                                        

                                      </div>
                                    </div>
                                    {!! $comment->description !!}
                                </div>
                            </div>
                        </div>

                    @endforeach

                    

                    @auth
                        <div class="main-forum-section mb-4">
                            <div class="row p-4">
                                <div class="col-sm-12">
                                   <form method="post" action="{{ route('community.comment.create') }}">
                                          @csrf
                                          <input type="hidden" name="forum_id" value="{{ base64_encode($forum->id) }}" required="">
                                          <textarea id="edit-summernote" required="" name="description" class="form-control" required=""></textarea>
                                        <div class="mt-3 text-right">
                                            <button type="submit" class="btn btn-dark"><i class="fas fa-comment"></i> Reply</button> 
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    @endauth

            </div>

        </div> 
    </div>
</div>







@endsection


@section('js')
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
      $('#summernote').summernote({
        placeholder: 'Write your discussion...',
        tabsize: 2,
        height: 300
      });

      $('#edit-summernote').summernote({
        placeholder: 'Write your comment...',
        tabsize: 2,
        height: 350
      });



$('a[href*=#]').click(function(event){
    $('html, body').animate({
        scrollTop: $( $.attr(this, 'href') ).offset().top
    }, 500);
    event.preventDefault();
});


$(document).on('click', '.btn-reaction', function() {
    
    $(this).toggleClass("text-success text-dark");

    $.ajax({
               type:'GET',
               url:'{{ route('community.forum.react.update') }}',
               data: { forum_id: '{{ base64_encode($forum->id) }}' },
               success:function(response) {
                    console.log(response);
                    $('#likes-count').text(response.likes);
               }
    })

})


    </script>
@endsection