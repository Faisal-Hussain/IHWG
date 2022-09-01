<ul  class="list-group text-left shadow-sm">

    <li class="list-group-item p-1 text-info cursor-nothing">Users</li>

    @forelse($users as $item)
    <li class="list-group-item p-1 border-0 append-name">
        <a href="{{ route('social.connection.profile', [$item->user_name ?? '',$item->slug] ) }}" target="_blank">
            <div class="media">
                <img class="profile-avatar-small" src="{{ asset($item->avatar) }}">
                <div class="media-body pl-2">
                    <h5 class="mt-0 mb-0">{{ $item->name }}</h5>
                    <small class="text-success font-weight-bold">{{ $item->role }}</small>
                </div>
            </div>
        </a>
        
    </li>
    @empty
    @endforelse


    <li class="list-group-item p-1 text-success cursor-nothing">Groups</li>

    @forelse($groups as $item)
        <li class="list-group-item p-1 border-0 append-name">
            <a href="{{ route('social.group.detail', Crypt::encrypt($item->id)) }}" target="_blank">
                <div class="media">
                    <div class="media-body pl-2">
                        <h5 class="mt-0 mb-0">{{ $item->title }}</h5>
                    </div>
                </div>
            </a>
            
        </li>
    @empty
    @endforelse

    <li class="list-group-item p-1 text-warning cursor-nothing">Tags</li>

    @forelse($tags as $item)
    <li class="list-group-item p-1 border-0 append-name">
        <a class="btn-tag">
            <div class="media">
                <div class="media-body pl-2">
                    <h5 class="mt-0 mb-0">{{ $item->title }}</h5>
                </div>
            </div>
        </a>
        
    </li>
    @empty
    @endforelse


</ul>


