@extends('layouts.admin')
@section('title','Setting')
@section('heading','Control Panel')


@section('content')

<section>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table p-0">
                                <thead>
                                    <tr>
                                        <th width="60%">Pages</th>
                                        <th>Page URL</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">General Settings</h3></th>
                                        <td>------------------------------</td>
                                        <th class="text-right"><a href="{{ route('admin.setting.general') }}" class="btn btn-primary w-100 font-weight-bold">Update General Settings</a></th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Toastr Settings</h3></th>
                                        <td>------------------------------</td>
                                        <th class="text-right"><a href="{{ route('admin.setting.toastr') }}" class="btn btn-primary w-100 font-weight-bold">Update Toastr Settings</a></th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Homepage Settings</h3></th>
                                        <td><a href="{{ route('index') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            
                                            <a href="{{ route('admin.setting.homepage') }}" class="btn btn-primary w-100 font-weight-bold">Update Homepage</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Terms & Conditions</h3></th>
                                        <td><a href="{{ route('terms') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            <a href="{{ route('admin.setting.terms') }}" class="btn btn-primary w-100 font-weight-bold">Update Terms</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Privacy & Policy</h3></th>
                                        <td><a href="{{ route('privacy.policy') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            
                                            <a href="{{ route('admin.setting.privacy') }}" class="btn btn-primary w-100 font-weight-bold">Update Privacy</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Our Mission</h3></th>
                                        <td><a href="{{ route('our.mission') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            
                                            <a href="{{ route('admin.setting.mission') }}" class="btn btn-primary w-100 font-weight-bold">Update Our Mission</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">About us</h3></th>
                                        <td><a href="{{ route('about.us') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            
                                            <a href="{{ route('admin.setting.about') }}" class="btn btn-primary w-100 font-weight-bold">Update About us</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Advocates</h3></th>
                                        <td><a href="{{ route('advocates') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            
                                            <a href="{{ route('admin.setting.advocates') }}" class="btn btn-primary w-100 font-weight-bold">Update Advocates</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Badges</h3></th>
                                        <td>------------------------------</td>
                                        <th class="text-right">
                                            <a href="{{ route('admin.setting.badges') }}" class="btn btn-primary w-100 font-weight-bold">Visit Badges</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Ads</h3></th>
                                        <td>------------------------------</td>
                                        <th class="text-right">
                                            <a href="{{ route('admin.setting.ads.index') }}" class="btn btn-primary w-100 font-weight-bold">Visit Ads</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">FAQ</h3></th>
                                        <td>------------------------------</td>
                                        <th class="text-right">
                                            <a href="{{ route('admin.faq.index') }}" class="btn btn-primary w-100 font-weight-bold">FAQ Setting</a>
                                        </th>
                                    </tr>
                                    <tr>
                                        <th><h3 class="text-success font-weight-bold">Emails For News Letter</h3></th>
                                        <td><a href="{{ route('newsletter.email.list') }}" target="_blank" class="btn btn-success w-100 font-weight-bold">Visit Page</a></td>
                                        <th class="text-right">
                                            ------------------------------
                                        </th>
                                    </tr>
                                    
                                    
                                    
                                    
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div> 
            </div>
        </div>
    </div>
</section>

@endsection

 