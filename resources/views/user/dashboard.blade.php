@extends('layouts.user')
@section('title','Dashboard')
@section('heading','Dashboard')
@section('css')
<style type="text/css">
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

<div class="row">
        <div class="col-md-5 col-12">
             <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                        <div class="card-header d-flex align-items-start pb-0">
                            <div>
                                <h2 class="text-bold-700 mb-0 text-primary">{{ count(Auth::user()->events) ?? 0 }}</h2>
                                <p>Total events</p>
                            </div>
                            <div class="avatar bg-rgba-primary p-50 m-0">
                                <div class="avatar-content">
                                    <i class="fas fa-calendar-alt text-primary font-medium-5"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                    <div class="col-sm-6">
                        <div class="card">
                            <div class="card-header d-flex align-items-start pb-0">
                                <div>
                                    <h2 class="text-bold-700 mb-0 text-success">{{ Auth::user()->serviceBookings->count() ?? 0 }}</h2>
                                    <p>Services</p>
                                </div>
                                <div class="avatar bg-rgba-success p-50 m-0">
                                    <div class="avatar-content">
                                        <i class="fas fa-hands-helping text-success font-medium-5"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        @include('components.ads_banner')
                    </div>

            </div>
        </div>
                        <div class="col-md-7 col-12">
                            <div class="card">
                                <div class="card-header mb-2">
                                    <h4 class="card-title font-weight-bold text-success">My Service(s) Appointment</h4>
                                </div>

                                <div class="card-content">
                                    <div class="table-responsive">
                                        <table class="table table-hover appointment-table">
                                            <thead>
                                                <tr>
                                                    <th>Booking ID</th>
                                                    <th>Homeopath</th>
                                                    <th>Appt Date</th>
                                                    <th>Booking Date</th>
                                                    <th>Amount</th>
                                                    <th>Status</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse(Auth::user()->serviceBookings->sortByDesc('id') as $item)
                                                    <tr>
                                                        <td>
                                                            <span class="badge badge-dark">{{ $item->uuid ?? 'N/A' }}</span>
                                                        </td>
                                                        <td scope="row">
                                                            <div class="avatar float-left">
                                                                <img src="{{ asset($item->HomeopathService->homeopath->avatar) }}" height="32" width="32">
                                                            </div>
                                                            <strong>{{ $item->HomeopathService->homeopath->name ?? '' }}</strong>
                                                            <small class="d-block">
                                                                <a href="mailto:{{ $item->HomeopathService->homeopath->email }}">
                                                                    {{ $item->HomeopathService->homeopath->email }}
                                                                </a>
                                                            </small>
                                                        </td>
                                                        <td>
                                                            <strong>{{ $item->date }}</strong>
															@php
																$slot=json_decode($item->time_slot)
															@endphp
                                                            <span class="text-primary font-weight-bold d-block">{{ $slot[0] }}</span>
                                                        </td>
                                                        <td>{{ $item->created_at->format('Y-m-d') }}</td>
                                                        <td class="text-danger font-weight-bold"><em><u>${{ $item->price }}</u></em></td>
                                                        <td>
                                                            @if($item->status == 'active')
                                                                <span class="badge badge-success font-weight-bold text-uppercase">{{ $item->status }}</span>
                                                            @else
                                                                <span class="badge badge-dark text-uppercase font-weight-bold">{{ $item->status }}</span>
                                                            @endif
                                                        </td>
                                                    </tr>
                                                @empty
                                                    <tr>
                                                        <td colspan="6" class="text-center">
                                                            <h3 class="alert alert-warning">No appontment(s) were found right now</h3>
                                                        </td>
                                                    </tr>
                                                @endforelse

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>


                              <!-- ==============       =======================
                                                Orders show
                                ==============       ======================= -->

                                <div class="card">
                                    <div class="card-header mb-2">
                                        <h4 class="card-title font-weight-bold text-success">Orders</h4>
                                        
                                    </div>
                                    <div class="card-body">
                                        @include('front.shop.order.list') 
                                    </div>
                                    
                                </div>

                                <!-- ==============       =======================
                                                Orders show end
                                ==============       ======================= -->
                        </div>


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
