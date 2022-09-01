@extends('layouts.homeopath')
@section('title','Customer Management')
@section('heading','Customer Management')
@section('content')






    <div class="card mt-1">
        
        <h6 class="m-0"><span class="text-white bg-dark p-1">Customer Management</span></h6>
        <div class="card-content">
            <div class="card-body">
                                    <div class="row">
                                        <div class="col-12">
                                            <div class="card">
                                                
                                                <div class="card-content">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover datatable">
                                                            <thead>
                                                                <tr>
                                                                    <th>Name</th>
                                                                    <th>Phone #</th>
                                                                    <th>Patient Email</th>
                                                                    <th>Address</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @forelse(Auth::user()->HomeopathServices as $service)
                                                                    
                                                                    @foreach($service->ServiceBookings->sortByDesc("id") as $item)

                                                                        <tr>
                                                                            <th>{{ $item->user->name ?? '' }}</th>
                                                                            <th>{{ $item->user->phone ?? 'N/A' }}</th>
                                                                            <td>
                                                                                <a href="mailto:{{ $item->user->email }}">
                                                                                    {{ $item->user->email }}
                                                                                </a> 
                                                                            </td>
                                                                            <td>{{ $item->created_at->format('F d, Y')  }}</td>
                                                                        </tr>
                                                                    @endforeach

                                                                    
                                                                    @empty
                                                                        <tr>
                                                                            <td colspan="4" class="text-center">
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