@extends('layouts.admin')
@section('title','Setting')
@section('heading','Settings Control')

@section('css')
<style>
    h4
    {
        color: #24B263 !important;
        font-weight: bold !important;
    }
</style>
@endsection

@section('content')

<section>
    <div class="row">
        <div class="col-sm-12">
            <form method="post" action="{{ route('admin.setting.update') }}" enctype="multipart/form-data">
                @csrf
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">About us</h4>
                                <a class="font-weight-bold" href="{{ route('admin.setting.index') }}">(Back to Control panel)</a>
                            </div>
                            <div class="card-body">
                                <div class="row">
            
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['about_title'] ?? ''}}" name="about_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Keywords</label>
                                            <input type="text" value="{{$setting['about_keywords'] ?? ''}}" name="about_keywords" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Description</label>
                                            <input type="text" value="{{$setting['about_description'] ?? ''}}" name="about_description" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Main Body Heading</label>
                                            <input type="text" value="{{$setting['about_main_heading'] ?? ''}}" name="about_main_heading" class="form-control">
                                        </div>
                                    </div>
                                    
                                     <div class="col-md-12">
                                        <h4>Sections</h4>                                    
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Section</label>
                                            <input type="text" value="{{$setting['about_section_1st_heading'] ?? ''}}" name="about_section_1st_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Section Description</label>
                                            <textarea name="about_section_1st_desctiption" class="form-control">{{$setting['about_section_1st_desctiption'] ?? ''}}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>1st Section Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="about_section_1st_thumbnail" data-default-file="{{ asset($setting['about_section_1st_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Section</label>
                                            <input type="text" value="{{$setting['about_section_2nd_heading'] ?? ''}}" name="about_section_2nd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Section Description</label>
                                            <textarea name="about_section_2nd_desctiption" class="form-control">{{$setting['about_section_2nd_desctiption'] ?? ''}}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>2nd Section Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="about_section_2nd_thumbnail" data-default-file="{{ asset($setting['about_section_2nd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Section</label>
                                            <input type="text" value="{{$setting['about_section_3rd_heading'] ?? ''}}" name="about_section_3rd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Section Description</label>
                                            <textarea name="about_section_3rd_desctiption" class="form-control">{{$setting['about_section_3rd_desctiption'] ?? ''}}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>3rd Section Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="about_section_3rd_thumbnail" data-default-file="{{ asset($setting['about_section_3rd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Section</label>
                                            <input type="text" value="{{$setting['about_section_4th_heading'] ?? ''}}" name="about_section_4th_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Section Description</label>
                                            <textarea name="about_section_4th_desctiption" class="form-control">{{$setting['about_section_4th_desctiption'] ?? ''}}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>4th Section Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="about_section_4th_thumbnail" data-default-file="{{ asset($setting['about_section_4th_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    
                                    
                                    <div class="col-md-12">
                                        <h4>About Bottom Section</h4>                                    
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Section Heading</label>
                                            <input type="text" value="{{$setting['about_bottom_section_heading'] ?? ''}}" name="about_bottom_section_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Section Description</label>
                                            <input type="text" value="{{$setting['about_bottom_section_description'] ?? ''}}" name="about_bottom_section_description" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Section Interested Heading</label>
                                            <input type="text" value="{{$setting['about_bottom_section_interested'] ?? ''}}" name="about_bottom_section_interested" class="form-control">
                                        </div>
                                    </div>
                                    

                                    
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <div class="btn-group pull-right mb-3">
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</section>

@endsection

