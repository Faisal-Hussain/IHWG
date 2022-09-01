@extends('layouts.social_network')
@section('title','Social Media')
@section('css')
<style>
.item img {
    max-width: 87%;
    height: auto;
}
/*.social-acl
{
    background-color: #9bc1b9;
    height: 16vh;
    border-radius: 7px;
    padding: 5px;
    width: 85%;
    text-align: center;
    display: table;
}
.social-acl div
{
    display: table-cell; 
    vertical-align: middle;
}*/
</style>
@endsection

@section('content')

    <div id="user-profile">

        <section id="profile-info">

            <div class="row">

                <div class="col-lg-3 col-12" id="left">

                    <div class="card">
                        <div class="card-body">
                            
                            <a href="#" onclick="goBack()" class="social_back_btn">
                                <i class="fas fa-arrow-left"></i>
                            </a>
                            <div class="text-center">
                                <img class="profile-avatar mb-1" src="{{ asset(Auth::user()->avatar) }}" alt="{{ Auth::user()->name }}">
                                <h6 class="m-0">{{ Auth::user()->name }}</h6>
                                <small class="location">{{ Auth::user()->userSocialProfile->location ?? 'N/A' }}</small>

                                <div class="row mt-2 account-counter">
                                   <!--  <div class="col-lg-12">
                                        <div class="row px-2">
                                            <div class="col-sm-4 col-4 item">
                                                <strong>{{ count(Auth::user()->socialPosts) }}</strong>
                                                <small>POSTS</small>
                                            </div>
                                            <div class="col-sm-4 col-4 item">
                                                <strong class="connections-count">{{ count(Auth::user()->userFollowers) }}</strong>
                                                <small>CONNECTIONS</small>
                                               
                                            </div>
                                            <div class="col-sm-4 col-4 item">
                                                <strong class="group-count">{{ count(Auth::user()->userSocialGroups) }}</strong>
                                                <small>GROUPS</small>
                                               
                                            </div>

                                        </div>
                                    </div> -->
                                    <div class="vendors-list-profile-details pt-1 m-auto">

                                            <div class="v-box1 social-badges">

                                               
                                                <div class="item" style="background-color: transparent;">
                                                    <div>
                                                        <strong>{{ count(Auth::user()->socialPosts) }}</strong><br>
                                                         <small>POSTS </small>
                                                    </div>

                                                </div>

                                                <div class="item" style="background-color: transparent;">
                                                    <div>
                                                      <strong class="connections-count">{{ count(Auth::user()->userFollowers) }}</strong>
                                                     <small>CONNECTIONS</small>
                                                    </div>
                                                </div>

                                                <div class="item" style="background-color: transparent;">
                                                    <div>
                                                        <strong class="group-count">{{ count(Auth::user()->userSocialGroups) }}</strong>
                                                        <small>GROUPS</small>
                                                    </div>
                                                </div>
                                                

                                            </div>
                                        </div>  

                                       <div class="vendors-list-profile-details pt-1 m-auto">

                                            <div class="v-box1 social-badges">

                                                <div class="item bg-transparent">
                                                        <img src="{{ asset(badge(Auth::user()->badge)['path']) }}" title="{{ badge(Auth::user()->badge)['title'] }}">

                                                </div>

                                                <div class="item" style="background-color: #9bc1b9;">
                                                    <div>
                                                        <h3 class="pb-0 mb-0">{{ count(getHomeopathBookings(Auth::user()->id)) }}</h3>
                                                        Booking Milestone
                                                    </div>
                                                </div>

                                                <div class="item" style="">
                                                    <div>
                                                        <h3 class="pb-0 mb-0">{{ Auth::user()->created_at->diffInMonths()??'' }}</h3>
                                                        Months
                                                    </div>
                                                </div>
                                                

                                            </div>
                                        </div>
                                        


                                </div>
                            </div>

                            <hr class="my-2">
                            <div class="account-sidebar-links ml-1 main-clickable-links">
                                <a data-page="news_feed" class="news_feed"><i class="fas fa-comment-alt"></i> News Feed</a>
                                <a data-page="messages" class="messages"><i class="fas fa-inbox" style="padding-right:34px !important;"></i>Messages</a>
                                <a data-page="about" class="about"><i class="fas fa-info-circle"></i> About</a>
                                <a data-page="events" class="events"><i class="fas fa-comment-alt pr-1"></i> Events</a>
                                <a data-page="connections" class="connections"><i class="fas fa-user-alt"></i> Connections</a>
                                <a data-page="groups" class="groups"><i class="fas fa-users"></i> Groups</a>
                                <a data-page="media" class="media"><i class="fas fa-camera"></i> Media</a>

                            </div>

                        </div>
                    </div>

                        <div class="groups-connection-card">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 text-left mb-2">
                                            <strong>Connections</strong>
                                        </div>

                                        @foreach(Auth::user()->userFollowers->sortByDesc('id') as $follower)
                                            @if($follower->id!=Auth::user()->id)

                                                <div class="col-sm-4 col-4 mb-2 p-0 {{ $follower->user_name }}">
                                                    <a href="{{ route('social.connection.profile', [$follower->user_name ?? '',$follower->slug??'']) }}" class="text-dark" target="_blank">
                                                        <img class="profile-avatar-small" src="{{ asset($follower->avatar) }}" alt="">
                                                        <small>{{ $follower->name }}</small>
                                                    </a>
                                                </div>

                                            @if($loop->iteration == 9)
                                                <div class="col-md-12 text-right main-clickable-links">
                                                    <a data-page="connections" class="btn-social-dark">View more connections</a>
                                                </div>
                                                @break
                                            @endif

                                            @endif

                                        @endforeach


                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row text-left">
                                        <div class="col-sm-12 mb-2">
                                            <strong>Groups</strong>
                                        </div>

                                        @foreach(Auth::user()->userSocialGroups->sortByDesc('id') as $group)
                                            <div class="col-sm-12 mb-2 group-{{ $group->id }}">
                                                <a href="{{ route('social.group.detail', Crypt::encrypt($group->id)) }}" target="_blank" class="text-dark">
                                                    <img class="profile-avatar-small" src="{{ asset($group->avatar) }}" alt="">
                                                    <strong class="pl-1">{{ $group->title }}</strong>
                                                </a>
                                            </div>

                                            @if($loop->iteration == 9)
                                                <div class="col-md-12 text-right main-clickable-links">
                                                    <a data-page="groups" class="btn-social-dark">View more connections</a>
                                                </div>
                                                @break
                                            @endif

                                        @endforeach

                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 text-left mb-2">
                                            <strong title="Members that are following you">Followers</strong>
                                        </div>

                                        @foreach(Auth::user()->userFollowings->sortByDesc('id')->take(9) as $follower)
                                            <div class="col-sm-4 col-4 mb-2 p-0 {{ $follower->user_name }}">
                                                <a href="{{ route('social.connection.profile', $follower->user_name ?? '') }}" class="text-dark" target="_blank">
                                                    <img class="profile-avatar-small" src="{{ asset($follower->avatar) }}" alt="">
                                                    <small>{{ $follower->name }}</small>
                                                </a>
                                            </div>


                                        @endforeach


                                    </div>

                                </div>
                            </div>


                        </div>


                </div>


                <!--=============================================-->
                          <!--======RENDER PAGES======-->
                <!--=============================================-->


                <div class="col-lg-9 render-page" id="center">

                    <!-- {{-- @include('vendor.social-network.pages.news_feed') --}} -->
                </div>

                <!--=============================================-->
                        <!--======END RENDER PAGES======-->
                <!--=============================================-->



            </div>
        </section>
    </div>




@endsection
@section('js')

    <script>

        var page = 1; //track user scroll as page number, right now page number is 1
        // load_more(page); //initial content load
        $(window).scroll(function() { //detect page scroll
            if($(window).scrollTop() + $(window).height() >= $(document).height()) { //if user scrolled from top to bottom of the page
                page++; //page number increment
                load_more(page); //load content
            }
        });



        function load_more(page){
           var sPageURL = window.location.search.substring(1),
            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

            $.ajax({
                url: '{{ route('social.render.page') }}?'+sURLVariables+'&page=' + page,
                type: "get",
                datatype: "html",
                beforeSend: function()
                {
                    $('.auto-load').show();
                },

            })
                .done(function(data)
                {
                    if(data.length == 0){
                        console.log(data.length);
                        //notify user if nothing to load
                        $('.auto-load').html("No more records!");
                        return;
                    }
                    $('.auto-load').hide();


                    $("#results").append(data);
                    convertInTags();
                })
        }

    </script>

@endsection

