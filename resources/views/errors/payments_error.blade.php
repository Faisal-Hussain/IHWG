@extends('layouts.front')
@section('title', 'Payments Error')


@section('content')

<div class="container text-center">
    <div class="row">
        <div class="col-lg-12 my-4">
            <div class="card card-help">
                <div class="card-body">
                    <img src="{{ asset('front/assets/error.png') }}" class="img-fluid" alt="">
                    <h2 class="text-danger p-3">{{ $error ?? 'Whoops! Something went wrong with payments.' }}</h2>
                    <a class="btn btn-dark" href="{{ route('index') }}">Try Again Later!</a>
                </div>
            </div>
        </div>
    </div>
</div>
</section>
@endsection