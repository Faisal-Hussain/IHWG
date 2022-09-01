@extends('layouts.social_network')
@section('title', $user->name)


@section('css')
@endsection

@section('content')
<div id="user-profile">
    <section id="profile-info">
        <div class="row pb-5 px-4">
    <div class="col-md-12 mx-auto">
                <a href="{{ route('social.index') }}">
                    <div class=" goto-back-section" >
                        Go to Newsfeed
                    </div>
                </a>
        <!-- Profile widget -->
        <div class="">
            <div class="px-4 pt-0 pb-4 cover-profile" style="background-image: url('{{ asset($user->userSocialProfile->cover ?? '') }}');">
                <div class="media align-items-end profile-head">
                    <div class="profile mr-3 mb-2"><img src="{{ asset($user->avatar) }}" alt="{{ $user->name }}" width="130" class="rounded mb-2 img-thumbnail">
                    </div>


                    <div class="media-body mb-5 text-white">
                        <h4 class="mt-0 mb-0"><span class="bg-dark px-1 text-white" style="opacity: 0.9;">{{ $user->name }}</span></h4>
                        <p class="small mb-4"> <i class="fas fa-info-circle mr-1"></i>{{ $user->userSocialProfile->caption ?? '' }}</p>
                    </div>
                </div>
            </div>

            <div class="">

                        <div class="row">



                                <div class="col-sm-3 mt-2">
                                    <div class="card">
                                        
                                        <div class="card-body text-center">

                                        <div class="v-box1 text-center">
                                            
                                            <div class="item" style="background-color: #82f195;">
                                                <div>
                                                    <span class="txt20">{{ count($user->socialPosts) ?? 0 }}</span><br>
                                                    <span class="txt9">Posts</span>
                                                </div>
                                            </div>
                                            <div class="item" style="background-color: #6ecdf1;">
                                                <div>
                                                    <span class="txt20">{{ count($user->userFollowers) ?? 0 }}</span><br>
                                                    <span class="txt9">Members</span>
                                                </div>
                                            </div>
                                            <div class="item" style="background-color: #D4B89B;">
                                                <div>
                                                    <span class="txt20">{{badgesInformation($user->id)['articals']??0 }}</span><br>
                                                    <span class="txt9">Articles</span>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="v-box1 text-center">
                                            
                                            <div class="item" style="background-color: #ADBEEA;">
                                                <div>
                                                    <span class="txt20">{{badgesInformation($user->id)['events']??0  }}</span><br>
                                                    <span class="txt9">Events </span>
                                                </div>
                                            </div>
                                            <div class="item" style="background-color: #B1D09D;">
                                                <div>
                                                    <span class="txt20">{{ count($user->socialPosts) ?? 0 }}</span><br>
                                                    <span class="txt9">Attended Events </span>
                                                </div>
                                            </div>

                                            <div class="item" style="background-color: #F2F2F2;">
                                                <div>
                                                    <span class="txt20">{{ $user->created_at->diffForHumans() }}</span><br>
                                                    <span class="txt9"> </span>
                                                </div>
                                            </div>
                                            
                                            
                                        </div>
                                        
                                                                                          
                                            <hr>
                                            @if(!Auth::user()->id != $user->id)
                                            <div class="btn-group">
                                                
                                            
                                            <a class="btn btn-success text-white btn-connect text-capitalize font-weight-bold" data-id="{{ Crypt::encrypt($user->id) }}">
                                                @if(checkUserFollowing(Auth::id(), $user->id) > 0)
                                                    Unfollow
                                                @else
                                                    Follow
                                                @endif
                                            </a>
                                            
                                            <a data-toggle="modal" data-target="#exampleModal" href="javascript:void()" data-id="{{$user->id}}"  class="btn btn-dark">Message</a>

                                            </div>
                                            @endif
                                            

                                            <hr>
                                            <p>{{ $user->userSocialProfile->about ?? '' }}</p>

                                            
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="col-sm-9 mt-2">

                                    <div class="results" id="results"></div>
                                </div>



                        </div>


            </div>

        </div>
    </div>
