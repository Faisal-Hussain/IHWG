@extends('layouts.admin')
@section('title','Email Setting')
@section('heading','Register User Email')
@section('css')
<style>
.bg-orange{
    background-color: orange;
}
</style>
@endsection

@section('content')
    @php
        $setting=$setting['register_user']??'';
        $setting=json_decode($setting);

    @endphp

    <section>
        <div class="row">
            <div class="col-sm-12">
                <form method="post" action="{{route('admin.email.save')}}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" value="register_user" name="email_type">

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
                                            <strong class="text-info">Content of Email:</strong>
                                            <textarea type="text" name="desc" class="form-control small-summernote">
                                                {{$setting->desc??''}}
                                            </textarea>
                                        </div>
                                        <div class="col-md-6">
                                            <strong class="text-info">Signature of Email:</strong>
                                            <input type="hidden" name="set_img" value="{{$setting->image??''}}">
                                            <input type="file" name="image" class="form-control dropify"  data-default-file="{{asset($setting->image??'')}}">
                                        </div>
                                        <div class="col-md-6">
                                        </div>
                                        <div class="col-md-3 mt-1">
                                            <strong class="text-info">Thanks of Email:</strong>
                                            <input type="text" value="{{$setting->team??''}}" name="team" class="form-control">
                                        </div>
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
                                    @if($setting->image??'')
                                    <img src="{{asset($setting->image??'')}}" alt="no image"></img>
                                    @endif
                                    <h5 id="team">{{$setting->team??''}}</h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="btn-group">
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
            if (name=='team')
            {
                $('#team').text(val)
            }
            if (name=='subject')
            {
                $('#subject').text(val)
            }
        })
    </script>
@endsection

