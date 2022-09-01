@extends('layouts.front')
@section('title', 'IHWG for Homeopath')

@section('css')
  <link rel="stylesheet" type="text/css" href="{{ asset('css/jquery-ui.css') }}">
@endsection

@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/vancouver.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')
        </div>
    </div>
</div>
</header>
<!--END HEADER-->
<!--MAIN CONTENT SECTION-->
<section class="content">
  @php
    $slot=json_decode($booking->time_slot)
  @endphp                                                                                

  <div class="container container-book-appointment mb-4" style="border: 5px solid;">

    <div class="appointment-banner  pt-3 pb-1" style="background-image:url('{{ asset($service->ServiceTheme->cover) }}')">

        <strong class="float-right pr-4">4 of 4</strong>
        <div class="col-lg-11 offset-lg-1 pt-1">
            <h2 class="pt-4">Thank you!</h2>
            <p>Thank you for your cooperation.<br>I look forward to helping you.</p>
            <p>Farewell!</p>
        </div>

    </div>


    <div class="row mb-4">
        <div class="col-lg-10 offset-lg-1">
          <div class="row px-4">



      <div class="col-sm-12 mt-3">
          <strong>Customer Receipt</strong>
          <small class="d-block font-weight-bold text-secondary">Your booking is now confirmed!</small>

        <table class="table table-borderless table-receipt mt-4">

          <tbody>
            <tr>
              <th class="text-secondary">Patient name</th>
              <th class="text-right">{{ Auth::User()->name ?? 'N/A' }}</th>
            </tr>
            <tr>
              <th class="text-secondary">Service</th>
              <th class="text-right">{{ $service->title }}</th>
            </tr>
            <tr>
              <th class="text-secondary">Date</th>
              <th class="text-right">{{date('H:ia l, F jS', strtotime($booking->date.' '.$slot[0])) }}</th>
            </tr>
            <tr>
              <th>
                <strong class="d-block">Price</strong>
                <span class="text-secondary d-block">Taxes</span>
                <!-- <span class="text-secondary">{{ setting()['services_discount'] }}% Senior Discount</span> -->
              </th>
           
              <th class="text-right">
                <strong class="d-block">C$ {{ $service->price-$service->price*(setting()['services_tax']/100) }}</strong>
                <!-- <strong class="d-block">${{ serviceTax($service->price,$service->homeopath->HomeopathProfile->location) }}</strong> -->
                <strong class="d-block"><b>C$ </b>{{serviceTax($service->price,$service->homeopath->HomeopathProfile->location)}} </strong>
                <!-- <strong class="d-block">- C$ {{ serviceDiscount($service->price,$service->homeopath->HomeopathProfile->location) }}</strong> -->
              </th>
            </tr>
            <tr>
              <th class="text-secondary">Total</th>
              <th class="text-right">C$ <b>{{ $service->price }}</b></th>
              <!-- <th class="text-right">${{ serviceAmount($service->price,$service->homeopath->HomeopathProfile->location) }}</th> -->
            </tr>

          </tbody>
        </table>

      </div>

      <div class="col-lg-12 text-right">
        <button class="btn btn-checkout text-dark px-4" onclick="window.print()">Print</button>
        <a href="{{ route('redirect.dashboard') }}" class="link-return">Return to Dashboard > </a>
      </div>

    </div>



  </div>

</div>

</div>

</section>
@endsection
