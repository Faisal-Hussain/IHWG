
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner rounded">
    
    @foreach($data as $item)
      <div class="carousel-item @if($loop->first) active @endif">
          <img class="d-block slider-img-show w-100" src="{{asset($item->image)}}" alt="First slide">
          <div class="carousel-caption d-none d-md-block">
            <a href="{{$item->url}}" target="_blank"><h2 class="ads-heading">{{$item->heading}}</h2></a>
          </div>
        </div>
    @endforeach
    
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>