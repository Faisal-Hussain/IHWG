<div class="row">
    <div class="col-sm-12">
        @include('vendor.social-network.components.social_network_navbar')
        <div class="card">
            <div class="card-body">
                <h3 class="p-0 m-0 font-weight-bold">Following Group(s)</h3>
            </div>
        </div>
    </div>
    


    @forelse(Auth::user()->userSocialGroups as $group)

        <div class="col-sm-6 group-card">
            <div class="card p-1">
                <div class="card-header d-flex align-items-start pb-2 pt-2">

                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <img src="{{ asset($group->avatar) }}" class="group-avatar">
                        </div>
                    </div>
                        <h3 class="text-bold-700 mb-0"><a href="{{ route('social.group.detail', Crypt::encrypt($group->id)) }}" target="_blank">{{ $group->title }}</a></h3>
                </div>
                <a class="btn gradient-light-primary font-weight-bold btn-unfollow-group text-white" data-group-id="group-{{ $group->id }}" data-id="{{ Crypt::encrypt($group->id) }}">Unfollow</a>
            </div>
        </div>

    @empty
        <div class="text-center m-auto">
            <h6 class="alert alert-danger">You have not follow any group yet. Go top to search and follow now</h6>
        </div>

    @endforelse


</div>


<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">
                <h3 class="p-0 m-0 font-weight-bold">My Group(s)</h3>
                <a class="text-primary" data-toggle="modal" data-target="#modalCreateGroup">Create new group</a>
            </div>
        </div>
    </div>
    


    @foreach(Auth::user()->userGroups as $group)

        <div class="col-sm-6 group-card">
            <div class="card p-1">
                <div class=" card-title">
                    <a href="{{route('social.group.delete',encrypt($group->id))}}" class="btn btn-danger float-right btn-sm">Delete</a>

                </div>
                <div class="card-header d-flex align-items-start pb-2 pt-2">

                    <div class="avatar bg-rgba-primary p-50 m-0">
                        <div class="avatar-content">
                            <img src="{{ asset($group->avatar) }}" class="group-avatar">
                        </div>
                    </div>
                        <h3 class="text-bold-700 mb-0"><a href="{{ route('social.group.detail', Crypt::encrypt($group->id)) }}" target="_blank">{{ $group->title }}</a></h3>
                </div>
            </div>
        </div>

    @endforeach


</div>









