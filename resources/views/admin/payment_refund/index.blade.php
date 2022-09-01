@extends('layouts.admin')
@section('title','Service Booking Payments')
@section('heading','Service Booking Payments')

@section('content')
<div class="row">

    <div class="col-sm-12">

        
            <div class="card">
                
                <div class="card-content">
                    

                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0 table-hover-animation">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        
                                        <th>User Role</th>
                                        <th>Service</th>
                                        <th>Date</th>
                                        <th>Time</th>
                                        <th>Payment Method</th>
                                        <th>Price</th>
                                        <th>Created</th>
                                        <th>Status</th>

                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($data as $item)

                                        @if($item->payment_method=='paypal' ||$item->payment_method=='stripe')
                                            <tr>
                                                <td>
                                                    <h6>{{ $item->user->name ?? 'N/A' }}</h6>
                                                    <a href="{{ route('admin.member.detail', encrypt($item->user->id)) }}">{{ $item->user->email ?? 'N/A' }}</a>
                                                </td>
                                                
                                                <td class="text-success">{{$item->user->role}}</td>
                                                <th>{{ $item->HomeopathService->title??' ' }}</th>
                                                <td>{{$item->date??''}}</td>
                                                <td>{{$item->time_slot??''}}</td>
                                                <th><span class="badge badge-primary">{{  $item->payment_method ?? ''}}</span></th>
                                                <th><h3 class="text-success m-0">${{ $item->price?? ''}}</h3></th>
                                                <td>{{ $item->created_at->diffForHumans() }}</td>
                                                <th>
                                                    
                                                    @if($item->status=='active')
                                                    <span class=" badge badge-success">{{  $item->status?? ''}}</span>
                                                    @else
                                                    <span class="badge badge-danger">{{  $item->status?? ''}}</span>
                                                    @endif

                                                </th>
                                                <th class="text-right">
                                                    <form method="post" action="{{route('admin.refund.amount')}}">
                                                        @csrf
                                                        <input type="hidden" name="transaction_id" value="{{$item->transaction_id}}">
                                                        <input type="hidden" name="payment_method" value="{{$item->payment_method}}">
                                                        <input type="hidden" name="amount" value="{{$item->price}}">
                                                        <input type="hidden" name="id" value="{{encrypt($item->id)}}">
                                                        @if($item->status!='refund')
                                                        <button type="submit" class="btn btn-dark btn-block btn-sm" onclick="return confirm('Do you want to refund it ?')"> Refund Pay</button>
                                                        @endif
                                                    </form>
                                                </th>
                                            </tr>
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        
    </div>
</div>




@endsection
