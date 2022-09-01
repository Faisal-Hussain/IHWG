<div class="row connections-section">
    <div class="col-lg-12">
        @include('vendor.social-network.components.social_network_navbar')
        <div class="card">
            <div class="card-body">
                <h3 class="p-0 m-0 font-weight-bold">Connection(s)</h3>
            </div>
        </div>
        <div class="row">


            @foreach(Auth::user()->userFollowers as $follower)
                <div class="col-sm-3 connections-card">
                    <div class="card">
                        <div class="card-content">
                            
                            <div class="card-body text-center p-1">
                                <img src="{{ asset($follower->avatar) }}" alt="img placeholder">
                                <h4 class="mt-1 font-weight-bold"><a href="{{ route('social.connection.profile', $follower->user_name) }}" target="_blank">{{ $follower->name }}</a></h4>
                                <h6 class="text-success">{{ $follower->role }}</h6>
                                <button class="btn gradient-light-primary btn-block mt-1 font-weight-bold btn-unfollow" data-page="connection" data-name="{{ $follower->user_name }}" data-id="{{ Crypt::encrypt($follower->id) }}">Unfollow</button>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach

        </div>
    </div>
</div>