@extends('layouts.homeopath')
@section('title','Dashboard')
@section('heading','Dashboard')
@section('css')
<style>
    .zoom-icon
    {
        background-color: #2174FF;
        color: #fff;
        padding: 16px;
        font-size: 30px;
        margin-right: 20px;
    }
    .btn-learn-more
    {
        background-color: #F6F7F9;
        border: 2px solid #D6D7DB;
        text-align: center;
        padding: 5px;
        font-weight: bold;
        color: #000;
    }
    .h5-heading
    {
        color: #B1B3B9;
        font-weight: bold;
    }

    .btn-attach,
    .btn-attach:hover
    {
        background-color: #4267B2;
        color: #fff;
        font-weight: bold;
        padding: 4px 6px;
        border-radius: 3px;
    }
    

</style>
@endsection
@section('content')
    

<div class="col-xl-12 col-lg-12 mt-1 bookings-section p-0">

<div class="row">
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-primary">${{ $income ?? 0 }}</h2>
                                        <p>Total Income so far</p>
                                    </div>
                                    <div class="avatar bg-rgba-primary p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fas fa-dollar text-primary font-medium-5"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-success">{{ $active_appointments ?? 0 }}</h2>
                                        <p>Active Appointments</p>
                                    </div>
                                    <div class="avatar bg-rgba-success p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fa fa-server text-success font-medium-5"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="card">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-danger">{{ $total_appointments ?? 0 }}</h2>
                                        <p>Total Appointments</p>
                                    </div>
                                    <div class="avatar bg-rgba-danger p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fa fa-list text-danger font-medium-5"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-sm-6 col-12">
                            <div class="card bg-animated">
                                <div class="card-header d-flex align-items-start pb-0">
                                    <div>
                                        <h2 class="text-bold-700 mb-0 text-white">{{ $today_appointments ?? 0 }}</h2>
                                        <p>Today Appointments</p>
                                    </div>
                                    <div class="avatar bg-rgba-warning p-50 m-0">
                                        <div class="avatar-content">
                                            <i class="fa fa-list font-medium-5"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



    <div class="card" >

        <h6 class="m-0"><span class="text-white bg-dark p-1">Latest Service Booking Appointments</span></h6>
        <div class="card-content">
            <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12 col-12 service-booking-div">
                                            <div class="card">

                                                <div class="card-content">
                                                    <div class="table-responsive">
                                                        <table class="table table-hover">
                                                            <thead>
                                                                <tr>
                                                                    <th>Booking ID</th>
                                                                    <th>Patient</th>
                                                                    <th>Appt Date</th>
                                                                    <th>Booking Date</th>
                                                                    <th>Amount</th>
                                                                    <th>Status</th>
                                                                    <th class="text-right">Action</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                @forelse(Auth::user()->HomeopathServices->sortByDesc('id') as $service)

                                                                    @foreach($service->ServiceBookings->sortByDesc("id")->take(5) as $item)
                                                                        <tr>
                                                                            <td>
                                                                                <span class="badge badge-dark">{{ $item->uuid ?? 'N/A' }}</span>
                                                                            </td>
                                                                        <td>
                                                                        <strong class="d-block">{{ $item->user->name }}</strong>
                                                                        <a href="mailto:{{ $item->user->email }}">
                                                                                    {{ $item->user->email }}
                                                                                </a>
                                                                        </td>
                                                                        <td>
                                                                            <strong>{{ $item->date }}</strong>
                                                                            @php
                                                                                $slot=json_decode($item->time_slot);
                                                                            @endphp
                                                                            <span class="text-primary font-weight-bold d-block">{!! $slot[0] !!}</span>
                                                                        </td>
                                                                        <td> 
                                                                            <strong>{{ $item->created_at->format('Y-m-d') }}</strong>
                                                                            
                                                                        </td>
                                                                        <td class="text-danger font-weight-bold"><em><u>${{ $item->price }}</u></em></td>
                                                                        <td>
                                                                            @if($item->status == 'active')
                                                                                <span class="badge badge-success font-weight-bold text-uppercase w-100">{{ $item->status }}</span>
                                                                            @else
                                                                                <span class="badge badge-warning text-uppercase font-weight-bold w-100">{{ $item->status }}</span>
                                                                            @endif
                                                                        </td>
                                                                        <td class="text-right">
                                                                            <a href="{{ route('homeopath.services.detail', Crypt::encrypt($service->id)) }}" class="btn btn-sm btn-dark">Go to Service</a>
                                                                        </td>
                                                                    </tr>
                                                                    @endforeach


                                                                    @empty
                                                                        <tr>
                                                                            <td colspan="7" class="text-center">
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


    <div class="row">
        <div class="col-md-12">      
            <h6 class="m-3"><span class="text-white bg-dark p-1">Orders</span></h6>      
        </div>
        <div class="col-md-12">      
            @include('front.shop.order.list')        
        </div>
        
    </div>

                        <div class="col-lg-12 p-0">
                        <form method="post" action="{{ route('link.zoom') }}">
                            @csrf
                            <div class="card">

                                <div class="card-body">
                                    <div class="media">
                                        <i class="fas fa-video zoom-icon"></i>
                                      <div class="media-body">
                                        <h3 class="mt-0 font-weight-bold">Zoom</h3>
                                        <h5 ><span class="text-muted">By</span> <a href="https://zoom.us/" target="_blank">Zoom.us</a></h5>
                                        <a href="https://zoom.us/" target="_blank" class="btn-learn-more btn-block mt-1">Visit to learn more</a>
                                      </div>
                                    </div>
                                    <div class="email">
                                        <div class="form-group">
                                            <label class="mb-1 mt-1">You Can Replace Email</label>
                                            <input type="email" name="email" required="" autocomplete="off" class="form-control" value="{{Auth::user()->email}}">
                                        </div>
                                    </div>
                                    <div class="permissions mt-2">
                                        <h5 class="h5-heading">Functionalities to get this attachement</h5>
                                        <ul>
                                            <li>Generate event meetings.</li>
                                            <li>Manage meetings.</li>
                                            <li>Get invitation link to forward members.</li>
                                            <li>Fully control at meetings.</li>
                                        </ul>
                                    </div>

                                    @if(Auth::user()->zoom_access_token == "")

                                        <div class="jumbotron py-1 mb-1">
                                            <h5 class="h5-heading">Why zoom attachment is important?</h5>
                                            <p>Zoom attachement is mandatory in order to start meetings for events. if you will not attach your account. you will not be able to start your event session.</p>
                                            <h6 class="bg-rgba-info p-1 m-0"><span class="text-warning">NOTE: </span> There will be one time Zoom account integration and you dont need to attach again. Sincerely, if you will link it we will not ask it again.</h6>
                                        </div>

                                        <h6 class="h5-heading">By clicking on the "Attach my account" button you are agree to the <a target="_blank" href="https://explore.zoom.us/en/terms/">terms and conditions</a> of Zoom.us</h6>
                                        <hr class="mt-0">
                                        <button type="submit" class=" btn float-right btn-attach">Attach my account</button>
                                        <small class="text-center text-muted " style="padding-top: 5px;">Zoom will send confirmation email at your email address to verify your attachement.</small>

                                    @else
                                        <div class="jumbotron bg-rgba-warning text-center">
                                            <i class="far fa-smile text-success fa-5x"></i>
                                            <h2 class="text-success mt-1 font-weight-bold">Your account is linked with Zoom at CHWG.</h2>
                                            <h5>You can generate meetings for events and start your session(s) with members.</h5>
                                            <small>For more info about linked accounts visit the <a href="">Zoom.us</a> now.</small>
                                        </div>
                                    @endif


                                </div>
                            </div>
                        </form>
                     </div>
</div>



<div class="col-md-12 col-12 p-0 mb-5">
    <h3>Sponsorship</h3>
    @include('components.ads_banner')
</div>



        <!--=====================================================-->
                       <!-- order detail MODAL -->
        <!--=====================================================-->

            <div class="modal fade order_detail_modal pr-0" tabindex="-1" role="dialog" data-keyboard="false" data-backdrop="static">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                  <div class="modal-content">
                    <div class="modal-header p-2">
                      <div class="modal-title">
                          <h5 class="m-0 p-0 font-weight-bold">Order Detail</h5>
                      </div>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body " id="order_detail_modal_body">
                    </div>
                  </div>
                </div>
              </div>

        <!--=====================================================-->
                       <!-- END order detail MODAL -->
        <!--=====================================================-->
@endsection

@section('js')

    <script type="">
        $(document).on('click','.detail_order_btn',function(e){
            e.preventDefault();
            var url=$(this).attr('href');
            
            $.ajax({
                method:'get',
                url:url,
                success:function(data)
                {
                    $('#order_detail_modal_body').html(data)
                    $('.order_detail_modal').modal('show');
                }
            })
        })
    </script>

@endsection
