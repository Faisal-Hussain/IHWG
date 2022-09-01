@extends('layouts.admin')
@section('title','Reported Users Management')
@section('heading','Reported Users Management')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Reported By</th>
                                        <th>Reported User</th>
                                        <th>Type</th>
                                        <th>Reason</th>
                                        <th>Submitted</th>
                                        <th>Report Status</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($reports as $item)
                                    <tr>
                                        <td>
                                            <h6>{{ $item->reportedBy->name ?? 'N/A' }}</h6>
                                            <a href="mailto:{{ $item->reportedBy->email ?? 'N/A' }}">{{ $item->reportedBy->email ?? 'N/A' }}</a>
                                            <small class="text-success d-block">{{ $item->reportedBy->role ?? 'N/A' }}</small>
                                        </td>
                                        <td>
                                            <h6>{{ $item->reportedUser->name ?? 'N/A' }}</h6>
                                            <a href="mailto:{{ $item->reportedUser->email ?? 'N/A' }}">{{ $item->reportedUser->email ?? 'N/A' }}</a>
                                        </td>
                                        <td>{{ $item->type ?? 'N/A' }}</td>
                                        <td>{{ $item->reason ?? 'N/A' }}</td>
                                        <td>{{ $item->created_at->diffForHumans() }}</td>
                                        <td><span class="badge badge-dark font-weight-bold status-td">{{ $item->status }}</span></td>
                                        <td class="text-right update-status-td">

                                            @if($item->status == 'closed')
                                                ---------------------
                                            @else
                                                <select class="w-100 update-status" data-id="{{ Crypt::encrypt($item->id) }}">
                                                    <option hidden="">Update report status</option>
                                                    <option value="block">Block the user</option>
                                                    <option value="cancelled">Cancell the report</option>
                                                </select>
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

@section('js')

<script>
    $(document).on('change', '.update-status', function() {
        $self = $(this);
        $id     = $(this).data('id');
        $status = $(this).val();

        $.ajax({
                method:'get',
                url:'{{ route('admin.reports.update.status') }}?id='+$id+'+&status='+$status,
                success:function (response){

                    toastr.success(response);
                    if($status == 'cancelled')
                    {
                        $self.closest('tr').remove();
                    }
                    else
                    {
                        $self.closest('tr').find('.status-td').text('Closed');
                        $self.closest('tr').find('.update-status-td').html('---------------------');
                    }

                    
                    
                }
            })


    })
</script>


@endsection