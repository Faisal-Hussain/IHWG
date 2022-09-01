@extends('layouts.social_network')
@section('title', $group->title)
@section('css')
@endsection
@section('content')




<div id="user-profile">
    <section id="profile-info">
        <div class="row pb-5 px-4">
            <div class="col-md-12 mx-auto">
                
                <!-- Profile widget -->
                <div class=" ">
                    <div class="px-4 pt-0 pb-4 cover-profile" style="background-image: url('{{ asset($group->cover ?? '') }}');">
                        <div class="media align-items-end profile-head">
                            <div class="profile mr-3 mb-2"><img src="{{ asset($group->avatar) }}" alt="{{ $group->name }}" width="130" class="rounded mb-2 img-thumbnail">
                            </div>
                            
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-10 col-lg-10 offset-lg-2 m-auto py-1">
                            <h1 class="font-weight-bold">{{$group->title }}</h1>
                            <h4 class="float-left">{{ count($group->userFollowers) }} Members</h4>
                        </div>
                    </div>

                <div class="row bg-white py-1 m-0 rounded">
                    <div class="col-sm-6">

                        @if(Auth::id() == $group->user_id || checkGroupFollowing(Auth::id(), $group->id) > 0) 

                            <div class="media">
                                <img class="mr-1 profile-avatar-small" src="{{ asset(Auth::user()->avatar) }}" alt="{{ Auth::user()->name }}">
                                <div class="media-body post-feed-section pt-0">


                                    <button 
                                        class="btn-post btn-block text-primary font-weight-bold border-0" 
                                        data-toggle="popover" 
                                        data-html="true" 
                                        data-trigger="focus"
                                        data-content='
                                            <img class="pop-over-icon input-type" data-value="News" data-user_social_group_id="{{Crypt::encrypt($group->id)}}" src="{{ asset('front/assets/icons/news_feed.png') }}"/>
                                            <img class="pop-over-icon input-type" data-value="Resources" data-user_social_group_id="{{Crypt::encrypt($group->id)}}" src="{{ asset('front/assets/icons/resources.png') }}"/>
                                            <img class="pop-over-icon input-type" data-value="Articals" data-user_social_group_id="{{Crypt::encrypt($group->id)}}" src="{{ asset('front/assets/icons/articles.png') }}"/>
                                            ' 
                                        data-placement="top"      
                                    >
                                        Share something with the community!
                                    </button>

                                </div>
                            </div>

                        @endif
                    </div>
                    <div class="col-sm-6 text-right m-auto">
                        @if(Auth::id() == $group->user_id) 
                                        
                                        <a href="" class="font-weight-bold px-1"  data-toggle="modal" data-target="#modalUpdateGroup">Update Info</a>
                                        
                                        <a data-toggle="modal" data-target="#modalGroupMembers" class="font-weight-bold text-primary px-1">Pending members request ({{ count($group->pendingUserFollowers) ?? 0 }})</a>
                                        @else
                                        @if(checkGroupFollowing(Auth::id(), $group->id) > 0)
                                        <a class="text-danger font-weight-bold btn-unfollow-group"  data-group-id="group-{{ $group->id }}" data-id="{{ Crypt::encrypt($group->id) }}">Unfollow</a>
                                        
                                        @else
                                        <a class="text-primary font-weight-bold btn-unfollow-group" data-group-id="group-{{ $group->id }}" data-id="{{ Crypt::encrypt($group->id) }}">Follow</a>
                                        @endif
                                        
                            @endif
                            <button class="btn-invite-group rounded" title="Invite member" data-toggle="modal" data-target="#modalInviteGroupMember">+ Invite</button>
                    </div>

                </div>
                       

                    <div class=" ">
                        <div class="row">
                            <div class="col-sm-3 col-md-3 mt-2">
                                <div class="card">
                                    <a class=" btn btn-success text-white" data-toggle="modal" data-target="#modalCreateGroup">Create new group +</a>
                                    <div class="card-body text-center">
                                        
                                        <div class="row text-center">

                                            <div class="col-sm-12 mb-1">

                                                <h4 class="font-weight-bold text-left">Groups you've joined</h2>
                                                
                                            </div>

                                                @foreach(Auth::user()->userSocialGroups->sortByDesc('id')->take(6) as $grp)
                                                    <div class="col-sm-12 text-left mb-2 group-{{ $grp->id }}">
                                                        <a href="{{ route('social.group.detail', Crypt::encrypt($grp->id)) }}" target="_blank" class="text-dark">
                                                            <img class="profile-avatar-small" src="{{ asset($grp->avatar) }}" alt="">
                                                            <strong>{{ $grp->title }}</strong>
                                                        </a>
                                                    </div>
                                                 @endforeach
                                            
                                        </div>
                                        <hr>    
                                    </div>
                                </div>
                                
                            </div>
                            
                            <div class="col-sm-6 mt-2">
                                <div class="results" id="results"></div>
                            </div>

                            <div class="col-sm-3 mt-2">
                                
                               

                                <div class="card">
                                    
                                    <div class="card-body">
                                        
                                        <div class="row">

                                            <div class="col-sm-12 mb-1">

                                                <h5 class="font-weight-bold text-left">About</h2>
                                                <small class="justify-content-center">{{ $group->description ?? '' }}</small>
                                                
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2 col-md-2 col-lg-2">
                                               <h5 class="float-left"><i class="fa fa-users"></i></h5> 
                                            </div>
                                            <div class="col-sm-10 col-md-10 col-lg-10">
                                               <h5 class="float-left">General</h5> 
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-sm-2 col-md-2 col-lg-2">
                                               <h5 class="float-left"><i class="fa fa-eye"></i></h5> 
                                            </div>
                                            <div class="col-sm-10 col-md-10 col-lg-10">
                                               <h5 class="float-left">Visible</h5> 
                                            </div>

                                        </div>
                                        <hr>    
                                    </div>
                                </div>

                                <div class="card">
                                    
                                    <div class="card-body">
                                        
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12">
                                                <h4 class="font-weight-bold">Recent Media</h4>
                                            </div>

                                            @foreach($group->userGroupPosts as $key=> $post)
                                            @if($key<10 && $post->media_type=='photo')
                                            <div class="col-sm-12 col-md-6 mb-1">
                                                <img src="{{asset($post->file)}}" class="w-100">
                                            </div>
                                            @endif
                                            @endforeach
                                        </div>   
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>
<!--============================================================-->
<!--UPDATE GROUP MODAL-->
<!--============================================================-->
<div class="modal fade" id="modalUpdateGroup" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Update group information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="{{ route('social.group.update') }}" method="post" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="group_id" value="{{ Crypt::encrypt($group->id); }}">
                <div class="modal-body">
                    <label>Group name *</label>
                    <input type="text" class="form-control" name="title" required="" placeholder="Group name" value="{{ $group->title }}">
                    @if($errors->has('title'))
                    <div class="text-danger">{{ $errors->first('title') }}</div>
                    @endif
                    
                    <label>About *</label>
                    <input type="text" class="form-control" name="description" required="" placeholder="About group" value="{{ $group->description }}">
                    @if($errors->has('description'))
                    <div class="text-danger">{{ $errors->first('description') }}</div>
                    @endif
                    <label>Group Profile *</label>
                    <input type="file" class="form-control dropify" name="avatar" data-default-file="{{asset($group->avatar ?? '')}}">
                    @error('avatar')
                    <div class="text-danger">{{ $errors->first('avatar') }}</div>
                    @enderror
                    <label>Group Avatar *</label>
                    <input type="file" class="form-control dropify" name="cover" data-default-file="{{asset($group->cover ?? '')}}">
                    @if($errors->has('cover'))
                    <div class="text-danger">{{ $errors->first('cover') }}</div>
                    @endif
                    
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Update changes</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!--============================================================-->
                <!--MEMBERS OF GROUP MODAL-->
