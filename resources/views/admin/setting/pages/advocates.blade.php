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
                                <h4 class="card-title">Advocates </h4>
                                <a class="font-weight-bold" href="{{ route('admin.setting.index') }}">(Back to Control panel)</a>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['advocates_title'] ?? ''}}" name="advocates_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Keywords</label>
                                            <input type="text" value="{{$setting['advocates_keywords'] ?? ''}}" name="advocates_keywords" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Description</label>
                                            <input type="text" value="{{$setting['advocates_description'] ?? ''}}" name="advocates_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-12">

                                        <div class="form-group">
                                            <label>Banner Image</label>
                                            <input type="file" class=" dropify dropify-event" name="advocates_banner_image" data-default-file="{{ asset($setting['advocates_banner_image'] ?? '')  }}">
                                        </div>

                                    </div>


                                    <div class="col-md-12">
                                        <h4>Body Section</h4>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Body Heading</label>
                                            <input type="text" value="{{$setting['advocates_body_heading'] ?? ''}}" name="advocates_body_heading" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Body Description</label>
                                            <input type="text" value="{{$setting['advocates_body_description'] ?? ''}}" name="advocates_body_description" class="form-control">
                                        </div>
                                    </div>



                                </div>
                            </div>
                        </div>
                    </div>


                </div>

                <!--=======================================================-->
                                    <!--SECTION 1 OF PAGE-->
                <!--=======================================================-->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Advocates Section 1</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['advocates_section_1_title'] ?? ''}}" name="advocates_section_1_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['advocates_section_1_description'] ?? ''}}" name="advocates_section_1_description" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <h4 class="text-primary">Slider Data</h4>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="row">

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 1 Left Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_1_slider_left_heading'] ?? ''}}" name="advocates_sec_1_slider_left_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 1 Left Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_1_slider_left_description'] ?? ''}}" name="advocates_sec_1_slider_left_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Left Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_left_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_left_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Left Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_left_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_left_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Left Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_left_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_left_image_3'] ?? '')  }}">
                                                </div>

                                            </div>

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 1 Right Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_1_slider_right_heading'] ?? ''}}" name="advocates_sec_1_slider_right_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 1 Right Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_1_slider_right_description'] ?? ''}}" name="advocates_sec_1_slider_right_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Right Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_right_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_right_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Right Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_right_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_right_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 1 Right Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_1_slider_right_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_1_slider_right_image_3'] ?? '')  }}">
                                                </div>

                                            </div>



                                        </div>
                                    </div>






                                </div>
                            </div>
                        </div>
                    </div>


                </div>


                <!--=======================================================-->
                                    <!--SECTION 2 OF PAGE-->
                <!--=======================================================-->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Advocates Section 2</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['advocates_section_2_title'] ?? ''}}" name="advocates_section_2_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['advocates_section_2_description'] ?? ''}}" name="advocates_section_2_description" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <h4 class="text-primary">Slider Data</h4>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="row">

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 2 Left Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_2_slider_left_heading'] ?? ''}}" name="advocates_sec_2_slider_left_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 2 Left Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_2_slider_left_description'] ?? ''}}" name="advocates_sec_2_slider_left_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Left Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_left_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_left_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Left Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_left_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_left_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Left Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_left_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_left_image_3'] ?? '')  }}">
                                                </div>

                                            </div>

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 2 Right Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_2_slider_right_heading'] ?? ''}}" name="advocates_sec_2_slider_right_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 2 Right Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_2_slider_right_description'] ?? ''}}" name="advocates_sec_2_slider_right_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Right Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_right_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_right_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Right Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_right_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_right_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 2 Right Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_2_slider_right_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_2_slider_right_image_3'] ?? '')  }}">
                                                </div>

                                            </div>



                                        </div>
                                    </div>






                                </div>
                            </div>
                        </div>
                    </div>


                </div>


                <!--=======================================================-->
                                    <!--SECTION 3 OF PAGE-->
                <!--=======================================================-->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Advocates Section 3</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['advocates_section_3_title'] ?? ''}}" name="advocates_section_3_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['advocates_section_3_description'] ?? ''}}" name="advocates_section_3_description" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <h4 class="text-primary">Slider Data</h4>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="row">

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 3 Left Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_3_slider_left_heading'] ?? ''}}" name="advocates_sec_3_slider_left_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 3 Left Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_3_slider_left_description'] ?? ''}}" name="advocates_sec_3_slider_left_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Left Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_left_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_left_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Left Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_left_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_left_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Left Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_left_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_left_image_3'] ?? '')  }}">
                                                </div>

                                            </div>

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 3 Right Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_3_slider_right_heading'] ?? ''}}" name="advocates_sec_3_slider_right_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 3 Right Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_3_slider_right_description'] ?? ''}}" name="advocates_sec_3_slider_right_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Right Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_right_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_right_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Right Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_right_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_right_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 3 Right Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_3_slider_right_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_3_slider_right_image_3'] ?? '')  }}">
                                                </div>

                                            </div>



                                        </div>
                                    </div>






                                </div>
                            </div>
                        </div>
                    </div>


                </div>



                <!--=======================================================-->
                                    <!--SECTION 4 OF PAGE-->
                <!--=======================================================-->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Advocates Section 4</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['advocates_section_4_title'] ?? ''}}" name="advocates_section_4_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['advocates_section_4_description'] ?? ''}}" name="advocates_section_4_description" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <h4 class="text-primary">Slider Data</h4>
                                    </div>


                                    <div class="col-md-12">
                                        <div class="row">

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 4 Left Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_4_slider_left_heading'] ?? ''}}" name="advocates_sec_4_slider_left_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 3 Left Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_4_slider_left_description'] ?? ''}}" name="advocates_sec_4_slider_left_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Left Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_left_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_left_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Left Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_left_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_left_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Left Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_left_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_left_image_3'] ?? '')  }}">
                                                </div>

                                            </div>

                                            <div class="col-sm-6">

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 4 Right Slider Heading</label>
                                                    <input type="text" value="{{$setting['advocates_sec_4_slider_right_heading'] ?? ''}}" name="advocates_sec_4_slider_right_heading" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label class="bmd-label-floating">Section 4 Right Slider Description</label>
                                                    <input type="text" value="{{$setting['advocates_sec_4_slider_right_description'] ?? ''}}" name="advocates_sec_4_slider_right_description" class="form-control">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Right Slider Image 1</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_right_image_1"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_right_image_1'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Right Slider Image 2</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_right_image_2"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_right_image_2'] ?? '')  }}">
                                                </div>

                                                <div class="form-group">
                                                    <label">Section 4 Right Slider Image 3</label>
                                                    <input type="file" class=" dropify dropify-event" name="advocates_sec_4_slider_right_image_3"
                                                    data-default-file="{{ asset($setting['advocates_sec_4_slider_right_image_3'] ?? '')  }}">
                                                </div>

                                            </div>



                                        </div>
                                    </div>






                                </div>
                            </div>
                        </div>
                    </div>


                </div>



                <!--=======================================================-->
                            <!--SECTION TESTIMONIAL OF PAGE-->
                <!--=======================================================-->


                <div class="row">
                    <div class="col-md-12">
                        <div class="card">

                            <div class="card-header card-header-primary">
                                <h4 class="card-title">Advocates Testimonial Section</h4>
                            </div>
                            <div class="card-body">
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Name</label>
                                            <input type="text" value="{{$setting['adv_test_name'] ?? ''}}" name="adv_test_name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Designation</label>
                                            <input type="text" value="{{$setting['adv_test_designation'] ?? ''}}" name="adv_test_designation" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Description</label>
                                            <input type="text" value="{{$setting['adv_test_desription'] ?? ''}}" name="adv_test_desription" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label">Avatar</label>
                                            <input type="file" class=" dropify dropify-event" name="adv_test_avatar"
                                            data-default-file="{{ asset($setting['adv_test_avatar'] ?? '')  }}">
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

