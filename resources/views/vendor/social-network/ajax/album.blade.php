<div class="row">
    @foreach($photos as $item)
        <div class="col-lg-4 mb-3">
            <img src="{{ asset($item->image) }}" class="media-popup w-100">
        </div>
    @endforeach
</div>
