@extends('layouts.advocate')
@section('title','homeopath Dashbaord')
@section('heading','Get More Badges')
@section('css')
<style>
    .zoom-icon
    {
        background-color: #000;
        color: #fff;
        padding: 16px;
        font-size: 30px;
        margin-right: 20px;
    }

    .h5-heading
    {
        color: #B1B3B9;
        font-weight: bold;
    }

    .btn-attach,
    .btn-attach:hover
    {
        background-color: #4267B2;
        color: #fff;
        font-weight: bold;
        padding: 4px 6px;
        border-radius: 3px;
        border: 0;
    }
    .permissions img
    {
        width: 45px;
        float: right;
    }
    .permissions label
    {
        font-size: 20px;
        font-weight: bold;
        cursor: pointer;
    }
    .permissions input {
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;

  border-radius: 50%;
  width: 30px;
  height: 30px;

  border: 2px solid #999;
  transition: 0.2s all linear;
  margin-right: 5px;

  position: relative;
  top: 12px;
  cursor: pointer;
}

.permissions input:checked {
  border: 8px solid black;
  outline: unset !important /* I added this one for Edge (chromium) support */
}

</style>
@endsection

@section('content')

<!-- users edit start -->
<form method="POST" action="{{ route('get.more.badges.post') }}" enctype="multipart/form-data">
    @csrf
<section class="users-edit pb-4">
    <div class="card">
        <div class="card-content">
                        <div class="card-body">
                <div class="media">
                    <i class="fas fa-award zoom-icon"></i>
                  <div class="media-body">
                    <h3 class="mt-0 font-weight-bold">Badges & Accolades</h3>
                    <h5 ><span class="text-muted">By</span> <a href="{{ route('index') }}" target="_blank">Chwg.ca</a></h5>
                  </div>
                </div>

                <div class="permissions mt-2">
                    <h5 class="h5-heading">Which type of badge do you want to get? <span class="text-danger">*</span></h5>
                    
                    @foreach(badges() as $item)
                        
                        @if($loop->first)
                            @continue
                        @endif

                        <div class="mb-1 pb-1 border-bottom">
                        <input type="radio" name="badge_id" value="{{ $item->id }}" id="{{ $item->id }}" required="">
                        <label for="{{ $item->id }}">{{ $item->title }}</label>
                        <img src="{{ asset($item->path) }}">
                        </div>

                    @endforeach

                </div>

                    <h6 class="bg-rgba-info p-1 m-0"><span class="text-warning">NOTE: </span> Give your correct information in order to approve your request and verify your application. Not all applicaitons are verified. It will depend on your profile and acheivements.</h6>
                    <br>
                    <h5 class="h5-heading">Tell us something about yourself. Why we verify your request? (Min. 100 characters) <span class="text-danger">*</span></h5>
                    <textarea class="form-control" name="description" rows="5" minlength="100" required=""></textarea>
                    <h5 class="h5-heading mt-2">Any attachement docuemnt</h5>
                    <input type="file" class="form-control" name="attachement">

                    <div class="text-right mt-2">
                        <button type="submit" class=" btn-attach">Submit my request</button>
                    </div>


            </div>
        </div>
    </div>
    
</section>
<!-- users edit ends -->
</form>
@endsection
