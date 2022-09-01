@extends('layouts.admin')
@section('title','Update FAQ')
@section('heading','Update FAQ')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <form method="post" action="{{route('admin.faq.save')}}">
                            @csrf
                            <input type="hidden" name="id" value="{{$data->id}}">
                            <div class="form-group">
                                <label class="font-weight-bold">Question:</label>
                                <textarea class="form-control" name="question" placeholder="What is your Question?">{{$data->question}}</textarea>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Answer:</label>
                                <textarea class="form-control small-summernote" name="answer" placeholder="What is your Question?">{!! html_entity_decode($data->answer) !!}</textarea>
                            </div>

                            <button type="submit" class="btn btn-primary">Save</button>
                            
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