<!--============================================================-->
<div class="modal fade" id="modalGroupMembers" tabindex="-1">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Pending Member(s)</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body pt-0">
            @foreach($group->pendingUserFollowers as $pending)
                <div class="row border-bottom py-1 mt-0">
                    <div class="col-sm-6">
                    <h5 class="p-0 m-0"><a href="{{ route('social.connection.profile', $pending->user_name ?? '' ) }}" class="font-weight-bold" target="_blank">{{ $pending->name }}</a></h5>
                </div> 
                <div class="col-sm-6 text-right">
                    <a 
                    href="{{ route('social.group.request.action', ['action' => 'accept', 'group_id' => base64_encode($group->id), 'user_id' => base64_encode($pending->id)]) }}" 
                    class="text-success font-weight-bold">Accept</a>
                    <a href="{{ route('social.group.request.action', ['action' => 'reject', 'group_id' => base64_encode($group->id), 'user_id' => base64_encode($pending->id)]) }}" class="text-danger font-weight-bold pl-1">Reject</a>
                </div>
                </div>
            @endforeach  
      </div>
    </div>
  </div>
</div>




<!--============================================================-->
                <!--INVITE MEMBER MODAL-->
<!--============================================================-->
<div class="modal fade" id="modalInviteGroupMember">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Invite Member to join group</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>

      <form action="{{ route('send.group.invitation') }}" method="POST">
        @csrf
          <div class="modal-body">
            <input type="hidden" name="group_id" value="{{ Crypt::encrypt($group->id) }}">
            <label>Write the member email here to send invitation mail <span class="text-danger">*</span></label>
            <input type="email" name="email" required class="form-control">
          </div>
          <div class="modal-footer">
            <button type="submit" class="btn-invite-group rounded">Invite member</button>
          </div>
      </form>
    </div>
  </div>
</div>



<a href="{{ route('social.index') }}" class="report-float bg-dark" title="Go to Newsfeed">
    <i class="fas fa-home"></i>
</a>
                                    

@endsection
@section('js')



    <script>
        
        var page = 1;
        load_more(page);

        $(window).scroll(function() { 
            
            if($(window).scrollTop() + $(window).height() >= $(document).height()) 
            {
                page++; 
                load_more(page); 
            }
        });

        function load_more(page){
            $.ajax({
                url: '?page=' + page,
                type: "get",
                datatype: "html",
                beforeSend: function()
                {
                    $('.auto-load').show();
                },

            })
            .done(function(data)
            {
                if(data.length == 0)
                {
                    $('.auto-load').html("No more records!");
                    return;
                }
            
                $('.auto-load').hide();
                $("#results").append(data);
                    
            });
        }
    </script>


@endsection

























