@if(isset($timetable->daySlots) && count($timetable->daySlots) > 0)

  @foreach($timetable->daySlots as $item)


    @for($i = strtotime($item->from); $i<= strtotime($item->to); $i = strtotime($interval, $i))

   
        @if($i < strtotime('-'.$service->duration." minutes", strtotime($item->to)))

          <div class="col-sm-4">
            <div class="timeInput @if(in_array(convertToTime($i), $bookings)) disabled-radio @elseif(checkSlotPassed($i, $req->date) == true) disabled-slot @endif ">
              <input id="slot__{{ $loop->iteration }}_{{ $i }}" name="time_slot" type="radio" value="{{ convertToTime($i) }}" data-minutes={{convertToMinutes($i)}} class="required-entry"/>
              <label for="slot__{{ $loop->iteration }}_{{ $i }}">
                <span>{{ convertToTime($i) }}</span>
              </label>
            </div>
          </div>
        @endif  

    @endfor



  @endforeach

@else
  <h5 class="alert alert-danger text-center m-auto"><i class="fas fa-exclamation-triangle fa-1x"></i><br>The Homeopath is Closed at this day or not provindg any services.<br> Try alternate date/day.</h5>
@endif

