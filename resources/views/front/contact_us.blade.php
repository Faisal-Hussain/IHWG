@extends('layouts.front')
@section('title', 'Contact Us')

@section('content')

@include('front.components.pages_banner', ['heading' => 'Contact us', 'description' => 'Have any issue or query? go below to contact with us'])

<!--MAIN CONTENT SECTION-->






<div class="container py-5">


<div class="row">
  <div class="col-md-8">

    <div class="card card-site">
        <div class="card-body">
            
      <form action="{{ route('submit.inquiry') }}" method="POST">
                 
                  @csrf
                  <!-- Name input -->
                  <div class="form-outline mb-4">
                    <label class="form-label" for="mdb-validation-name" style="margin-left: 0px;">Name</label>
                    <input type="text" name="name" class="form-control" required="">
                    <div class="invalid-feedback">Please provide your name.</div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 41.6px;"></div><div class="form-notch-trailing"></div></div></div>

                  <!-- Email input -->
                  <div class="form-outline mb-4">
                    <label class="form-label" for="mdb-validation-email" style="margin-left: 0px;">Email address</label>
                    <input type="email" name="email" class="form-control" required="">
                    <div class="invalid-feedback">Please provide your email.</div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 88.8px;"></div><div class="form-notch-trailing"></div></div></div>

                  <!-- Subject input -->
                  <div class="form-outline mb-4">
                    <label class="form-label" for="mdb-validation-subject" style="margin-left: 0px;">Subject</label>
                    <input type="text" name="subject" class="form-control" required="">
                    <div class="invalid-feedback">Please provide mail subject.</div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 49.6px;"></div><div class="form-notch-trailing"></div></div></div>

                  <!-- Message input -->
                  <div class="form-outline mb-4">
                    <label class="form-label" for="mdb-validation-message" style="margin-left: 0px;">Message</label>
                    <textarea class="form-control" name="message" rows="4" required=""></textarea>
                    <div class="invalid-feedback">Please provide a message text.</div>
                  <div class="form-notch"><div class="form-notch-leading" style="width: 9px;"></div><div class="form-notch-middle" style="width: 60px;"></div><div class="form-notch-trailing"></div></div></div>

                  <!-- Submit button -->
                  <button class="btn btn-primary float-right mb-4" type="submit">Send my Inquiry</button>
                </form>
        </div>
    </div>

  </div>
  <div class="col-md-4">

    <img src="{{ asset($setting['logo']) ?? ''}}" class="w-75">
    <hr>

    <b>Customer service:</b> <br />

    <p class="mt15">Phone: <strong>{{$setting['phone'] ?? ''}}</strong></p>
    <p class="mt15">E-mail: <strong><a href="mailto:{{$setting['email'] ?? ''}}">{{$setting['email'] ?? ''}}</a></strong></p>
    

  </div>
</div>

</div>




@include('front.components.work_with_us')


@endsection



@section('js')
    
@endsection