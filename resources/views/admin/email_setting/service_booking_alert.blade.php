@extends('layouts.admin')
@section('title','Email Setting')
@section('heading','Service Booking Alert Email')
@section('css')
    <style>
        .bg-orange{
            background-color: orange;
        }
    </style>
@endsection

@section('content')
    @php
        $setting=$setting['service_booking_alert']??'';
        $setting=json_decode($setting)
    @endphp

     <section>
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="{{route('admin.email.save')}}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" value="service_booking_alert" name="email_type">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">

                                <div class="card-header card-header-primary">
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                            <strong class="text-info">Caption of Email:</strong>
                                                <input type="text" value="{{$setting->hello ??''}}" name="hello" class="form-control w-auto">
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">

                                            <strong class="text-info">Subject of Email:</strong>
                                            <textarea type="text" name="subject" class="form-control small-summernote"  placeholder="write subject...">{{$setting->subject??''}}
                                            </textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <strong class="text-info">1st Half of Email:</strong>
                                            <textarea type="text" name="first_part" class="form-control small-summernote">{{$setting->first_part??''}}</textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <strong class="text-info">2nd Half of Email:</strong>
                                            <textarea type="text" name="second_part" class="form-control small-summernote">
                                                {{$setting->second_part??''}}
                                            </textarea>
                                        </div>
                                        <div class="col-md-6 mt-2">
                                            <strong class="text-info">Signature of Email:</strong>
                                            <input type="hidden" name="set_img" value="{{$setting->image??''}}">
                                            <input type="file" name="image" class="form-control dropify"  data-default-file="{{asset($setting->image??'')}}">
                                        </div>
                                        <div class="col-md-6"></div>
                                        <div class="col-md-6 mt-1">
                                            <strong class="text-info">Thanks of Email:</strong>
                                            <input type="text" value="{{$setting->team??''}}" name="team" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-primary">Save</button>

                                </div>
                        </div>
                        <div class="col-md-6">
                            <div class="card">
                                <div class="card-title bg-orange p-1">
                                    <h1 class="text-center text-white">{{ env('APP_NAME') }}</h1>
                                </div>
                                <div class="card-body">
                                    <h4 id="hello">{{$setting->hello??''}}</h4>
                                    <br>
                                    <h3 id=subject>{!! html_entity_decode($setting->subject??'') !!}</h3>
                                    <p><span id="first_part">{!! html_entity_decode($setting->first_part??'') !!} </span><span class="font-weight-bold">Name of User</span></p>
                                    <p><span class="font-weight-bold">Name of Service</span>
                                    <span id="second_part">{!! html_entity_decode($setting->second_part??'')  !!}</span></p>
                                    <img src="{{asset($setting->image??'')}}" alt="no image"></img>
                                    <h5 id="team">{{$setting->team??''}}</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                   
                </form>
            </div>
        </div>
    </section>


@endsection

@section('js')
    <script>
        $(document).on('keyup','.form-control',function (){
            var name=$(this).attr('name')
            var val=$(this).val()
            if (name=='hello')
            {
                $('#hello').text(val)
            }if (name=='dear')
            {
                $('#dear').text(val)
            }
            if (name=='first_part')
            {

                $('#first_part').text(val)
            }
            if (name=='second_part')
            {
                $('#second_part').text(val)
            }
            if (name=='team')
            {
                $('#team').text(val)
            }
            
        })
    </script>
@endsection

