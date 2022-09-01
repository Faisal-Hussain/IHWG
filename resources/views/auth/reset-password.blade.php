@extends('layouts.front')
@section('title', 'Login')
@section('content')



@include('front.components.pages_banner', ['heading' => 'Reset Password', 'description' => 'Reset your password now with your new and confirm password. This will be your new password as you send us a reset request.'])


<section class="content mb-5" id="login">
    <div class="container custom-extra-top-style">
        <div class="row justify-content-center">
            <div class="col-md-6 text-center">
                <div class="panel panel-login">
                    <div class="panel-heading">
                        <div class="row justify-content-center mt-3">
                            <div class="col-xs-12 text-center">
                                <h3>Forget your Password?</h3>
                            </div>
                        </div>
                        <hr>
                    </div>
                    <div class="panel-body">
                         <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4 text-danger text-left" :errors="$errors" />

        <form method="POST" action="{{ route('password.update') }}">
            @csrf

            <!-- Password Reset Token -->
            <input type="hidden" name="token" value="{{ $request->route('token') }}">

            <!-- Email Address -->
            <div class=" text-left">
                <x-label for="email" :value="__('Email')" />

                <x-input id="email" class="form-control" type="email" name="email" :value="old('email', $request->email)" required autofocus />
            </div>

            <!-- Password -->
            <div class="mt-4 text-left">
                <x-label for="password" :value="__('Password')" />

                <x-input id="password" class="form-control" type="password" name="password" required />
            </div>

            <!-- Confirm Password -->
            <div class="mt-4 text-left">
                <x-label for="password_confirmation" :value="__('Confirm Password')" />

                <x-input id="password_confirmation" class="form-control"
                                    type="password"
                                    name="password_confirmation" required />
            </div>

            <div class="text-right mt-4">
                <x-button class="btn btn-dark">
                    {{ __('Reset Password') }}
                </x-button>
            </div>
        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




@endsection
@section('js')

@endsection
