@extends('layouts.homeopath')
@section('title','Settings')
@section('heading','Settings')
@section('content')

<div class="card">
    <div class="card-header">
        <h3>Homeopath Photos</h3>
        <button class="btn btn-primary add-new-item-image" data-toggle="tooltip" data-placement="top" title="Add new photo">+</button>
    </div>
    <hr>
    <div class="card-body">
        <div class="row">
            <div class="col-sm-12">
                
                <form method="POST" action="{{ route('homeopath.settings.update.images') }}" enctype="multipart/form-data">
                    @csrf
                    <div class="row main-item-images">
                        @forelse(Auth::user()->HomeopathImages as $item)
                        <div class="col-xl-2 col-md-3 col-sm-3 col-6 mb-3 text-center">
                            <input type="file" name="image[]" class="dropify" multiple data-default-file="{{asset($item->image)}}" data-allowed-file-extensions="jpeg jpg png">
                            <span class="remove-image-box" data-image="{{ $item->id }}">x</span>
                        </div>
                        @empty
                        <div class="col-xl-2 col-md-3 col-sm-3 col-6 mb-3">
                            <input type="file" name="image[]" required="" class="dropify" multiple data-default-file="" data-allowed-file-extensions="jpeg jpg png" required="">
                        </div>
                        @endforelse
                        
                    </div>
                    <div class=" mb-3 text-right">
                        <input type="hidden" name="removeimage" id="removeimage">
                        <button type="submit" class="btn btn-success font-weight-bold">Save Photos</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>
@endsection
@section('js')
<script>

$('.add-new-item-image').on('click', function(e) {
e.preventDefault();
$basket_length = $('.main-item-images input').length;
if ($basket_length >= 20) {
$(".add-new-item-image").hide();
return;
}
$('.main-item-images').append('<div class="col-xl-2 col-md-3 col-sm-3 col-6 mb-3 text-center"><input type="file" name="image[]" required class="dropify" multiple data-default-file=""  data-allowed-file-extensions="jpeg jpg png"><span class="remove-image-box">x</span></div>');
$('.dropify').dropify();
});
$(document).on('click', '.remove-image-box', function(e) {
e.preventDefault();
if (this.hasAttribute('data-image'))
{
$('#removeimage').val($('#removeimage').val()+""+$(this).data('image')+",");
}
$(this).closest('div').remove();
});
</script>
@endsection