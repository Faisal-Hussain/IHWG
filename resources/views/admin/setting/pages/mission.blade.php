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
                                <h4 class="card-title">Our Mission </h4>
                                <a class="font-weight-bold" href="{{ route('admin.setting.index') }}">(Back to Control panel)</a>
                            </div>
                            <div class="card-body">
                                <div class="row">
            
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Title</label>
                                            <input type="text" value="{{$setting['mission_title'] ?? ''}}" name="mission_title" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Keywords</label>
                                            <input type="text" value="{{$setting['mission_keywords'] ?? ''}}" name="mission_keywords" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Meta Description</label>
                                            <input type="text" value="{{$setting['mission_description'] ?? ''}}" name="mission_description" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <h4>Mission Statement </h4>                                    
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Mission Statemtnt Heading</label>
                                            <input type="text" value="{{$setting['mission_statemtnt_heading'] ?? ''}}" name="mission_statemtnt_heading" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <h4>Mission Statement First Row </h4>                                    
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st heading</label>
                                            <input type="text" value="{{$setting['mission_stat_1st_heading'] ?? ''}}" name="mission_stat_1st_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">1st Description</label>
                                            <input type="text" value="{{$setting['mission_stat_1st_description'] ?? ''}}" name="mission_stat_1st_description" class="form-control">
                                        </div>
                                    </div>
                                    <!--===========END 1ST SECTION============-->

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd heading</label>
                                            <input type="text" value="{{$setting['mission_stat_2nd_heading'] ?? ''}}" name="mission_stat_2nd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">2nd Description</label>
                                            <input type="text" value="{{$setting['mission_stat_2nd_description'] ?? ''}}" name="mission_stat_2nd_description" class="form-control">
                                        </div>
                                    </div>
                                    <!--===========END 2ND SECTION============-->


                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd heading</label>
                                            <input type="text" value="{{$setting['mission_stat_3rd_heading'] ?? ''}}" name="mission_stat_3rd_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">3rd Description</label>
                                            <input type="text" value="{{$setting['mission_stat_3rd_description'] ?? ''}}" name="mission_stat_3rd_description" class="form-control">
                                        </div>
                                    </div>

                                    <!--===========END 3RD SECTION============-->

                                    <div class="col-md-12">
                                        <h4>Mission Statement Second Row </h4>                                    
                                    </div>

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th heading</label>
                                            <input type="text" value="{{$setting['mission_stat_4th_heading'] ?? ''}}" name="mission_stat_4th_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">4th Description</label>
                                            <input type="text" value="{{$setting['mission_stat_4th_description'] ?? ''}}" name="mission_stat_4th_description" class="form-control">
                                        </div>
                                    </div>
                                    <!--===========END 4TH SECTION============-->

                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">5th heading</label>
                                            <input type="text" value="{{$setting['mission_stat_5th_heading'] ?? ''}}" name="mission_stat_5th_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">5th Description</label>
                                            <input type="text" value="{{$setting['mission_stat_5th_description'] ?? ''}}" name="mission_stat_5th_description" class="form-control">
                                        </div>
                                    </div>
                                    <!--===========END 5th SECTION============-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">6th heading</label>
                                            <input type="text" value="{{$setting['mission_stat_6th_heading'] ?? ''}}" name="mission_stat_6th_heading" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">6th Description</label>
                                            <input type="text" value="{{$setting['mission_stat_6th_description'] ?? ''}}" name="mission_stat_6th_description" class="form-control">
                                        </div>
                                    </div>
                                    <!--===========END 6th SECTION============-->
                                    
                                    
                                    
                                    
                                    <div class="col-md-12">
                                        <h4>Vision Statement </h4>                                    
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Vision Statemtnt Heading</label>
                                            <input type="text" value="{{$setting['vision_statemtnt_heading'] ?? ''}}" name="vision_statemtnt_heading" class="form-control">
                                        </div>
                                    </div>


                                    <div class="col-md-12">
                                        <h4>Mission Stats </h4>                                    
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Statemtnt Number of Users (Million)</label>
                                            <input type="text" value="{{$setting['statement_users_count'] ?? ''}}" name="statement_users_count" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Statemtnt of Users</label>
                                            <input type="text" value="{{$setting['statement_users'] ?? ''}}" name="statement_users" class="form-control">
                                        </div>
                                        
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Statemtnt Number of Countries</label>
                                            <input type="text" value="{{$setting['statement_countries_count'] ?? ''}}" name="statement_countries_count" class="form-control">
                                        </div>
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Statemtnt of Countries</label>
                                            <input type="text" value="{{$setting['statement_countries'] ?? ''}}" name="statement_countries" class="form-control">
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
@section('js')
<script type="text/javascript">
    
</script>
@endsection

