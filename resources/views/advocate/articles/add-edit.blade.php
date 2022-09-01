@extends('layouts.advocate')
@section('title','Article Management')
@section('heading','Article Management')
@section('css')
<style>
 .ck-editor__editable
{
 min-height: 15vw !important;
}
.ck-file-dialog-button
{
    display: none;
}
</style>
@endsection
@section('content')
<div class="row">


        <div class="col-sm-12">
            <div class="card">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body card-dashboard">

                            @if ($errors->any())
                                <div class="alert alert-danger">
                                    <strong>Whoops!</strong> There were some problems with your input.<br><br>
                                    <ul>
                                        @foreach ($errors->all() as $error)
                                            <li>{{ $error }}</li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endif

                            @if((isset($article)))
                                <form action="{{ route('advocate.articles.update',$article->id) }}" method="POST" enctype="multipart/form-data">
                                @method('PUT')
                            @else
                                <form action="{{ route('advocate.articles.store') }}" method="POST" enctype="multipart/form-data">
                            @endif
                            @csrf
                            <div class="row">
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Title</label>
                                        <input type="text" class="form-control" name="title" placeholder="Title" value="{{ $article->title ?? '' }}" required>
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Slug</label>
                                        <input type="text" class="form-control" name="slug" placeholder="Slug" value="{{ $article->slug ?? '' }}" required>
                                    </fieldset>
                                </div>

                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Category</label>
                                        <input type="text" class="form-control" name="category" placeholder="Category" value="{{ $article->category ?? '' }}" required>
                                    </fieldset>
                                </div>
                                
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="">Summary</label>
                                        <textarea name="summary" class="form-control" placeholder="Summary">{!! $article->summary ?? '' !!}</textarea>
                                </div>


                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="">Body</label>
                                        <textarea name="body" class="form-control" id="description">{!! $article->body ?? '' !!}</textarea>
                                </div>

                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label>Featured Image</label>
                                    <input type="file" class="dropify" name="featured_image" data-default-file="@if(isset($article->featured_image)){{ asset($article->featured_image) ?? '' }}@endif">
                                   
                                </div>


                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Keywords</label>
                                        <input type="text" class="form-control" placeholder="nature, wallpaper, health" name="keywords" required value="{{ $article->keywords ?? '' }}">
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group pull-right">
                                        <button class="btn btn-relief-primary" type="submit">Save Article</button>
                                    </fieldset>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>
@endsection
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>
@section('js')
<script>
    $(document).ready(function() {
        ClassicEditor
            .create(document.querySelector('#description'))
            .then(editor => {
                descriptionEditor = editor;
            })
            .catch(error => {
                console.error(error);
            });
    });
</script>

<script>
    $('[name="title"]').keyup(function(){
        var str = $(this).val(); 
        $('[name="slug"]').val(str.replace(/\s+/g, '-').toLowerCase());    
    });
    
</script>

@endsection
