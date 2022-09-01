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
            <div class="col-lg-3 col-sm-12">
                <div class="text-center">

                    @auth
                        <button  class="btn btn-discussion" data-toggle="modal" data-target="#modalStartDiscussion">+ START DISCUSSION</button>
                    @else
                        <button class="btn btn-discussion" onclick="location.href='{{ route('login') }}';">LOGIN TO DISCUSS</button>
                    @endauth

                    
                </div>
                <div class="list-group shadow forum-categories">  
                      <a href="{{ route('community.index') }}" class="list-group-item list-group-item-action">#Latest</a>
                    @foreach(forumCategories() as $item)
                      <a href="{{ route('community.search.category', $item->title) }}" class="list-group-item list-group-item-action">#{{ $item->title }}</a>
                    @endforeach
                </div>
            </div>

            <div class="col-lg-9 col-sm-12">
                    
                {{-- <div class="main-forum-section mb-4 shadow">
                    <div class="row">
                        <div class="col-sm-12">
                            <input type="" class="form-control" name="" placeholder="Search forum">
                        </div>
                    </div>         
                </div> --}}


                @foreach($forums as $item)
                    <div class="main-forum-section mb-4">
                        <a href="{{ route('community.show', ['id' => $item->uuid, 'slug' => $item->slug]) }}">
                            <div class="row p-4">
                                <div class="col-sm-7">
                                    <div class="media">
                                        <img class="mr-3" src="{{ asset($item->user->avatar) }}" alt="">
                                        <div class="media-body">
                                            <h5 class="mt-0 forum-title">{{ $item->title }}</h5>
                                            <p class="forum-short-desc">{{ $item->user->name }}</p>
                                            <h6 class="mt-2 font-weight-bold">{{ $item->created_at->diffForHumans() }}</h6>
                                            <hr class="my-2">
                                            <span class="badge badge-secondary" title="Category"><i class="fas fa-tag"></i> {{ $item->forumCategory->title }}</span>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-5 text-right m-auto">
                                    <span class="badge badge-success" title="Likes"><i class="fas fa-thumbs-up"></i> {{ $item->forum_reactions_count }}</span>
                                    <span class="badge badge-info" title="Views"><i class="fas fa-eye"></i> {{ $item->views }}</span>
                                    <span class="badge badge-dark" title="Comments"><i class="fas fa-comments"></i> {{ $item->forum_comments_count }}</span>
                                </div>
                            </div>
                        </a>
                    </div>
                @endforeach

                <div class="text-center">{{ $forums->onEachSide(5)->links() }}</div>



            </div>

        </div> 
    </div>
</div>


@auth
<div class="modal fade" id="modalStartDiscussion" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" style="max-width:90% !important" role="document">
    <div class="modal-content">
      <div class="modal-header p-2">
        <h6 class="modal-title">What you want to discuss?</h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" action="{{ route('community.create') }}">
          @csrf

          <div class="row mb-3">
              <div class="col-lg-6">
                  <input type="text" required="" name="title" placeholder="Discussion title" class="form-control">
              </div>
              <div class="col-lg-6">
                <select class="form-control" required="" name="forum_category_id">
                    <option hidden="">Category</option>
                    @foreach(forumCategories() as $item)
                        <option value="{{ $item->id }}">#{{ $item->title }}</option>
                    @endforeach
                </select>
              </div>
              
          </div>          
          <textarea id="summernote" required="" name="description" class="form-control"></textarea>

      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-dark">Post Discussion</button>
      </div>       
    </form>
    </div>
  </div>
</div>
@endauth




@endsection


@section('js')
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
      $('#summernote').summernote({
        placeholder: 'Write your discussion...',
        tabsize: 2,
        height: 350
      });
    </script>
@endsection