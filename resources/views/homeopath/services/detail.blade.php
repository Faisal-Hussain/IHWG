@extends('layouts.homeopath')
@section('title','Services')
@section('heading','Services')


@section('content')


<div class="row mt-2">
        <div class="col-xl-12 col-sm-12">
            <div class="card">
                <h6 class="m-0"><span class="text-white bg-dark p-1">Service Detail</span></h6>
                <div class="card-content">
                    <div class="card-body">
                        <div class="d-flex justify-content-between mt-2">
                            <div class="float-left">
                                <h3 class="text-success font-weight-bold">{{ $service->title }}</h3>
                            </div>
                            <div class="float-right">
                                <p class="font-weight-bold mb-0">Created</p>
                                <span class="font-weight-bold text-success">{{ $service->created_at->diffForHumans() }}</span>
                            </div>
                        </div>


                        <hr class="my-2">

                        <div class="d-flex justify-content-between mt-2">
                            <div class="float-left">
                                <p class="font-weight-bold mb-0">Type</p>
                                <span class="badge badge-success">{{ $service->type }}</span>
                            </div>
                            <div class="float-right">
                                <p class="font-weight-bold mb-0">Price</p>
                                <span class="badge badge-primary">${{ $service->price }}</span>
                            </div>
                        </div>


                        <hr class="my-2">

                        
                        <div class="d-flex justify-content-between mt-2">
                            <div class="float-left">
                                <p class="font-weight-bold mb-0">Duration</p>
                                <span class="badge badge-dark">{{ $service->duration }} Minutes</span>
                            </div>
                            <div class="float-right">
                                <p class="font-weight-bold mb-0">Status</p>
                                <span class="badge badge-primary">{{ $service->status }}</span>
                            </div>
                            <div class="float-right">
                                <strong>Meeting Via: 
                                    @php
                                    $meetings=json_decode($service->meeting_handled_via);
                                    @endphp
                                    @if($meetings)
                                        @foreach($meetings as $meeting)
                                            <span class=" badge badge-success text-white">
                                                {{ $meeting ?? "N/A" }}
                                            </span>
                                        @endforeach
                                    @endif
                                    
                                </strong>    
                            </div>
                            
                        </div>


                        <hr class="my-2">

                        
                        <div class="d-flex justify-content-between mt-2">
                            <div class="float-left">
                                @if($service->status == 'closed')
                                    <a href="{{ route('homeopath.services.update.status', [ 'id' => Crypt::encrypt($service->id), 'status' => base64_encode('active') ]) }}" class="btn btn-success">Active this Service</a>
                                @else
                                    <a href="{{ route('homeopath.services.update.status', [ 'id' => Crypt::encrypt($service->id), 'status' => base64_encode('closed') ]) }}" class="btn btn-danger alert-confirm font-weight-bold">CLOSE THIS SERVICE</a>
                                @endif
                                
                            </div>
                            <div class="float-right">
                                <button data-toggle="modal" data-target="#modalUpdateService" class="btn btn-primary " title="Edit"><i class="fas fa-edit"></i></button>
                                <a href="{{ route('homeopath.services.delete', Crypt::encrypt($service->id)) }}" class="btn btn-danger alert-confirm" title="Remove"><i class="fas fa-trash"></i></a>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
</div>

<div class="card mt-1">
    <h6 class="m-0"><span class="text-white bg-dark p-1">Homeopath Service Appointment Document</span></h6>

    <div class="card-body mt-2">
        <div class="row">

            <div class="col-sm-6 mb-3">
                <h3 class="alert bg-rgba-warning rounded-0">Docuemnt Form for the <strong>Adult</strong></h3>
                <form method="POST" action="{{ route('homeopath.settings.update.images') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="row main-item-images">

                        <div class="col-xl-12 col-md-12 col-sm-12 col-12 mb-2">

                            @if($service->adult_service_document??'' != 'uploads/documents/form.pdf')
                                <a href="{{ asset($service->adult_service_document??'') }}" target="_blank" class="btn btn-dark">View Uploaded Form</a>
                            @endif

                            <input type="file" name="pdf" required="" class="form-control mt-2" data-default-file="" data-allowed-file-extensions="pdf" required="">
                            <input type="hidden" name="age_type" value="over_doc">
                            <input type="hidden" name="service_id" value="{{$service->id}}">
                        </div>
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12 mb-3 text-right">

                            <button type="submit" class="btn btn-success" href="#">Update Document</button>
                        </div>


                    </div>

                </form>

            </div>

            <div class="col-sm-6 mb-3">
                <h3 class="alert bg-rgba-warning rounded-0">Docuemnt Form for the <strong>Child</strong></h3>
                <form method="POST" action="{{ route('homeopath.settings.update.images') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="row main-item-images">

                        <div class="col-xl-12 col-md-12 col-sm-12 col-12 mb-2">

                            @if($service->child_service_document??'' != 'uploads/documents/form.pdf')
                                <a href="{{ asset($service->child_service_document??'') }}" target="_blank" class="btn btn-dark">View Uploaded Form</a>
                            @endif

                            <input type="file" name="pdf" required="" class="form-control mt-2" data-default-file="" data-allowed-file-extensions="pdf" required="">
                            <input type="hidden" name="age_type" value="inner_doc">
                            <input type="hidden" name="service_id" value="{{$service->id}}">
                        </div>
                        <div class="col-xl-12 col-md-12 col-sm-12 col-12 mb-3 text-right">

                            <button type="submit" class="btn btn-success" href="#">Update Document</button>
                        </div>


                    </div>

                </form>

            </div>



        </div>
    </div>
