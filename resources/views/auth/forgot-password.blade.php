@extends('layouts.front')
@section('title', 'Login')
@section('content')



@include('front.components.pages_banner', ['heading' => 'Forget Password?', 'description' => 'No Problem! Just let us know your email and we will email you a password reset link that will allow you to choose a new one.'])


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
                        <!-- Session Status -->
        <x-auth-session-status class="mb-4 text-success" :status="session('status')" />

        <!-- Validation Errors -->
        <x-auth-validation-errors class="mb-4 text-left text-danger" :errors="$errors" />

        <form method="POST" action="{{ route('password.email') }}">
            @csrf

            <!-- Email Address -->
            <div class="text-left">
                <label for="">Email address</label>

                <x-input id="email" class="form-control" type="email" name="email" :value="old('email')" required autofocus />
            </div>

            <div class="text-right mt-4">
                <x-button class="btn btn-dark">
                    {{ __('Email Password Reset Link') }}
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
