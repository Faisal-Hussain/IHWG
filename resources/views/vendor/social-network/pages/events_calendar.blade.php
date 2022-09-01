<div class="row">
    <div class="col-lg-12">

        <div class="card">
            <div class="card-body py-1">
                
                <div class="row">
                    <div class="col-sm-6 m-auto">
                        <h3 class="p-0 m-0 font-weight-bold">Upcoming Event(s) Calendar</h3>
                    </div>

                    <div class="col-sm-6 text-right events-buttons main-clickable-links">
                        <a data-page="events" class="events" data-toggle="tooltip" data-placement="top" title="Grid View"><i class="fas fa-th-large"></i></a>
                        <a data-page="events_calendar" class="events_calendar" data-toggle="tooltip" data-placement="top" title="Calendar View"><i class="fas fa-calendar-alt"></i></a>
                    </div>
                    
                </div>
                

            </div>
        </div>

        <div class="card">
            <div class="card-body">
                <div id="calendar"></div>
            </div>
        </div>

        
    </div>
</div>



<script>
     var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {

                      initialView: 'timeGridWeek',
                                headerToolbar: {
                                         left: 'prev,next',
                                         center: 'title',
                                          right: 'timeGridWeek'
                                        },
                                        views: {
                                                timeGridWeek: {
                                                    duration: {days: 3},
                                                    buttonText: 'Days',
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

                                            @foreach(upcomingEventTimings() as $item)
                                                {
                                                    title : '{{ $item->event->title }}',
                                                    start : '{{ $item->date }}T{{ $item->time }}',
                                                    description: '{{ $item->event->description }}',
                                                    className: "event-status",

                                                    extendedProps: {
                                                        id:'{{ $item->id }}',
                                                        duration:'{{ $item->time }}',
                                                        type:'{{ $item->event->type }}',
                                                        description:'{{ $item->event->description }}',
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
                                                    '</span><span class="mr-1 mt-1 float-right badge  badge-info text-white">'+info.event.extendedProps.type+'</span></div></div>'+
                                                    '<span class="font-weight-bold text-info">'+ info.event.title+'</span></br>'+
                                                    '<span class="text-dark" style="font-size: 11px;">'+info.event.extendedProps.description+'</span>';
                                            },

                    });
                    calendar.render();
</script>
<script>
    $(document).on('click', '.fc-event-title', function(){
        
        $id   = $(this).find('.data-row').data('id'); 
        $type = $(this).find('.data-row').data('type'); 




        $.ajax({
            method:'get',
            url:"{{ route('social.event.interested') }}?id="+$id+'&update_request='+$type,
            success:function (response){

                if(response.message == false)
                {
                    $('#modalFcEvent .modal-body').html('<div class="btn btn-primary fc-event-title"><div class="data-row" data-type="response" data-id="'+response.id+'">Submit Event Joining Request</div></div>');
                    $('#modalFcEvent').modal('show');
                }
                else if(response.message == true)
                {
                    $('#modalFcEvent .modal-body').html('<h3 class="alert alert-warning">Your request have already been submitted to join the event.</h3>');
                    $('#modalFcEvent').modal('show');
                }
                else if(response.message == 'done')
                {
                    toastr.success('Event Request has been submitted.');
                    $('#modalFcEvent').modal('hide');
                }


            }
        })



    })
</script>