</div>
    
<div class="row">
    <div class="col-12">
        <div class="card">
            
            <h6 class="m-0"><span class="text-white bg-dark p-1">Service Appointment(s)</span></h6>
            <div class="card-content">
            <a href="{{ route('homeopath.services.book.appointment', Crypt::encrypt($service->id)) }}" class="float-right mr-1 font-weight-bold border-0 bg-rgba-dark text-dark px-1">+ Add new appointment</a>
                <div class="table-responsive mt-3">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Patient</th>
                                <th>Appt Date</th>
                                <th>Booking Date</th>
                                <th>Amount</th>
                                <th>Payment Method</th>
                                <th>Status</th>
                                <th>Update Status</th>
                                <th>Action</th>
                                <th class="text-right">Other</th>
                            </tr>
                        </thead>
                        <tbody>
                            @forelse($service->ServiceBookings->sortByDesc('id') as $item)
                            <tr>
                                <th><span class="badge badge-dark">{{ $item->uuid ?? 'N/A' }}</span></th>
                                <td>
                                    <strong class="d-block">{{ $item->user->name }}</strong>
                                    <a class="font-weight-bold" href="mailto:{{ $item->user->email }}">
                                        {{ $item->user->email }}
                                    </a>
                                    <a class="d-block text-dark font-weight-bold" href="tel:{{ $item->user->phone }}">
                                        {{ $item->user->phone }}
                                    </a>
                                    
                                </td>
                                <td>
                                    <strong>{{ $item->date }}</strong>
                                    @php
                                        $slot=json_decode($item->time_slot)
                                    @endphp
                                    <span class="text-primary font-weight-bold d-block">{{ $slot[0] }}</span>
                                </td>
                                <td>{{ $item->created_at->format('d F Y') }}</td>
                                <td class="text-danger font-weight-bold"><em><u>${{ $item->price }}</u></em></td>
                                <td>
                                    <strong class="d-block">{{ ucfirst($item->payment_method??'N/A') }}</strong>
                                    <a class="font-weight-bold" href="#">
                                        {{ $item->later_pay_method??'' }}
                                    </a>
                                    
                                    
                                </td>

                                <td>
                                    @if($item->status == 'active')
                                    <span class="badge badge-success w-100 font-weight-bold text-uppercase">{{ $item->status }}</span>
                                    @else
                                    <span class="badge badge-warning w-100 text-uppercase font-weight-bold">{{ $item->status }}</span>
                                    @endif
                                </td>
                                <td>
                                    <form method="get" action="{{route('homeopath.bookings.update.status')}}" id="appointment_status_change_form">
                                        
                                        <input type="hidden" id="hidden_appointment_id" name="id" value="">
                                        <input type="hidden" id="hidden_appointment_status" name="status" value="">
                                        <input type="hidden" id="hidden_appointment_note" name="note" value="">
                                    </form>
                                    @if($item->status == 'completed')
                                        --------------------
                                    @else
                                        @if($item->status != 'cancelled')
                                            <select class="w-100 py-0 booking_status_change">
                                                <option value="">Choose status:</option>
                                                <option value="{{ Crypt::encrypt($item->id) }}" data-status="{{base64_encode('closed')}}">Closed</option>
                                                <option value="{{ Crypt::encrypt($item->id) }}" data-status="{{base64_encode('cancelled')}}">Cancelled</option>
                                                
                                            </select>
                                        @endif
                                    @endif


                                    
                                </td>

                                <td>

                                    @if($item->status == 'completed')
                                    --------------------
                                    @else
                                        @if($item->status != 'cancelled')
                                        <button class="btn btn-sm btn-dark btn-block btn-complete" data-id="{{ Crypt::encrypt($item->id) }}">Mark as Complete</button>
                                        @endif
                                    @endif

                                    @if($item->meeting_handel_via=='Online' && $item->status != 'cancelled')
                                     @php
                                        $slot=json_decode($item->time_slot)
                                    @endphp
                                    <form action="{{route('service.zoom.meeting')}}" method="post">
                                        @csrf
                                        <input type="hidden" name="service_id" value="{{$item->homeopath_service_id}}">
                                        <input type="hidden" name="slot" value="{{$slot[0]}}">
                                        <input type="hidden" name="user_id" value="{{$item->user->id}}">
                                        <button class="btn btn-sm  btn-block btn-success" type="submit">Start Zoom Meeting</button>

                                        
                                    </form>
                                    @endif
                                </td>
                                <td class="text-right">
                                    @if($item->status == 'completed')
                                        <a href="{{ route('prescription', $item->uuid ?? '12') }}" target="_blank" class="btn btn-primary btn-sm">View Prescription</a>
                                    @else
                                        N/A
                                    @endif
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="9" class="text-center">
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



