@extends('layouts.admin')
@section('title','Badge Request Management')
@section('heading','Badge Request Management')

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
                                        <th>Requested By</th>
                                        <th>Type</th>
                                        <th>Badge</th>
                                        <th>Description</th>
                                        <th>Attachement</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($badges as $item)
                                    <tr>
                                        <td>
                                            <h6>{{ $item->user->name ?? 'N/A' }}</h6>
                                            <a href="mailto:{{ $item->user->email ?? 'N/A' }}">{{ $item->user->email ?? 'N/A' }}</a>
                                        </td>
                                        <td>

                                            @if($item->user->role == 'homeopath')
                                                <span class="badge badge-success text-uppercase">{{ $item->user->role }}</span>
                                            @else
                                                <span class="badge badge-info text-uppercase">{{ $item->user->role }}</span>
                                            @endif
                                            
                                        </td>
                                        <td class="text-center">
                                            <img src="{{ asset($item->badge->path) }}" style="width:45px;">

                                            <h6 class="text-warning">{{ $item->badge->title }}</h6>
                                        </td>
                                        <td>
                                            <h6>{{ Str::limit($item->description,25)?? 'N/A' }}</h6>
                                        
                                        </td>
                                        <td>
                                            @if($item->attachement)
                                            <a href="{{asset($item->attachement)}}" download="">view</a>
                                            @else
                                            <h2>-----------</h2>
                                            @endif

                                        </td>
                                        
                                       
                                        <td>
                                            @if($item->status=='active')
                                            <span class="badge font-weight-bold status-td badge-success">{{ $item->status }}</span>
                                            @elseif($item->status=='cancelled')
                                            <span class="badge font-weight-bold status-td badge-danger">{{ $item->status }}</span>
                                            @else
                                            <a href="#" class="status-btn"  data-toggle="modal" data-target="#updateBadgeStatusModal" data-id="{{Crypt::encrypt($item->id)}}" data-user-id="{{Crypt::encrypt($item->user_id)}}">
                                                <span class="badge font-weight-bold status-td badge-dark">{{ $item->status }}</span>
                                            </a> 
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




<!-- status  Modal -->
<div class="modal fade" id="updateBadgeStatusModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Update Status</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form action="{{route('admin.badge.requests.status')}}" method="post" id="badgeStatusForm">
            @csrf
            <select class="form-control dropdown-list select-status mb-2" name="status">
                <option value="active">Accept</option>
                <option value="cancelled">Reject</option>
            </select>
            <input type="hidden" name="id" id="id" value="">
            <input type="hidden" name="user_id" id="user_id" value="">

            <textarea class="form-control" name="reason" id="reason" rows="3"></textarea>
            
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary save-status-btn">Save changes</button>
      </div>
    </div>
  </div>
</div>





@endsection

@section('js')

<script>
    $(document).ready(function(){
        $('#reason').hide();
    })
    $(document).on('click','.status-btn',function() {
        var id =$(this).data('id');
        var user_id =$(this).data('user-id');

        $('#id').val(id)
        $('#user_id').val(user_id)

    })

    $(document).on('change','.select-status',function() {
        var val =$(this).val();
        if(val=='cancelled')
        {
           $('#reason').show(); 
        }else{
            $('#reason').hide();
        }
       
    })
    $(document).on('click','.save-status-btn',function() {
        $('#badgeStatusForm').submit()
    })

</script>
@endsection