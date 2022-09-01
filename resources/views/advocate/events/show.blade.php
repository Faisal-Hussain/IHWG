@extends('layouts.advocate')
@section('title','Event Management')
@section('heading','Event Management')

@section('content')
<div class="row">

    <div class="col-sm-12 events-management">
        <div class="card pl-2 py-1">
                <h2 class=" mb-0 font-weight-bold text-success">{{ $item->title }}</h2>
          </div>

          <div class="card">
                              <div class="card-body">
                        <div class="row">
                            <div class="col-sm-6">
                                <table class="table table-hover">
                                      <tbody>
                                        <h2 class="font-weight-bold text-info">Basic Details</h2>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Category:</h3></th>
                                          <td><h3>{{ $item->category }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Type:</h3></th>
                                          <td><h3>{{ $item->type }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Venue:</h3></th>
                                          <td><h3>{{ $item->venue ?? 'N/A' }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Location:</h3></th>
                                          <td><h3>{{ $item->location ?? 'N/A' }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Hosts:</h3></th>
                                          <td><h3>{{ $item->hosts ?? 'N/A' }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Vendors:</h3></th>
                                          <td><h3>{{ $item->vendors ?? 'N/A' }}</h3></td>
                                        </tr>
                                        <tr>
                                          <th><h3 class="font-weight-bold">Status:</h3></th>
                                          <td><h3 class="text-warning">{{ $item->status  }}</h3></td>
                                        </tr>


                                      </tbody>
                                    </table>



                            </div>
                            <div class="col-sm-6">
                                <img src="{{ asset($item->thumbnail) }}" class="w-100">
                                <h6 class="mt-2"><strong>DESCRIPITON:</strong> {{ $item->description }}</h6>
                            </div>








                        </div>
                  </div>
          </div>

            <div class="card">
              <div class="card-body">
                <table class="table table-hover">
                  <tbody>
                    <h2 class="font-weight-bold text-info">Event Timing</h2>
                    <tr>
                      <th><h4 class="font-weight-bold">#</h4></th>
                      <th><h4 class="font-weight-bold">Date</h4></th>
                      <th><h4 class="font-weight-bold">Time</h4></th>
                      <th><h4 class="font-weight-bold float-right">Create Zoom Meeting</h4></th>
                    </tr>

                    @foreach($item->eventTimings as $timing)
                    <tr>
                      <th><h4 class="font-weight-bold">{{ $loop->iteration }}</h4></th>
                      <td><h4>{{ $timing->date }}</h4></td>
                      <td><h4>{{ $timing->time }}</h4></td>
                      <td>
                          <form method="post" action="{{route('zoom')}}">
                              @csrf
                              <input type="hidden" value="{{$item->id}}" name="event_id">
                              <input type="hidden" value="{{$timing->id}}" name="event_time_id">
                              <button type="submit"  class="btn btn-success float-right">Start Zoom Meeting</button>
                          </form>
                      </td>
                    </tr>
                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>

            <div class="card">
              <div class="card-body">
                <table class="table table-hover">
                  <tbody>
                        <h2 class="font-weight-bold text-info float-left">Event Joining Requests</h2>
                    <tr>
                      <th><h4 class="font-weight-bold">Event Date/Time</h4></th>
                      <th><h4 class="font-weight-bold">Requested User</h4></th>
                      <th><h4 class="font-weight-bold">Requested</h4></th>
                      <th><h4 class="font-weight-bold">Status</h4></th>
                      <th><h4 class="font-weight-bold">Action</h4></th>
                    </tr>

                    @foreach($item->eventTimings as $timing)

                      @foreach($timing->eventRequests->sortByDesc('id') as $request)
                        <tr>
                          <td><h4>{{ $timing->date }}</h4><h6>{{ $timing->time }}</h6></td>
                          <td>
                            <h6 class="font-weight-bold">{{ $request->user->name }}</h6>
                            <a href="mailto:{{ $request->user->email }}">{{ $request->user->email }}</a>
                          </td>
                          <td>{{ $request->created_at->diffForHumans() }}</td>
                          <td><span class="badge badge-warning font-weight-bold text-uppercase status-span">{{ $request->status }}</span></td>
                          <td class="action-td">



                            @if($request->status == 'pending')
                                <select class="update-request-status" data-id="{{ Crypt::encrypt($request->id) }}">
                                    <option hidden="">Change Status</option>
                                    <option value="active">Accept</option>
                                    <option value="rejected">Reject</option>
                                </select>
                            @else
                                  --------------------
                            @endif


                          </td>
                        </tr>
                      @endforeach


                    @endforeach
                  </tbody>
                </table>
              </div>
            </div>

            <div class="card">
              <div class="card-body">

                        <div class="row">
                          <div class="col-sm-6">

                            @if($item->status != 'closed')
                                <a href="{{ route('advocate.events.close', Crypt::encrypt($item->id)) }}" class="btn btn-success font-weight-bold"><i class="fas fa-check"></i> Close This Event</a>
                            @endif


                          </div>
                          <div class="col-sm-6 text-right">
                            <a href="{{ route('advocate.events.remove', Crypt::encrypt($item->id)) }}" class="btn btn-danger alert-confirm font-weight-bold"><i class="fas fa-trash"></i> Delete Event</a>

                                <a href="{{ route('advocate.events.edit', Crypt::encrypt($item->id)) }}" class="btn btn-info font-weight-bold"><i class="fas fa-edit"></i> Update Event</a>
                          </div>
                        </div>

              </div>
            </div>






    </div>
</div>
@endsection


@section('js')

  <script>
    $(document).on('change', '.update-request-status', function() {

      $self = $(this);
      $id      = $(this).data('id');
      $status  = $(this).val();


          $.ajax({
            method:'get',
            url:"{{ route('advocate.events.request.status') }}",
            data: {id: $id , status: $status},
            success:function (response){
              toastr.success(response == 'active' ? 'Request has been accepted' : 'Request has been rejected');
              $self.closest('tr').find('.status-span').text(response);
              $self.closest('tr').find('.action-td').html('--------------------');

            }
        })



    })
  </script>

@endsection
