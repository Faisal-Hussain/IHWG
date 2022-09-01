@extends('layouts.admin')
@section('title','Create FAQ')
@section('heading','Create FAQ')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <form method="post" action="{{route('admin.faq.save')}}">
                            @csrf
                            <div class="form-group">
                                <label class="font-weight-bold">Question:</label>
                                <textarea class="form-control" name="question" placeholder="What is your Question?"></textarea>
                            </div>

                            <div class="form-group">
                                <label class="font-weight-bold">Answer:</label>
                                <textarea class="form-control small-summernote" name="answer" placeholder="What is your Question?"></textarea>
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
