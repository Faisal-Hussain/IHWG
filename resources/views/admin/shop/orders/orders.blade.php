@extends('layouts.admin')
@section('title','Orders Management')
@section('heading','Orders Management')

@section('content')
<div class="row">
    @foreach($orders_count as $count)
            <div class="col-sm-3">
                <a href="?status={{ $count->status }}">
                    <div class="card text-center order-stats-link">
                        <h1 class="text-bold-700 mb-0 text-primary">{{ $count->total ?? 0 }}</h1>
                        <p class="text-uppercase font-weight-bold"><span class="text-success">{{$count->status  }}</span></p>
                    </div>
                </a>
            </div>
    @endforeach



    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0 table-hover-animation">
                                <thead>
                                    <tr>
                                        <th>Order</th>
                                        <th>Ordered By</th>
                                        <th>Status</th>
                                        <th>Ordered</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($orders as $item)
                                        <tr>
                                            <th class="text-primary">#{{ $item->id }}</th>
                                            <td>
                                                <h6>{{ $item->user->name ?? 'N/A' }}</h6>
                                                <a href="mailto:{{ $item->user->email ?? 'N/A' }}">{{ $item->user->email ?? 'N/A' }}</a>
                                            </td>
                                            <td>
                                                @if($item->status == 'completed')
                                                    <span class="status-badge-order-green">{{ $item->status }}</span>
                                                @elseif($item->status == 'shipped')
                                                    <span class="status-badge-order-cyan">{{ $item->status }}</span>
                                                @elseif($item->status == 'pending')
                                                    <span class="status-badge-order-blue">{{ $item->status }}</span>
                                                @elseif($item->status == 'cancelled')
                                                    <span class="status-badge-order-red">{{ $item->status }}</span>
                                                @endif
                                            </td>
                                            <td>{{ $item->created_at->diffForHumans() }}</td>
                                            <td class="text-right"><a href="{{ route('admin.shop.order', $item->id) }}" class="text-primary" title="Order detail"><i class="feather icon-eye"></i></a></td>
                                        </tr>
                                    @endforeach
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
