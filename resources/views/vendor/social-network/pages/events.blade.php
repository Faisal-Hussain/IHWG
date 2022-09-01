<style type="text/css">
    .buttom-left {
  position: absolute;
  top: 10%;
  left: 16px;
  color: #000000;
  background-color:white;
  padding: 5px;
  border-radius: 4px;
  width: 50%;
  height: 60vh;
  cursor: pointer;
  overflow: auto;
}
.centered {
  position: absolute;
  top: 50%;
  left: 35%;
  transform: translate(-50%, -50%);
}
.event-bg-img{
    width: 100%;
    height: 70vh;
    background-repeat: no-repeat;
    background-size: cover;
    background-position: center;
}

.add_event_icon {
    padding: 2px !important;
    border-radius: 100px;
    width: 24px;
    height: 24px;
    cursor: pointer;
}

</style>
<div class="row">
    <div class="col-lg-12">
        @include('vendor.social-network.components.social_network_navbar')
        <div class="card">
            <div class="card-body py-1">

                <div class="row">
                    <div class="col-sm-6 m-auto">
                        <h3 class="p-0 m-0 font-weight-bold">Upcoming Event(s)</h3>
                    </div>

                    <div class="col-sm-6 text-right events-buttons main-clickable-links">
                    @if(Auth::user()->role=='advocate')
                          <a data-page="events-create" class="text-center" data-toggle="modal" data-target="#eventModal" title="Events"><i class="fas fa-plus bg-primary text-white add_event_icon"></i></a>
                        @endif
                        <a data-page="events" class="events" data-toggle="tooltip" data-placement="top" title="Grid View"><i class="fas fa-th-large"></i></a>
                        <a data-page="events_calendar" class="events_calendar" data-toggle="tooltip" data-placement="top" title="Calendar View"><i class="fas fa-calendar-alt"></i></a>
                    </div>

                </div>


            </div>
        </div>

        <div class="render-events">


                <!-- @forelse(upcomingEvents() as $item)
                <div class="item p-0 grid-event" data-description="{{ $item->description }}" data-category="{{ $item->category }}" data-venue="{{ $item->venue }}" data-venue="{{ $item->location }}">
                    <div class="img-container">
                        <img src="{{ asset($item->thumbnail) }}" class="event-img">
                        <div class="bottom-left-text">
                            <h2>{{ $item->title }}</h2>
                            <span>
                            {{ $item->eventTimings[0]->date ?? '' }}&nbsp;
                            {{ $item->eventTimings[0]->time ?? '' }}
                             &nbsp; <i class="fas fa-arrows-alt-h"></i> &nbsp;
                            {{ $item->type }}
                     </span>
                        </div>
                    </div>
                </div>

                @empty
                    <div class="text-center">
                        <h3 class="alert alert-warning">No upcoming events are available right now!</h3>
                    </div>
                @endforelse -->
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-12">
                        @forelse(upcomingEvents() as $item)


@php
$d=$item->eventTimings()->where('event_id',$item->id)->first()->id;
$req_exist=Auth::user()->eventRequests()->where('event_timing_id',$d)->first();
@endphp
                            <div class="card">
                                <div class="card-body event-bg-img" style="background-image: url('{{ asset($item->thumbnail) }}')">


                                        <div class="buttom-left pl-1">
                                            <h2 class="text-dark font-weight-bold">{{ $item->title }}</h2>
                                            <span class="font-weight-bold">
                                            {{ $item->eventTimings[0]->date ?? '' }}&nbsp;
                                            {{ $item->eventTimings[0]->time ?? '' }}
                                             &nbsp; <i class="fas fa-arrows-alt-h"></i> &nbsp;
                                            {{ $item->type }}
                                            </span>
                                            <p class="text-dark mt-2"><span class="font-weight-bold">Category:</span> {{$item->category??''}}</p>
                                            @if($item->type != "virtual")
                                            
                                            <p class="text-dark mt-1"><span class="font-weight-bold">Venue:</span> {{$item->venue??''}}</p>
                                            <p class="text-dark mt-1"><span class="font-weight-bold">Location:</span> {{$item->location??''}}</p>
                                            @endif
                                            <p class="text-dark mt-1 event-desc"><span class="font-weight-bold">Description:</span>{{Str::limit($item->description,320,'...')}}</p>
                                            <div class="text-center">
                                                <form action="{{route('social.event.request')}}" method="post">
                                                    @csrf
                                                    <input type="hidden" name="timing" value="{{$item->eventTimings[0]->time??0}}">
                                                <input type="hidden" name="date" value="{{$item->eventTimings[0]->date??0}}">
                                                <input type="hidden" name="id" value="{{Crypt::encrypt($item->id)}}">
                                                @if(Auth::id()!=$item->user_id && !$req_exist)
                                                <button type="submit" class=" btn btn-primary"  href="#">Join</a>
                                                @endif
                                                </form>
                                            </div>

                                        </div>


                                </div>
                            </div>
                        @empty
                            <div class="text-center">
                                <h3 class="alert alert-warning">No upcoming events are available right now!</h3>
                            </div>
                        @endforelse
                    </div>
                </div>

        </div>


    </div>
</div>





<script>

    $(document).on('click', '.grid-event', function() {

        $modal = $('#modalGridEventDetail');


        $('.event-grid-category').text($(this).data('category'));


        $('.event-grid-venue').text($(this).data('venue'));
        $('.event-grid-category').text($(this).data('location'));
        $('.event-grid-description').text($(this).data('description'));

        $modal.modal('show');


    })

</script>
