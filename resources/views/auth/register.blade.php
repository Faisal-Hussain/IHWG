@extends('layouts.front')
@section('title', 'Register Advocate')
@section('content')
<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/about-us.jpg) no-repeat 50% center;background-size: cover;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
            <div class="banner-box">
                <div class="banner-top text-center">
                    <div class="inner">
                        <h2 class="text-dark">Advocate Sign Up</h2>
                        <p>Please Sign Up It's always will be.</p>
                        <p class="cmp-button-row non-mobile-only">
                            <div class="right-box">
                                <div class="screenshot"></div>
                            </div>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--END HEADER-->

                    <section class="content">
                        <div id="vendor_registration" class="container custom-extra-top-style">
                            <div class="row justify-content-center">
                                <div class="col-xs-12 col-sm-8 col-md-6">
                                    <form method="post" action="{{ route('register') }}" id="advocate-reg-form">
                                        @csrf
                                        <div class="text-center">
                                            <h2>Please Sign Up <small>It's always will be.</small></h2>
                                            @if($errors->any())
                                                {!! implode('', $errors->all('<div class="text-danger">:message</div>')) !!}
                                            @endif
                                        </div>
                                        <hr class="colorgraph">
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="text" placeholder="Display Name" class="form-control" name="name">
                                                    <span class="fa fa-user form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="text" placeholder="User Name" class="form-control" value="" id="username" name="user_name">
                                                    <span class="fa fa-user form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="email" placeholder="Email Address" class="form-control" id="email" value="" name="email">
                                            <span class="fa fa-envelope form-control-feedback"></span>
                                            <span class="invalid-feedback d-block"></span>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="password" placeholder="Password" class="form-control" id="password" name="password">
                                                    <span class="fa fa-lock form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="password" placeholder="Retype Password" class="form-control" id="confirm_password" name="confirm_password">
                                                    <span class="fa fa-lock form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="text" placeholder="Store Name" class="form-control" id="store_name" name="store_name" value="">
                                            <span class="fa fa-home form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <input type="number" placeholder="Phone Number" class="form-control" id="phone" name="phone" value="" min="0">
                                            <span class="invalid-feedback d-block"></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <textarea id="address_line_1" placeholder="Address Line 1" class="form-control" name="address_line_1"></textarea>
                                                    <span class="invalid-feedback d-block"></span>
                                        </div>
                                        <div class="form-group has-feedback">
                                            <textarea id="address_line_2" placeholder="Address Line 2" class="form-control" name="address_line_2"></textarea>
                                            <span class="invalid-feedback d-block"></span>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="text" placeholder="City" class="form-control" value="" id="city" name="city">
                                                    <span class="fa fa-text-width form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="text" placeholder="State" class="form-control" value="" id="state" name="state">
                                                    <span class="fa fa-text-width form-control-feedback"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="text" placeholder="Country" class="form-control" value="" id="country" name="country">
                                                    <span class="fa fa-text-width form-control-feedback"></span>
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-6 col-md-6">
                                                <div class="form-group has-feedback">
                                                    <input type="number" placeholder="Zip / Postal Code" class="form-control" value="" id="zip_code" name="zip_code">
                                                    <span class="invalid-feedback d-block"></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-12 col-sm-12 col-md-12">
                                                <span class="button-checkbox t-and-c-button-checkbox">
                                                    <input type="checkbox" name="t_and_c" id="t_and_c" class="shopist-iCheck" value="1"> &nbsp;
                                                    <a href="#" data-toggle="modal" data-target="#t_and_c_m"> Terms and Conditions </a>
                                                    <span class="invalid-feedback d-block"></span>
                                                </span>
                                            </div>
                                        </div>
                                        <hr class="colorgraph">
                                        <div class="row">
                                            <div class="col-xs-12 col-md-6">
                                                <button class="btn btn-secondary btn-block btn-md register-adv-btn" type="button">Advocate Registration</button> 
                                            </div>
                                            <div class="col-xs-12 col-md-6"><a href="{{ route('login') }}" class="btn btn-secondary btn-block btn-md vendor-reg-log-in-text">Login</a></div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <p>&nbsp;</p>
                        <p>&nbsp;</p>


                        <div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="t_and_c_m_l" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Terms and Conditions</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>



@endsection
@section('js')
<script>
    $(document).on('click','.register-adv-btn',function(e){
        e.preventDefault();
        $("#advocate-reg-form").submit();

    })
    $(document).ready(function() {
        // validate signup form on keyup and submit
        var validator = $("#advocate-reg-form").validate({
            rules: {
                name: "required",
                user_name: {
                    required: true,
                    minlength: 2,
                },
                email: {
                    required: true,
                    email: true,
                },
                password: {
                    required: true,
                    minlength: 8
                },
                confirm_password: {
                    required: true,
                    minlength: 8,
                    equalTo: "#password"
                },
                store_name:"required",
                phone:"required",
                address_line_1:"required",
                address_line_2:"required",
                city:"required",
                state:"required",
                country:"required",
                zip_code:"required",
                t_and_c:{
                    required : true
                }
            },
            messages: {
                name: "Enter your Display Name",
                user_name: {
                    required: "Enter a username",
                    minlength: jQuery.validator.format("Enter at least {0} characters"),
                    remote: jQuery.validator.format("{0} is already in use")
                },
                password: {
                    required: "Provide a password",
                    minlength: jQuery.validator.format("Enter at least {0} characters")
                },
                confirm_password: {
                    required: "Repeat your password",
                    minlength: jQuery.validator.format("Enter at least {0} characters"),
                    equalTo: "Enter the same password as above"
                },
                email: {
                    required: "Enter a valid email address",
                    minlength: "Enter a valid email address"
                },
                store_name: "Enter the Store Name",
                phone: "Enter your Phone Number",
                address_line_1: "Fill the Address Field",
                address_line_2: "Fill the Address Field",
                city: "Enter your City Name",
                state: "Enter your State Name",
                country: "Enter your Country Name",
                zip_code: "Enter your Zip Code",
                t_and_c: {
                    required : "Accept the terms and conditions"
                }
            },
            // the errorPlacement has to take the table layout into account
            errorPlacement: function(error, element) {
                 // $(element).addClass('error');
                 $(element).closest('.form-group').find('.invalid-feedback').html('<strong>'+error.html()+'</strong>');
            },
            // set this class to error-labels to indicate valid fields
            success: function(label) {
                // set &nbsp; as text for IE
                label.html("&nbsp;").addClass("checked");
            },
            highlight: function(element, errorClass) {
                $(element).parent().next().find("." + errorClass).removeClass("checked");
            },
            unhighlight: function (element) {
                $(element).removeClass('error');
                $(element).closest('.form-group').find('.invalid-feedback').html('');
            }
        });

    });
    </script>
@endsection