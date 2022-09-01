@extends('layouts.admin')
@section('title','Email Setting')
@section('heading','Verify Email')
@section('css')
<style>
.bg-orange{
    background-color: orange;
}
</style>
@endsection

@section('content')
    @php
        $setting=$setting['verify_email']??'';
        $setting=json_decode($setting);

    @endphp

    <section>
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="{{route('admin.email.save')}}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" value="verify_email" name="email_type">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="card">

                                <div class="card-header card-header-primary">
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <strong class="text-info">Caption of Email:</strong>
                                            <div class="form-group">
                                                <input type="text" value="{{$setting->hello ??''}}" name="hello" class="form-control w-auto">
                                            </div>
                                        </div>
                                        <div class="col-md-12 mb-2">
                                            <strong class="text-info">Subject of Email:</strong>
                                            <textarea type="text" name="subject" class="form-control small-summernote" placeholder="write subject...">{{$setting->subject??''}}</textarea>
                                        </div>
                                        <div class="col-md-12">
                                            <strong class="text-info">Body Content of Email:</strong>
                                            <textarea type="text" name="desc" class="form-control small-summernote">
                                                {{$setting->desc??''}}
                                            </textarea>
                                        </div>

                                        <div class="col-md-6 mt-2">
                                            <strong class="text-info">Signature of Email:</strong>
                                            <input type="hidden" name="set_img" value="{{$setting->image??''}}">
                                            <input type="file" name="image" class="form-control dropify"  data-default-file="{{asset($setting->image??'')}}">
                                        </div>
                                        <div class="col-md-6"></div>

                                    </div>
                                </div>
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
                                    <h3 id=subject>{!! $setting->subject??'' !!}</h3>
                                    <p><span id="desc">{!! $setting->desc??'' !!} </span></p>
                                    <h5 id="name">{{$setting->name??'Name'}}: Dummy Name</h5>
                                    <h5 id="email">{{$setting->email??'Email'}}: dummyemail@gmail.com</h5>
                                     @if($setting->image??'')
                                    <img src="{{asset($setting->image??'')}}" alt="no image"></img>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-4 text-left">
                        <button type="submit" class="btn btn-primary">Save</button>

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
            }
            if (name=='desc')
            {
                $('#desc').text(val)
            }
            if (name=='name')
            {
                $('#name').text(val)
            }
            if (name=='email')
            {
                $('#email').text(val)
            }
            if (name=='subject')
            {
                $('#subject').text(val)
            }
        })
    </script>
@endsection

