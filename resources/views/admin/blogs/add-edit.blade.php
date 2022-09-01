@extends('layouts.admin')
@section('title','Blog Management')
@section('heading','Blog Management')
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

                            @if((isset($blog)))
                                <form action="{{ route('admin.blogs.update',$blog->id) }}" method="POST" enctype="multipart/form-data">
                                @method('PUT')
                            @else
                                <form action="{{ route('admin.blogs.store') }}" method="POST" enctype="multipart/form-data">
                            @endif
                            @csrf
                            <div class="row">
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Title</label>
                                        <input type="text" class="form-control" name="title" placeholder="Title" value="{{ $blog->title ?? old('title') }}" required>
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Slug</label>
                                        <input type="text" class="form-control" name="slug" placeholder="Slug" value="{{ $blog->slug ?? old('slug') }}" required>
                                    </fieldset>
                                </div>
                                
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="">Description</label>
                                        <textarea name="description" class="form-control" id="description">{!! $blog->description ?? old('description')  !!}</textarea>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <label for="basicInput">Featured Image</label>
                                    <input type="file" class="dropify" name="featured_image" data-default-file="@if(isset($blog->featured_image)){{ asset($blog->featured_image) ?? '' }}@endif">
                                    <input type="text" class="form-control-md w-100 rounded-0" required="" name="featured_image_alt" placeholder="Featured Image Alt Title" value="{{ $blog->featured_image_alt ?? old('featured_image_alt') }}">
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Status</label>
                                        <select class="form-control" name="status" required>
                                            @if(isset($blog->status))
                                            <option value="{{ $blog->status }}" hidden>{{ $blog->status }}</option>
                                            @endif
                                            <option value="Latest">Latest</option>
                                            <option value="Trending">Trending</option>
                                            <option value="Featured">Featured</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </fieldset>
                                </div>


                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Meta Description</label>
                                        <textarea name="meta_description" class="form-control" id="" required>{{ $blog->meta_description ?? old('meta_description') }} </textarea>
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group">
                                        <label for="basicInput">Keywords</label>
                                        <input type="text" class="form-control" placeholder="nature, wallpaper, health" name="keywords" required value="{{ $blog->keywords ?? old('keywords') }}">
                                    </fieldset>
                                </div>
                                <div class="col-xl-12 col-md-12 col-12 mb-1">
                                    <fieldset class="form-group pull-right">
                                        <button class="btn btn-relief-primary" type="submit">Save Changes</button>
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
