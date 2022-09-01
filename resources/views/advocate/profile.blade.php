@extends('layouts.advocate')
@section('title','Advocate Dashbaord')
@section('heading','Profile Management')


@section('content')

<!-- users edit start -->
<section class="users-edit">
    <div class="card">
        <div class="card-content">
            <div class="card-body">
                <h3>Profile Information</h3>
                <hr>
                <div class="">
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#account">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#change_password">Change Password</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="account" aria-labelledby="account-tab" role="tabpanel">
                            <form method="post" action="{{ route('advocate.update.profile') }}" enctype="multipart/form-data" id="profile-form" class="cmxform">
                                @csrf
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Profile Avatar</label>
                                        <input type="file" name="image" class="form-control dropify" data-default-file="{{asset(Auth::User()->avatar ?? '')}}">
                                    </div>
                                    <div class="col-12 col-sm-6">
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Name</label>
                                                <input type="text" class="form-control" name="name"
                                                    placeholder="name" value="{{Auth::User()->name ?? ''}}" required
                                                    data-validation-required-message="This name field is required">
                                                    @error('name')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="controls">
                                                <label>E-mail</label>
                                                <input type="email" class="form-control" placeholder="email"
                                                    name="email" value="{{Auth::User()->email}}" required
                                                    data-validation-required-message="This email field is required">
                                                    @error('email')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Phone</label>
                                                <input type="text" class="form-control" name="phone"
                                                    placeholder="Phone" value="{{Auth::User()->phone}}" required
                                                    data-validation-required-message="This phone field is required">
                                                    @error('phone')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        
                                        <div class="text-right">
                                            <button type="submit"
                                            class="btn btn-relief-primary ">Save
                                            Changes</button>
                                        </div>

                                    </div>
                                </div>
                            </form>
                            <!-- users edit account form ends -->
                        </div>
                        <div class="tab-pane" id="change_password" aria-labelledby="password-tab" role="tabpane2">
                            <form method="post" action="{{ route('advocate.update.password') }}" enctype="multipart/form-data" id="profile-form" class="cmxform">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group has-float-label">
                                            <div class="controls">
                                                <label for="account-old-password">Old Password</label>
                                                <input type="password" class="form-control @error('old_password') is-invalid @enderror" name="old_password" id="account-old-password" placeholder="Old Password" data-validation-message="This old password field is">
                                                @error('old_password')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group has-float-label">
                                            <div class="controls">
                                                <label for="account-new-password">New Password</label>
                                                <input id="user-password" class="form-control @error('password') is-invalid @enderror" name="password" autocomplete="current-password" type="password" name="password" id="account-new-password" class="form-control" placeholder="New Password" data-validation-message="The password field is" minlength="6">
                                                @error('password')
                                                    <span class="invalid-feedback" role="alert">
                                                        <strong>{{ $message }}</strong>
                                                    </span>
                                                @enderror
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group has-float-label">
                                            <div class="controls">
                                                <label for="account-retype-new-password">Retype New Password</label>
                                                <input type="password" name="password_confirmation" class="form-control" id="account-retype-new-password" data-validation-match-match="password" placeholder="New Password" data-validation-message="The Confirm password field is" minlength="6">
                                            </div>
                                        </div>
                                    </div>
                                    <!--<div class="col-12 d-flex flex-sm-row flex-column justify-content-end">-->
                                    <div class="col-12 text-right">
                                        <button type="submit" class="btn btn-relief-primary mr-sm-1 mb-1 mb-sm-0">
                                            Save changes
                                        </button>
                                    </div>
                                </div>
                            </form>
                            <!-- users edit account form ends -->






                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="card">
        <div class="card-content">
            <div class="card-body">
                <h3>Other Information</h3>
                <hr>

                <form method="post" action="{{ route('advocate.update.other.profile') }}" enctype="multipart/form-data" class="cmxform">
                                @csrf
                                <input type="hidden" name="profile_id" value="{{ Auth::User()->profile->id }}">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <label>Achievement (PDF)
                                            
                                            @if(Auth::User()->profile->acheivement != null)
                                                <button type="button" class="btn btn-sm btn-dark"  data-toggle="modal" data-target="#previewAcheivement"><i class="fa fa-eye"></i> Preview Acheivement</button>

                                                <div class="modal fade" id="previewAcheivement" tabindex="-1" role="dialog" aria-hidden="true">
                                                  <div class="modal-dialog modal-lg" role="document">
                                                    <div class="modal-content">
                                                      <div class="modal-header p-1">
                                                        <h5 class="modal-title" id="exampleModalLongTitle">My Acheivement</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                          <span aria-hidden="true">&times;</span>
                                                        </button>
                                                      </div>
                                                      <div class="modal-body">
                                                        <embed src="{{asset(Auth::User()->profile->acheivement)}}" type="application/pdf" style="width:100%; height:1000px;">
                                                      </div>
                                                    </div>
                                                  </div>
                                                </div>
                                            @endif

                                        </label>
                                        <input type="file" name="acheivement" class="form-control dropify" data-default-file="{{asset(Auth::User()->profile->acheivement)}}">
                                        @error('acheivement')
                                            <div class="alert alert-danger">{{ $message }}</div>
                                        @enderror


                                        <div class="form-group mt-1">
                                            <div class="controls">
                                                <label>City</label>
                                                <input type="text" class="form-control" name="city"
                                                    placeholder="name" value="{{Auth::User()->profile->city}}" required
                                                    data-validation-required-message="This city field is required">
                                                    @error('city')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>State</label>
                                                <input type="text" class="form-control" name="state"
                                                    placeholder="name" value="{{Auth::User()->profile->state}}" required
                                                    data-validation-required-message="This state field is required">
                                                    @error('state')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>


                                    </div>




                                    <div class="col-12 col-sm-6">
                                        
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Store Name</label>
                                                <input type="text" class="form-control" name="store_name"
                                                    placeholder="Store Name" value="{{Auth::User()->profile->store_name}}" required
                                                    data-validation-required-message="This Store Name field is required">
                                                    @error('store_name')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Address Line 1</label>
                                                <input type="text" class="form-control" name="address_line_1"
                                                    placeholder="Address Line" value="{{Auth::User()->profile->address_line_1}}" required
                                                    data-validation-required-message="This Address Line field is required">
                                                    @error('address_line_1')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Address Line 2</label>
                                                <input type="text" class="form-control" name="address_line_2"
                                                    placeholder="Address Line" value="{{Auth::User()->profile->address_line_2}}" required
                                                    data-validation-required-message="This Address Line field is required">
                                                    @error('address_line_2')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        
                                        
                                        
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Country</label>
                                                <input type="text" class="form-control" name="country"
                                                    placeholder="Country" value="{{Auth::User()->profile->country}}" required
                                                    data-validation-required-message="This country field is required">
                                                    @error('country')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="controls">
                                                <label>Zip Code</label>
                                                <input type="text" class="form-control" name="zip_code"
                                                    placeholder="Zip Code" value="{{Auth::User()->profile->zip_code}}" required
                                                    data-validation-required-message="This Zip Code field is required">
                                                    @error('zip_code')
                                                    <div class="alert alert-danger">{{ $message }}</div>
                                                    @enderror
                                            </div>
                                        </div>
                                        
                                        
                                        <div class="text-right">
                                            <button type="submit"
                                            class="btn btn-relief-primary ">Save
                                            Changes</button>
                                        </div>

                                    </div>
                                </div>
                            </form>
            </div>
        </div>
    </div>
    
</section>
<!-- users edit ends -->

@endsection
