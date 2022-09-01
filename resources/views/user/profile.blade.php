@extends('layouts.user')
@section('title','homeopath Dashbaord')
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
                            <form method="post" action="{{ route('user.update.profile') }}" enctype="multipart/form-data" id="profile-form" class="cmxform">
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
                            <form method="post" action="{{ route('user.update.password') }}" enctype="multipart/form-data" id="profile-form" class="cmxform">
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

</section>
<!-- users edit ends -->

@endsection