<!--note for cancel booking Modal -->
<div class="modal fade" id="NoteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Write Note</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <textarea class="form-control" rows="4" id="note_textarea">
            
        </textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary submit_note_btn" data-dismiss="modal">Skip</button>
        <button type="button" class="btn btn-primary submit_note_btn">Submit</button>
      </div>
    </div>
  </div>
</div>

<!--========================================================-->
                <!--MODAL FOR UPDATE SERVICE-->
<!--========================================================-->
<div class="modal fade" id="modalUpdateService" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">My Service</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="{{ route('homeopath.services.update') }}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="service_id" value="{{ Crypt::encrypt($service->id) }}">
                    <label>Service Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="text" class="form-control rounded-0" id="title" name="title" value="{{ $service->title }}" required="">
                    </div>
                    <label>Service Duration</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="duration">
                            @for($i=30; $i< 181; $i+=30)
                                <option value="{{ $i }}" @if($service->duration == $i) selected="" @endif>{{ $i }} Minutes</option> 
                            @endfor
                        </select>
                    </div>

                    <label>Price Rate (USD)</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="price">
                            @for($i=5; $i< 500; $i+=5)
                                <option value="{{ $i }}" @if($service->price == $i) selected="" @endif>{{ $i }}</option> 
                            @endfor
                        </select>
                    </div>

                    <label>Service Thumbnail</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="file" class="dropify" id="thumbnail" name="thumbnail" data-default-file="{{asset($service->thumbnail)}}">
                    </div>
                    
                    <label>Service Type</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="type">
                            <option value="{{ $service->type }}" selected="" hidden="">{{ ucfirst($service->type) }}</option>
                            <option value="featured">Featured</option>
                            <option value="popular">Popular</option>
                            <option value="new">New</option>
                            <option value="old">Old</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    
                    @php
                      $arr=json_decode($service->meeting_handled_via);
                    @endphp
                    <label>Service Handled via</label>
                    <div class="input-group mb-2 mr-sm-2 mt-2 pr-3">
                        
                        <input type="checkbox" name="meeting_handled_via[]" value="Offline" class="meeting_handled_via_offline" @if(in_array('Offline',$arr??[])) checked="" @endif>
                        <label>Offline</label>

                    </div>
                    <div class="input-group mb-2 mr-sm-2">
                
                        <input type="checkbox" name="meeting_handled_via[]" value="Online" class="meeting_handled_via_online" @if(in_array('Online',$arr??[])) checked="" @endif>
                        <label>Online</label>

                    </div>

                    <label>Service Theme <small>(Select desired theme for booking)</small></label>
                    <div class="input-group mb-2 mr-sm-2">
                        @foreach(serviceThemes() as $item)
                           <label class="selectTheme" for="option-{{ $loop->iteration }}" style="background-image:url('{{ asset($item->cover) }}')">
                               <input type="radio" name="service_theme_id" value="{{ $item->id }}" id="option-{{ $loop->iteration }}" required="" @if($service->ServiceTheme->id == $item->id) checked="" @endif>
                           </label>
                        @endforeach
                    </div>

                        
                    <div class="text-right">
                        <button class="btn btn-dark" type="submit">Save</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>




@endsection

    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


@section('js')
<script>
    $(document).on('click', '.btn-complete', function() {
        $('#booking_id').val($(this).data('id'));
        $('#markBookingComplete').modal('show');
    })
</script>

@endsection
