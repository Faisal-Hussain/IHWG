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
                                <h4 class="card-title">Homepage</h4>
                                <a class="font-weight-bold" href="{{ route('admin.setting.index') }}">(Back to Control panel)</a>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['homepage_title'] ?? ''}}" name="homepage_title" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Description</label>
                                            <input type="text" value="{{$setting['homepage_description'] ?? ''}}" name="homepage_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Keywords</label>
                                            <input type="text" value="{{$setting['homepage_keywords'] ?? ''}}" name="homepage_keywords" class="form-control">
                                        </div>
                                    </div>

                                    

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Banner Heading</label>
                                            <input type="text" value="{{$setting['banner_heading'] ?? ''}}" name="banner_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Banner Description</label>
                                            <input type="text" value="{{$setting['banner_description'] ?? ''}}" name="banner_description" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Banner Image</label>
                                            <input type="file" class=" dropify dropify-event" name="banner_image" data-default-file="{{ asset($setting['banner_image'] ?? '')  }}">
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Reopening Journey Heading</label>
                                            <input type="text" value="{{$setting['reopening_journey_heading'] ?? ''}}" name="reopening_journey_heading" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Reopening Journey Description</label>
                                            <input type="text" value="{{$setting['reopening_journey_description'] ?? ''}}" name="reopening_journey_description" class="form-control">
                                        </div>
                                    </div>

                                   <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">{{$setting['chwg_for_advocates'] ?? 'CHWG for Advocates'}} Heading</label>
                                            <input type="text" value="{{$setting['chwg_for_advocates'] ?? 'CHWG for Advocates'}}" name="chwg_for_advocates" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">{{$setting['chwg_for_advocates'] ?? 'CHWG for Advocates'}} Description</label>
                                            <input type="text" value="{{$setting['chwg_for_advocates_description'] ?? ''}}" name="chwg_for_advocates_description" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>{{$setting['chwg_for_advocates'] ?? 'CHWG for Advocates'}} Icon</label>
                                            <input type="file" class=" dropify dropify-event"  name="chwg_for_advocates_icon" data-default-file="{{ asset($setting['chwg_for_advocates_icon'] ?? '')  }}">
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">{{$setting['chwg_for_homeopaths'] ?? 'CHWG for Homeopaths'}} Heading</label>
                                            <input type="text" value="{{$setting['chwg_for_homeopaths'] ?? 'CHWG for Homeopaths'}}" name="chwg_for_homeopaths" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">{{$setting['chwg_for_homeopaths'] ?? 'CHWG for Homeopaths'}} Description</label>
                                            <input type="text" value="{{$setting['chwg_for_homeopaths_description'] ?? ''}}" name="chwg_for_homeopaths_description" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>{{$setting['chwg_for_homeopaths'] ?? 'CHWG for Homeopaths'}} Icon</label>
                                            <input type="file" class=" dropify dropify-event"  name="chwg_for_homeopaths_icon" data-default-file="{{ asset($setting['chwg_for_homeopaths_icon'] ?? '')  }}">
                                        </div>
                                        
                                    </div>
                                    
                                    
                                    <div class="col-md-12">
                                        <h4>Helpful Resources</h4>                                    
                                    </div>
                                    <div class="col-md-12 col-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Sub Heading</label>
                                            <input type="text" value="{{$setting['helpful_resource_sub_heading'] ?? ''}}" name="helpful_resource_sub_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st heading</label>
                                            <input type="text" value="{{$setting['helpful_resource_1st_heading'] ?? ''}}" name="helpful_resource_1st_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Description</label>
                                            <input type="text" value="{{$setting['helpful_resource_1st_description'] ?? ''}}" name="helpful_resource_1st_description" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>1st Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="helpful_resource_1st_thumbnail" data-default-file="{{ asset($setting['helpful_resource_1st_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd heading</label>
                                            <input type="text" value="{{$setting['helpful_resource_2nd_heading'] ?? ''}}" name="helpful_resource_2nd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Description</label>
                                            <input type="text" value="{{$setting['helpful_resource_2nd_description'] ?? ''}}" name="helpful_resource_2nd_description" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>2nd Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="helpful_resource_2nd_thumbnail" data-default-file="{{ asset($setting['helpful_resource_2nd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd heading</label>
                                            <input type="text" value="{{$setting['helpful_resource_3rd_heading'] ?? ''}}" name="helpful_resource_3rd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Description</label>
                                            <input type="text" value="{{$setting['helpful_resource_3rd_description'] ?? ''}}" name="helpful_resource_3rd_description" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>3rd Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="helpful_resource_3rd_thumbnail" data-default-file="{{ asset($setting['helpful_resource_3rd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    
                                    <div class="col-md-12">
                                        <h4>{{$setting['secure_heading'] ?? 'Secure Non-cercare Real'}}  </h4>                                    
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Heading</label>
                                            <input type="text" value="{{$setting['secure_heading'] ?? ''}}" name="secure_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['secure_description'] ?? ''}}" name="secure_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st heading</label>
                                            <input type="text" value="{{$setting['secure_1st_heading'] ?? ''}}" name="secure_1st_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Description</label>
                                            <input type="text" value="{{$setting['secure_1st_description'] ?? ''}}" name="secure_1st_description" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd heading</label>
                                            <input type="text" value="{{$setting['secure_2nd_heading'] ?? ''}}" name="secure_2nd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Description</label>
                                            <input type="text" value="{{$setting['secure_2nd_description'] ?? ''}}" name="secure_2nd_description" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd heading</label>
                                            <input type="text" value="{{$setting['secure_3rd_heading'] ?? ''}}" name="secure_3rd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Description</label>
                                            <input type="text" value="{{$setting['secure_3rd_description'] ?? ''}}" name="secure_3rd_description" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label>Image</label>
                                            <input type="file" class=" dropify dropify-event"  name="secure_image" data-default-file="{{ asset($setting['secure_image'] ?? '')  }}">
                                        </div>
                                    </div>
                                    



                                    <div class="col-md-12">
                                        <h4>{{$setting['what_is_ch_for_adv_heading'] ?? 'What is CHWG for Advocates'}}  </h4>                                    
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Heading</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_heading'] ?? ''}}" name="what_is_ch_for_adv_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_description'] ?? ''}}" name="what_is_ch_for_adv_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_1st_word'] ?? ''}}" name="what_is_ch_for_adv_1st_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_1st_title'] ?? ''}}" name="what_is_ch_for_adv_1st_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_1st_summary'] ?? ''}}" name="what_is_ch_for_adv_1st_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>1st Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_adv_1st_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_adv_1st_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_2nd_word'] ?? ''}}" name="what_is_ch_for_adv_2nd_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st2nd Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_2nd_title'] ?? ''}}" name="what_is_ch_for_adv_2nd_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_2nd_summary'] ?? ''}}" name="what_is_ch_for_adv_2nd_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>2nd Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_adv_2nd_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_adv_2nd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_3rd_word'] ?? ''}}" name="what_is_ch_for_adv_3rd_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_3rd_title'] ?? ''}}" name="what_is_ch_for_adv_3rd_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_3rd_summary'] ?? ''}}" name="what_is_ch_for_adv_3rd_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>3rd Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_adv_3rd_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_adv_3rd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_4th_word'] ?? ''}}" name="what_is_ch_for_adv_4th_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_4th_title'] ?? ''}}" name="what_is_ch_for_adv_4th_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_adv_4th_summary'] ?? ''}}" name="what_is_ch_for_adv_4th_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>4th Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_adv_4th_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_adv_4th_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    





                                    <div class="col-md-12">
                                        <h4>{{$setting['what_is_ch_for_homeo_heading'] ?? 'What is CHWG for Homeopaths'}}  </h4>                                    
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Heading</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_heading'] ?? ''}}" name="what_is_ch_for_homeo_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_description'] ?? ''}}" name="what_is_ch_for_homeo_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_1st_word'] ?? ''}}" name="what_is_ch_for_homeo_1st_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_1st_title'] ?? ''}}" name="what_is_ch_for_homeo_1st_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_1st_summary'] ?? ''}}" name="what_is_ch_for_homeo_1st_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>1st Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_homeo_1st_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_homeo_1st_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_2nd_word'] ?? ''}}" name="what_is_ch_for_homeo_2nd_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st2nd Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_2nd_title'] ?? ''}}" name="what_is_ch_for_homeo_2nd_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_2nd_summary'] ?? ''}}" name="what_is_ch_for_homeo_2nd_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>2nd Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_homeo_2nd_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_homeo_2nd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_3rd_word'] ?? ''}}" name="what_is_ch_for_homeo_3rd_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_3rd_title'] ?? ''}}" name="what_is_ch_for_homeo_3rd_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_3rd_summary'] ?? ''}}" name="what_is_ch_for_homeo_3rd_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>3rd Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_homeo_3rd_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_homeo_3rd_thumbnail'] ?? '')  }}">
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Word</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_4th_word'] ?? ''}}" name="what_is_ch_for_homeo_4th_word" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Title</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_4th_title'] ?? ''}}" name="what_is_ch_for_homeo_4th_title" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Slide Summary</label>
                                            <input type="text" value="{{$setting['what_is_ch_for_homeo_4th_summary'] ?? ''}}" name="what_is_ch_for_homeo_4th_summary" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label>4th Slide Thumbnail</label>
                                            <input type="file" class=" dropify dropify-event"  name="what_is_ch_for_homeo_4th_thumbnail" data-default-file="{{ asset($setting['what_is_ch_for_homeo_4th_thumbnail'] ?? '')  }}">
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

