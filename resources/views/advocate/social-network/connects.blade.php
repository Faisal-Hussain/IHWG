@if(count($connects)>0)
    @foreach($connects as $connect)

        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="media">
                            <img class="mr-1 profile-avatar-small"
                                 src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                            <div class="media-body">
                                <small class="mt-0 font-weight-bold">{{$connect->name}}</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 m-auto text-center">

                        @if(count(checkFollower(\Illuminate\Support\Facades\Auth::id(),$connect->id))>0)
                            <div class="un_follow_btn_div">
                                <form action="{{route('user.unfollow',$connect->id)}}" method="post">
                                    @csrf
                                    <input type="hidden" name="leader_id" value="{{$connect->id}}">
                                    <input type="hidden" class="un_follow_url" value="{{route('user.unfollow',$connect->id)}}">
                                    <button type="submit" data-url="{{route('user.unfollow',$connect->id)}}" class="btn btn-warning un_follow_btn float-right">UnFollow</button>
                                </form>
                            </div>
                        @else

                            <div class="follow_btn_div">
                                <form action="{{route('user.follow',$connect->id)}}" method="post">
                                    @csrf
                                    <input type="hidden" name="leader_id" value="{{$connect->id}}">
                                    <input type="hidden" class="un_follow_url" value="{{route('user.unfollow',$connect->id)}}">

                                    <button type="submit" data-url="{{route('user.follow',$connect->id)}}" class="btn btn-success follow_btn float-right">Follow</button>
                                </form>
                            </div>
                        @endif

                    </div>
                </div>

            </div>
        </div>

    @endforeach
@else
    <p>No Connect Exist of this name</p>
@endif
