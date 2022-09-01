@extends('layouts.admin')
@section('title','Inquiries Management')
@section('heading','Inquiries Management')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatables p-0">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Message</th>
                                        <th>Submitted</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($inquiries as $inquiry)
                                    <tr>
                                        <td>{{ $inquiry->name ?? 'N/A' }}</td>
                                        <td>{{ $inquiry->email ?? 'N/A' }}</td>
                                        <td>{{ $inquiry->phone ?? 'N/A' }}</td>
                                        <td>{{ $inquiry->message ?? 'N/A' }}</td>
                                        <td>{{ $inquiry->created_at->diffForHumans() }}</td>
                                        <td class="text-right">
                                            @if($inquiry->status == 'active')
                                                <a href="{{ route('admin.inquiry.update', $inquiry->id) }}" class="btn btn-primary">Close Inquiry</a>
                                            @else
                                                <span class="badge badge-danger">Inquiry Closed</span>
                                            @endif
                                            
                                        </td>
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
