
                        @foreach(Auth::user()->userSocialAlbums->sortByDesc('id') as $item)
                                <div class="col-md-12">
                                    <!-- <img src="{{ asset($item->file) }}" class="media-album-popup w-100 cursor-pointer"  data-src="{{ asset($item->file) }}"> -->
                                    @if($item->albumPhotos->count()>0)
                                        <span class="media-album-popup" data-name="{{$item->name}}" data-id="{{$item->id}}">
                                            <img src="{{ asset($item->albumPhotos[0]->image) }}" class="media-album-popup w-100 cursor-pointer mb-1"  data-src="{{ asset($item->file) }}">
                                            <!-- <h6 class="font-weight-bold album-name">{{$item->name??''}}</h3> -->
                                            
                                        </span>

                                    @else
                                        <!-- <span class="" data-name="{{$item->name}}" data-id="{{$item->id}}"><i class="fa fa-folder" aria-hidden="true"></i><h3 class="font-weight-bold">{{$item->name??''}}</h3></span> -->

                                    @endif
                                </div>

                            @if($loop->iteration == 3)
                                <div class="col-md-12 mt-2 text-right main-clickable-links">
                                    <a  data-page="media" class="btn-social-dark">View more</a>
                                </div>
                                @break
                            @endif


                        @endforeach