</div>
    </section>
</div>



    <!-- modal for first msg!-->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <form method="post" action="{{route('social.connection.send.message',$user->id)}}" id="first_msg_form">
            @csrf
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Send Message </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="{{$user->id}}" name="receiver_id">
                    <input type="hidden" value="0" name="con_id">
                    <textarea name="message" rows="5" class="form-control border-0 border-white" placeholder="Write here message..."></textarea>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Send Now</button>
                </div>
            </div>
        </form>
    </div>
</div>


        
        @if(Auth::user()->role == 'advocate' || Auth::user()->role == 'homeopath')
                <a data-toggle="modal" data-target="#modalReportUser" class="report-float" title="Report {{ $user->name ?? '' }}">
                    <i class="far fa-flag"></i>
                </a>


                    <div class="modal fade" id="modalReportUser" tabindex="-1" role="dialog">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content rounded-0">
                          <div class="modal-header rounded-0" style="background:#546E7A;">
                            <h5 class="modal-title text-white">Report {{ $user->name ?? '' }}</h5>
                          </div>
                            <form method="post" action="{{ route('social.report.user') }}">
                                @csrf
                                <input type="hidden" name="user_id" value="{{ Crypt::encrypt($user->id) }}">
                                  <div class="modal-body">
                                    <textarea name="reason" placeholder="You are reporting! We want to here from you about report, but please don’t send irrelevent information. Right the report here." required=""></textarea>
                                  </div>

                                  <div class="py-1 px-1" style="background-color: #FAFAFA;">
                                      
                                    <select class="form-control" required="" name="type">
                                        <option value="Bad Content">Bad Content</option>
                                        <option value="Hateful or abusive">Hateful or abusive</option>
                                        <option value="Harassment or bullying">Harassment or bullying</option>
                                        <option value="Harmful or dangerous acts">Harmful or dangerous acts</option>
                                        <option value="Child abuse">Child abuse</option>
                                        <option value="Promotes terrorism">Promotes terrorism</option>
                                        <option value="Spam or misleading">Spam or misleading</option>
                                        <option value="Infringes my rights">Infringes my rights</option>
                                        <option value="Captions issue">Captions issue</option>
                                        <option value="misleading">Misleading</option>
                                    </select>

                                    <small>Users are reviewed by CHWG staff 24 hours a day, 7 days a week to determine whether they violate Community Guidelines. 
                                  Accounts are penalized for Community Guidelines violations, and serious or repeated violations can lead to account termination.</small>

                                  </div>

                                  <div class="modal-footer">
                                    <button type="button" class="btn font-weight-bold" data-dismiss="modal">CANCEL</button>
                                    <button type="submit" class="btn text-primary font-weight-bold">REPORT</button>
                                  </div>
                            </form>
                        </div>
                      </div>
                    </div>

        @endif







@endsection

@section('js')
    <script>
        $(document).on('click', '.btn-connect', function(){

            $id = $(this).data('id');
            $self  = $(this);

                $.ajax({
                  type: 'GET',
                  url: '{{ route('social.connect.disconnect') }}?id='+$id,
                  success: function (response) {
                    toastr.success('You have '+response+' the connection.');
                    response == 'followed' ? $self.text('Unfollow') : $self.text('Follow');
                    }

                });




        })
    </script>

    <script>
        $(document).on('submit','#first_msg_form',function (e){
            e.preventDefault()
            $('#exampleModal').modal('hide')
            toastr.success('Your Message is send Successfully')
            var url=$(this).attr('action')
            var data=$(this).serialize()
            $.ajax({
                method:'post',
                url:url,
                data:data,
                success:function (data)
                {
                    window.location.href='{{ route('social.social.network') }}?p=messages'

                }
            })


        })

    </script>


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




