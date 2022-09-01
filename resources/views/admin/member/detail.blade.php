@extends('layouts.admin')
@section('title',$user->name.' Details')
@section('heading',$user->name.' Details')

@section('content')

    <div class="row">
        <!-- account start -->
        <div class="col-12">
            <div class="card">

                <div class="card-body">
                    <div class="row">


                        <div class="col-lg-3">
                           <img src="{{asset($user->avatar)}}" class="w-100">
                            <div class="btn-group mt-3">



                                @if($user->status=='active')
                                <a href="{{route('admin.member.update',['id'=>$user->id,'verify'=>'block'])}}" class="btn btn-warning">Disable</a>
                                @else($user->role!='homeopath')
                                    <a href="{{route('admin.member.update',['id'=>$user->id,'verify'=>'active'])}}" class="btn btn-primary">Active</a>
                                @endif
                               {{--  
                                @if($user->status=='disabled' && $user->role=='homeopath')
                                    <a href="{{route('admin.member.update',['id'=>$user->id,'verify'=>'active'])}}" class="btn btn-success">Verify</a>
                                @elseif($user->role=='homeopath')
                                <a href="{{route('admin.member.update',['id'=>$user->id,'verify'=>'block'])}}" class="btn btn-warning">Disable</a>
                                @endif --}}
                                    <a href="{{route('admin.member.delete',['id'=>$user->id,'verify'=>$user->role])}}" class="btn btn-danger alert-confirm">Delete</a>
                            </div>
                        </div>
                        <div class="col-lg-9">
                            <ul class="list-group">
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">Name</strong>
                                    <span>{{ $user->name }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">User Name</strong>
                                    <span>{{ $user->user_name }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">Email</strong>
                                    <span>{{ $user->email }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">Phone</strong>
                                    <span>{{ $user->phone }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">Role</strong>
                                    <span>{{ $user->role }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    <strong class="text-success">Status</strong>
                                    <span>
                                        @if($user->status=='active')<sapn class="badge badge-success">{{$user->status}} </sapn>@else <sapn class="badge badge-danger">{{$user->status}} </sapn> @endif
                                    </span>
                                </li>

                            </ul>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- account end -->


        <!-- information start -->

            @if($user->role=='homeopath')

            @if(isset($user->HomeopathProfile))

                <div class="col-md-12 col-12 ">
                    <div class="card">  
                        <div class="card-body">
                            <h3>Profile detail</h3>

                            <ul class="list-group">
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success">Registraion Number</strong>
                                        <span class="badge badge-dark">{{ $user->HomeopathProfile->registration_number ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">designation</strong>
                                        <span>{{ $user->HomeopathProfile->designation ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">caption</strong>
                                        <span>{{ $user->HomeopathProfile->caption ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">specializations</strong>
                                        <span>{{ $user->HomeopathProfile->specializations ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">location</strong>
                                        <span>{{ $user->HomeopathProfile->location ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">certifications</strong>
                                        @if(json_decode($user->HomeopathProfile->certifications))
                                            @foreach(json_decode($user->HomeopathProfile->certifications) as $item)
                                                <a target="_blank" href="{{asset($item)}}"><span class="badge badge-success float-left">View File</span></a>
                                            @endforeach
                                            @else
                                            N/A
                                        @endif
                                        
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">Educational Designation</strong>
                                        @if(json_decode($user->HomeopathProfile->edu_designation))
                                            @foreach(json_decode($user->HomeopathProfile->edu_designation) as $item)
                                                <a target="_blank" href="{{asset($item)}}"><span class="badge badge-info float-left">View File</span></a>
                                            @endforeach
                                            @else
                                            N/A
                                        @endif
                                        
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">affiliations</strong>
                                        <span>{{ $user->HomeopathProfile->affiliations ?? '' }}</span>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                        <strong class="text-success text-capitalize">estabilished at</strong>
                                        <span>{{ $user->HomeopathProfile->estabilished_at ?? '' }} year ago</span>
                                    </li>
                                    
                                    
                                </ul>

                        </div>
                    </div>
                </div>

            @endif



            <div class="col-md-12 col-12 ">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title mb-2">Services</div>
                    </div>
                    <div class="card-body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Image</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Duration</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($user->HomeopathServices as $service)
                                <tr>
                                    <td>
                                        <img src="{{asset($service->thumbnail)}}" class="w-50">
                                    </td>
                                    <td>{{ $service->title }}</td>
                                    <td>$ {{ $service->price }}</td>
                                    <td class="font-weight-bold">{{$service->duration}}</td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            @endif

        <!-- information start -->

    </div>
@endsection
