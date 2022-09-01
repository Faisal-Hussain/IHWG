@extends('layouts.admin')
@section('title','Donations Statistics')
@section('heading','Donations Statistics')

@section('content')
<div class="row">

    <div class="col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-primary">${{ $total ?? 0 }}</h2>
                                        <p>Total donations so far</p>
                                    </div>
                                    <div class="avatar bg-rgba-primary p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="feather icon-dollar-sign text-primary font-medium-5"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

    <div class="col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-success">${{ $this_month_donation ?? 0 }}</h2>
                                        <p>This Month donations so far</p>
                                    </div>
                                    <div class="avatar bg-rgba-success p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="feather icon-dollar-sign text-success font-medium-5"></i>
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
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Donator</th>
                                        <th>Price</th>
                                        <th>Type</th>
                                        <th>Donated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($donations as $item)
                                    <tr>
                                        <td>
                                            <h6>{{ $item->user->name ?? 'N/A' }}</h6>
                                            <a href="mailto:{{ $item->user->email ?? 'N/A' }}">{{ $item->user->email ?? 'N/A' }}</a>
                                            <small class="text-success d-block">{{ $item->user->role ?? 'N/A' }}</small>
                                        </td>
                                        <td><span class="badge badge-info">${{ $item->price ?? 'N/A' }}</span></td>
                                        <th>{{ $item->payment_type ?? 'N/A' }}</th>
                                        <td>{{ $item->created_at->diffForHumans() }}</td>
                                    </tr>
                                    @endforeach
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
