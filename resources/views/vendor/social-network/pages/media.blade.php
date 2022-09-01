@include('vendor.social-network.components.social_network_navbar')

<div class="card">
    <div class="card-body">
        <div>
            <h3 class="p-0 m-0  float-left">Media(s)</h3>
            
            <a href="#" class="float-right p-0 m-0 upload-photo-in-album"><i class="fa fa-upload"></i><span class="font-weight-bold">Upload</span></a>
            <a href="#" class="float-right p-0 mr-1" data-toggle="modal" data-target="#createNewalbumModal"><i class="fa fa-plus"></i><span class="font-weight-bold">Create New Album</span></a>
        </div>
    </div>
</div>
<div class="">
    <div class="row">
        @foreach(Auth::user()->userSocialAlbums->sortByDesc('id') as $item)
            <div class="col-md-3">
                <div>
                    @if($item->albumPhotos->count()>0)
                    <span class="media-album-popup" data-name="{{$item->name}}" data-id="{{$item->id}}">
                        <img src="{{ asset($item->albumPhotos[0]->image) }}" class="media-album-popup w-100 cursor-pointer"  data-src="{{ asset($item->file) }}">
                          <h3 class="font-weight-bold album-name">{{$item->name??''}}</h3>                  
                        
                    </span>
                    @else
                        <span class="" data-name="{{$item->name}}" data-id="{{$item->id}}"><i class="fa fa-folder" aria-hidden="true"></i><h3 class="font-weight-bold">{{$item->name??''}}</h3></span>

                    @endif
                    

                </div>
                <div class="row p-0 m-0">
                    <div class="col-md-6 p-0">
                        <button type="button" href="{{route('social.album.delete',$item->id)}}" class="btn btn-danger delete-album-btn btn-block float-left" data-id="{{$item->id}}"><i class="fa fa-trash text-white"></i>
                        </button>
                       
                    </div>
                    <div class="col-md-6 p-0">
                       
                        <button type="button" href="#" class="btn btn-primary btn-block float-rightss edit-album-btn" data-name="{{$item->name}}" data-id="{{$item->id}}"><i class="fa fa-edit text-white"></i>
                        </button>
                    </div>
                </div>
            </div>
        @endforeach
    </div>
</div>