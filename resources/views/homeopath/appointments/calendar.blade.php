@extends('layouts.homeopath')
@section('title','Appointments')
@section('heading','Appointments')

@section('css')
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.css' rel="stylesheet" />
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>
    <style>
        .fc-daygrid-event
        {
            max-height: 60px !important;
            border: 1px solid #ccc !important;
        }
       #calendar
        {
                background-color: #a6aeba !important;
                color: #ffff !important;
        }
        .fc-toolbar-title{
            color: white;
        }
        .fc-day-today
        {
            background-color: #323740 !important;
        }
        .fc-button
        {
            background-color: #323740 !important; 
            border: #323740 !important; 
        }
        .fc-button-active
        {
            background-color: black !important; 
            border: black !important; 
        }
    </style>
@endsection

@section('content')







    <div class="card mt-1">

        <div class="card-content">
            <div class="card-body">
                <div id="calendar"></div>
            </div>
        </div>
    </div>





@endsection

@section('js')
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
  



<script>
     var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {
                       themeSystem: 'solar',

                      initialView: ['dayGridMonth'],
                                headerToolbar: {
                                         left: 'prev,next',
                                         center: 'title',
                                          right: 'timeGridWeek,dayGridMonth,dayGridWeek'
                                        },
                                        views: {
                                                timeGridWeek: {
                                                    duration: {days: 1},
                                                    buttonText: '',
                                                }
                                            },
                                        height: 800,
                                        contentHeight: 750,
                                        aspectRatio: 3,

                                         defaultView: '',

                                        editable: true,
                                        eventLimit: true,
                                        displayEventTime:false,
                                        navLinks: true,
                                        events : [

                                            @foreach($bookings as $item)
                                                {
                                                    title : '{{ $item->HomeopathService->title ?? '' }}',
                                                    start : '{{ $item->date }}T{{ $item->time_slot }}',
                                                    className: "event-status",

                                                    extendedProps: {
                                                        id:'{{ $item->id }}',
                                                        duration:'{{ $item->time }}',
                                                        time:'{{ $item->date }} | {{ $item->time_slot }}',
                                                    }



                                                },
                                            @endforeach

                                        ],
                                        eventDidMount: function(info)
                                            {
                                                info.el.querySelector('.fc-event-title').innerHTML =
                                                    '<div class="row data-row" data-type="event" data-id="'+info.event.extendedProps.id+'">' +
                                                    '<div class="col-12">' +
                                                    '<span class="float-left text-dark font-weight-bold pt-1" style="font-size: 16px">'+info.event.extendedProps.duration+'' +
                                                    '</span><h6 class="mr-1 mt-1 float-right   badge-info text-white">'+info.event.extendedProps.time+'</h6></div></div>'+
                                                    '<span class="font-weight-bold text-info">'+ info.event.title+'</span></br>';
                                            },

                    });
                    calendar.render();
</script>


@endsection
