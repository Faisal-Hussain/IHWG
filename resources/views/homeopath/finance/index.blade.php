@extends('layouts.homeopath')
@section('title','Financial Statement')
@section('heading','Financial Statement')
@section('content')






    <div class="card mt-1">
        
        <h6 class="m-0"><span class="text-white bg-dark p-1">Financial Statement</span></h6>
        <div class="card-content">
            <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                
                                                <div class="card-content">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Service</th>
                                                                    <th>Patient</th>
                                                                    <th>Booking Date</th>
                                                                    <th>Amount</th>
                                                                    <th>Payment Method</th>
                                                                    <th>Transaction ID</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @forelse(Auth::user()->HomeopathServices as $service)
                                                                    
                                                                    @foreach($service->ServiceBookings->sortByDesc("id") as $item)
                                                                        <tr>
                                                                            <th>{{ $service->title }}</th>
                                                                        <td>
                                                                        <strong class="d-block">{{ $item->user->name }}</strong>
                                                                        <a href="mailto:{{ $item->user->email }}">
                                                                                    {{ $item->user->email }}
                                                                                </a> 
                                                                        </td>
                                                                        <td>{{ $item->created_at->format('d F Y') }}</td>
                                                                        <td class="text-danger font-weight-bold"><em><u>${{ $item->price }}</u></em></td>
                                                                        <th class="text-uppercase">{{ $item->payment_method }}</th>
                                                                        <th><span class="badge badge-dark">{{ $item->transaction_id }}</span></th>
                                                                        </tr>
                                                                    @endforeach

                                                                    
                                                                    @empty
                                                                        <tr>
                                                                            <td colspan="6" class="text-center">
                                                                                <h5 class="alert alert-warning">No appontment(s) were found right now</h5>
                                                                            </td>
                                                                        </tr>
                                                                    @endforelse
                                                                    

                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
            </div>
        </div>
    </div>
@endsection