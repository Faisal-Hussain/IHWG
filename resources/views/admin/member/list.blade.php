@extends('layouts.admin')

@section('title',ucfirst($users[0]->role??'').' '.'Members')
@section('heading',ucfirst($users[0]->role??'').' '.'Members')

@section('css')

@endsection
@section('content')

    <div class="row">

        <div class="col-sm-12">
            <div class="card">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body pb-0">
                           <div class="row">
                               <div class="col-md-12 input-group">
                                   <select name="status" class="form-inline form-control" id="status">
                                       <option  value="{{route('admin.member.index',['member'=>$member??''])}}">All</option>
                                       <option @if($status=='active') selected   @endif value="{{route('admin.member.index',['member'=>$member??'','status'=>'active'])}}">Active</option>
                                       <option @if($status=='disabled') selected  @endif value="{{route('admin.member.index',['member'=>$member??'','status'=>'disabled'])}}">Disabled</option>
                                   </select>
                                   <button type="button" class="btn btn-sm btn-success" id="filter">Filter</button>
                               </div>
                           </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-sm-12">
            <div class="card">
                <div class="card">

                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="table-responsive">

                                <table class="table datatable p-0 table-hover-animation">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(count($users)>0)
                                    @foreach($users as $user)
                                        <tr>

                                            <td>{{$user->name??''}}</td>
                                            <td>{{$user->email??''}}</td>
                                            <td>{{$user->phone??''}}</td>
                                            <td>@if($user->status=='active')<span class="badge badge-success">{{$user->status}} </span>@else <sapn class="badge badge-danger">{{$user->status}} </sapn> @endif</td>
                                            <td>{{ $user->created_at->diffForHumans() }}</td>
                                            <th class="text-right">
                                                <a href="{{ route('admin.member.detail', encrypt($user->id)) }}" class="btn btn-dark btn-block btn-sm"><i class="fa fa-eye"></i> Detail</a>
                                            </th>
                                        </tr>
                                    @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    <script>
        $(document).on('click','#filter',function(){
            var val=$('#status').val();
            window.location.href=val

        })
    </script>
@endsection
