@extends('layouts.admin')

@section('title','Update Service Theme')
@section('heading','Update Service Theme')

@section('css')

@endsection
@section('content')

    <div class="row">



        <div class="col-sm-12">
            <div class="card">
                <div class="card">

                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <form method="post" action="{{route('admin.services.create')}}" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="id" value="{{$data->id}}">
                                <label>Theme Title</label>
                                <div class="input-group mb-2 mr-sm-2">
                                    <input type="text" class="form-control rounded-0" id="title" name="title" placeholder="e.g. Gray Theme" required="" value="{{$data->title??''}}">
                                </div>
                                <label>Pick Color</label>
                                <div class="input-group mb-2 mr-sm-2">
                                    <input type="color" class="w-100 rounded-0" id="color" name="color" required="" value="{{$data->color??''}}">
                                </div>
                                <label>Cover</label>
                                <div class="input-group mb-2 mr-sm-2">
                                    <input type="file" class=" dropify" id="fileChooser" name="cover"  data-default-file="{{asset($data->cover)}}">
                                </div>
                                
                                
                                <div class="text-right">
                                    <button class="btn btn-dark" type="submit">Save</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('js')
    
@endsection
