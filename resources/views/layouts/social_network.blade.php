<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>@yield('title') - {{ env('APP_NAME') }}</title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset($setting['favicon'] ?? '')  }}">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/tables/datatable/datatables.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/pages/data-list-view.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/sweetalert2.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/toastr.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/vendors.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/tether-theme-arrows.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/extensions/tether.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/bootstrap.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/bootstrap-extended.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/colors.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/components.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/themes/dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/themes/semi-dark-layout.css') }}">
    <link rel="stylesheet" type="text/css" href="{{asset('admin/dropify/css/dropify.min.css') }}">
    <link href='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.css' rel="stylesheet" />
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/menu/menu-types/horizontal-menu.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/colors/palette-gradient.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/custom.css') }}">
    <!-- END: Page CSS-->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">

    <style>
    #progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
    #bar { background-color: #B4F5B4; width:0%; height:10px; border-radius: 3px; padding-bottom:10px; }
    #percent { position:absolute;top:3px; left:48%; }
    .add_event_icon{
          padding: 5px !important;
          border-radius: 100px;
          width: 24px;
          height: 24px;
          cursor: pointer;
        }
        .render-events .event-img{
            width: 100%;
            height: 400px !important;
            object-fit: cover;
        }

        .tooltip.top .tooltip-inner {
            background-color:red !important;
        }
        .tooltip.top .tooltip-arrow {
              border-top-color: red !important;
        }
        @media only screen and (max-width: 991px) {
            .app-content
            {
                padding-top: 11rem !important;
            }
        }
        .post-action-btns
        {
            font-size: 12px !important;
        }
        .custom-toast 
        {
                background-color: #ffffff;
                color: #000;
                border: none;
                box-shadow: 0 0.25rem 0.75rem rgb(34 41 47 / 15%);
        }

        .create-post-model #post_status_type
        {
                border: 2px solid;
                border-radius: 4px;
                font-size: 13px;
                font-weight: bolder;
        }
        .fa-folder-open
        {
            font-size: 95px;
            color: orange;
            cursor: pointer;
        }
        .fa-folder
        {
            font-size: 95px;
            cursor: pointer;
        }
        .media-album-popup .album-name
        {
            position: absolute;
            top: 50%;
            left: 50%;
            color: white;
            font-weight: 800;
            transform: translate(-50%, -50%);
            background-color: #000000;
            opacity: 0.7;
            padding: 10px;
            cursor: pointer;
        }




</style>
    @yield('css')

</head>
<div class="page-loader d-none">
    <div class="loader"></div>
</div>

<body class="horizontal-layout horizontal-menu 2-columns  navbar-floating footer-static  " data-open="hover" data-menu="horizontal-menu" data-col="2-columns">

@php 

$last = url()->current();
$split = explode("/", $last);

$text_name=$split[count($split)-1];

$text=$setting[$text_name.'-toast']??'';



@endphp
    <!-- toaster -->

@if($text)
    <div class="toast custom-toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="6000" style="position: fixed; z-index:100 ; top: 5rem; left: 50%;">

        <div class="toast-body" style="font-size: 14px;">
        <div style="display: flex; padding: 5px 8px;"> 
            <i class="fa fa-info-circle" aria-hidden="true" style="background-color:#ffffff; color: black;font-size: 26px; margin-top: 1px;">
            </i>
             <span style="padding: 0px 15px;" class="toast-text">
                {{$text}}
             </span>   
        </div>
        </div>
    </div>
@endif
    <!-- BEGIN: Header-->
<nav class="header-navbar navbar-expand-lg navbar navbar-with-menu navbar-fixed navbar-shadow navbar-brand-center">
        <div class="navbar-wrapper">
            <div class="navbar-container content">
                <div class="navbar-collapse" id="navbar-mobile">
                    <div class="site-logo">
                        <a href="{{ route('index') }}"><img src="{{ asset($setting['logo'] ?? '')  }}"></a>
                    </div>
                    <div class="m-auto col-lg-6 col-12 social-search-box">
                        <input type="text" class="form-control" value="{{$search_name??''}}" id="search_name" placeholder="Search name">
                          <div id="append-username"></div>
                    </div>


                    <ul class="nav navbar-nav float-right">

                        <div id="appendNotification">
                            @include('vendor.social-network.pages.notification')
                        </div>


                        <li class="dropdown dropdown-user nav-item">
                            <a class="dropdown-toggle nav-link dropdown-user-link pb-0" href="#" data-toggle="dropdown">
                                <span class="user-nav pr-4 " style="padding-left: 5px;">
                                    <span class="user-nav-inner">
                                        <img src="{{ asset(Auth::user()->avatar) }}" class="round float-left" style="margin-right: 10px;" height="30" width="30">
                                        <h5 class="m-0 font-weight-bold text-primary">{{ Auth::user()->name }}</h5>
                                        <span class="text-success d-block">{{ Auth::user()->role }}</span>
                                    </span>
                                </span>
                            </a>

                            <div class="dropdown-menu dropdown-menu-right mt-0">

                            <a class="dropdown-item" href="{{ route('redirect.dashboard') }}"><i class="feather icon-home"></i>Dashboard</a>
                            @if(Auth::user()->role == 'admin')
                                <a class="dropdown-item" href="{{ route('admin.profile') }}"><i class="feather icon-user"></i>Profile</a>
                            @elseif(Auth::user()->role == 'homeopath')
                                <a class="dropdown-item" href="{{ route('homeopath.profile') }}"><i class="feather icon-user"></i>Profile</a>
                            @elseif(Auth::user()->role == 'advocate')
                                <a class="dropdown-item" href="{{ route('advocate.profile') }}"><i class="feather icon-user"></i>Profile</a>
                            @else
                                <a class="dropdown-item" href="{{ route('user.profile') }}"><i class="feather icon-user"></i>Profile</a>
                            @endif

                            <a href="{{ route('logout') }}" class="dropdown-item"><i class="feather icon-power"></i> Logout</a>
                        </div>

                        </li>

                    </ul>

                </div>
            </div>
        </div>
    </nav>


    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper mt-0">
            <div class="content-body">
                @yield('content')
            </div>
        </div>
    </div>
    <!-- END: Content-->


    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>


    <!-- floating buuton start for chat -->

    <!-- floating buuton end for chat -->




    <!--============================================================-->
                    <!--INCLUDE MODAL PAGE MODAL-->
    <!--============================================================-->
            @include('vendor.social-network.components.social_modals')
    <!--============================================================-->
                    <!--END MODAL PAGE MODAL-->
    <!--============================================================-->






    <script src="{{ asset('admin/vendors/js/vendors.min.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.buttons.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/buttons.bootstrap.min.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/popover/popover.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/dataTables.select.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.checkboxes.min.js') }}"></script>
    <script src="{{asset('admin/dropify/js/dropify.min.js') }}"></script>
    <script src='https://cdn.jsdelivr.net/npm/fullcalendar-scheduler@5.9.0/main.min.js'></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="{{ asset('admin/vendors/js/extensions/tether.min.js') }}"></script>
    <script src="{{ asset('admin/js/core/app-menu.js') }}"></script>
    <script src="{{ asset('admin/js/core/app.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/components.js') }}"></script>
    <script src="{{ asset('admin/js/sweetalert.min.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/ui/data-list-view.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/extensions/toastr.min.js') }}"></script>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="{{ asset('admin/js/map_autocomplete.js') }}"></script>
    <script src="{{ asset('admin/js/jquery.hashtags.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>

        $url_array=[];
        
        function goBack() {
            

            $url_array.splice(0,1);
            console.log($url_array.length)

            window.history.pushState('', 'newtitle',$url_array[0]);

            if ($url_array.length>1) 
            {
                changePage(getUrlParameter('p'),'no');

            }else{
                window.location.href="{{route('social.index')}}";
                
            }
     
            
    }

    

  

            @if(Session::has('modalAdvocateSlideshow'))
                    hideSponserModel();
            @endif
       

        @if(Auth::User()->role == 'advocate')
            $('#modalAdvocateSlideshow').modal('show');
        @endif

        $(document).on('click','.save-post',function (e){

            e.preventDefault()
            var media=$(this).closest('#post-form').find("#media_type").val()

            if (media=='photo')
            {
                $(this).text('Uploading with Photo')
            }
            if (media=='video')
            {
                $(this).text('Uploading with Video')
            }
            $(this).attr('disabled',true)
            $('#post-form').submit()

        })



        function scrollDown() {
            document.getElementById('scroll').scrollTop =  document.getElementById('scroll').scrollHeight


        }
        function render_view() {

            $.ajax({
                type: 'GET',
                url: '{{ route('social.render.page') }}?page=messages',
                success: function (response) {

                    $('.render-page').html(response);
                    $('.page-loader').addClass('d-none');
                }
            });
        }

        function getAllNotification()
        {
            var url="{{route('get.all.notification')}}"
            $.ajax({
                method:'get',
                url:url,
                success:function (data)
                {
                    console.log('notifications are being append')

                    $('#appendNotification').html('')
                    $('#appendNotification').html(data)

                }
            })
        }

        $(document).on('click','.notification_button',function (){
            var id=$(this).attr('data-id')
            var page=$(this).attr('data-page')
            var url="{{route('see.notification',":id")}}"
            url=url.replace(":id",id)
            $(this).remove()
            $.ajax({
                method:'get',
                url:url,
                success:function (data)
                {
                    $('#appendNotification').html('')
                    $('#appendNotification').html(data)

                }
            })
            if (page=='messages')
            {
                window.location.href="{{route('social.social.network')}}?p=messages"
            }
        })

        $(document).ready(function(){
        $('.progress').hide()


        $("textarea").hashtags();



            $('.mesgs').hide()
        var deleteID = document.querySelectorAll(".alert-confirm");
        deleteID.forEach(function(e) {
            e.addEventListener("click", function(event) {
                event.preventDefault();
                $url=$(this).attr("href");
                swal({
                    title: 'Are you sure?',
                    text: 'You want be to do this?',
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                    })
                    .then((willDelete) => {
                    if (willDelete) {
                        window.location.href = $url;
                    }

                    });
            });
            });
        });
    </script>
    <script>
        @if(session('message'))
            toastr.success("{{ session('message') }}");
        @elseif(session('error'))
            toastr.error("{{ session('error') }}");
        @endif
        $('.dropify').dropify();
    </script>

        <script>
         $(document).on('click', '.main-clickable-links .pr-1', function(){
          var page= $(this).data('page')
          if(page!='news_feed'){
             $('.popover-body').hide()
          }

        })




        $(document).on('keyup', '#search_name', function(){

              $value = $(this).val();

             $.ajax({
                type: 'GET',
                url: '{{ route('social.search.name') }}?q='+$value,
                success: function (response) {
                    if($value == '')
                    {
                      $('#append-username').html('');
                    }
                    else
                    {
                      $('#append-username').html(response);
                    }
              }

            });
        })
    </script>



    <script>
        $(document).on('click', '.main-clickable-links a', function(){

            $page = $(this).data('page');
             if ($page=='events-create')
           {

                $('#eventModal').model('show');
                return false;
           }
            window.history.replaceState(null, null, "?p="+$page);



            $(this).parent('.main-clickable-links').find('a').removeClass("page-active");
            $(this).addClass('page-active');



            changePage(getUrlParameter('p'),'yes');


        })
    </script>



    <!--===============================================-->
                <!--UNFOLLW GROUP/CONNECTION SCRIPT-->
    <!--===============================================-->

    <script>
        $(document).on('click', '.btn-unfollow', function(){

            $self = $(this);
            $page = $(this).data('page');
            $id = $(this).data('id');
            $user_name = $(this).data('name');

            $.ajax({
              type: 'GET',
              url: '{{ route('social.connect.disconnect') }}?id='+$id,
              success: function (response) {

                toastr.success('You have '+response+' the connection.');
                connectionsCountUpdate(-1);

                rereshSidebarConnections($user_name);

                $self.closest('.connections-card').remove();


                }

            });

        })


        $(document).on('click', '.btn-unfollow-group', function(){

            $self = $(this);
            $id = $(this).data('id');
            $group_id = $(this).data('group-id');


            $.ajax({
              type: 'GET',
              url: '{{ route('social.group.follow.unfollow') }}?id='+$id,
              success: function (response) {
                toastr.success('You have '+response+' the group.');
                groupsCountUpdate(-1);

                rereshSidebarConnections($group_id);

                $self.closest('.group-card').remove();

                $self.text(function(i, text){
                  return text === "Follow" ? "Unfollow" : "Follow";
              })



                }

            });


        })

    </script>



    <script>
        $(document).ready(function(){
            
           
            getAllNotification()
            $('#cover-form').on('submit', function(event){
                event.preventDefault();
                $.ajax({
                    url:'{{route('social.cover.update')}}',
                    method:"POST",
                    data:new FormData(this),
                    dataType:'JSON',
                    contentType: false,
                    cache: false,
                    processData: false,
                    success:function(response){
                        toastr.success(response.message);
                        $('.profile-cover-avatar').attr('src', response.url)
                        $('#modalUpdateAvatar').modal('hide');
                    },
                    error: function(response) {
                       $.each(response.responseJSON.errors,function(field_name,error){
                            toastr.error(error);
                        })
                    }
               })
           })
        })
    </script>



    <script>
        $(document).on('click','.change-chat',function (e){
            e.preventDefault()
            var id=$(this).attr('data-id')
            $('.chat_list').removeClass('active_chat')
            $(this).closest('.chat_list').addClass('active_chat')
            var url="{{route('get.message',":id")}}"
            url=url.replace(":id",id)

            $.ajax({
                method: 'get',
                url:url,
                data:{id:id},
                success:function (data){
                    $('.render-messages').html(data);
                    scrollDown()


                }
            })
            $('.mesgs').show()
        })


    </script>

    <script>
        $(document).on('click', '.btn-tag', function(){

            $tag = $(this).text();

            $.ajax({
                method: 'get',
                url:'{{ route('social.check.user.follwing.tags') }}',
                data:{tag:$tag},
                success:function (response){
                    $('#modalClickTag h5').text(response.tag);
                    $('#modalClickTag h4').text(response.status);
                    $('#modalClickTag a').text(response.tag);
                    $('#modalClickTag').modal('show');
                }
            })


        })
    </script>

    <script>
        $(document).on('click', '.btn-tag-follow-unfollow', function(){

                $tag = $(this).text();

                $.ajax({
                  type: 'GET',
                  url: '{{ route('social.tag.follow.unfollow') }}',
                  data:{tag:$tag},
                  success: function (response) {
                    toastr.success('You have '+response+' the Tag.');
                     $('#modalClickTag').modal('hide');
                    }

                });

            })
    </script>



<!---===============================================->
        <!-FUNCTIONS USED IN SOCIAL NETWORK-->
<!--===============================================-->
    <script>
        function connectionsCountUpdate($value)
        {

            $count = $('.connections-count').text();

            if($value == -1)
            {
                $('.connections-count').text($count - 1);
            }
            else
            {
                $('.connections-count').text($count + 1);
            }

        }


        function groupsCountUpdate($value)
        {

            $count = $('.group-count').text();

            if($value == -1)
            {
                $('.group-count').text($count - 1);
            }
            else
            {
                $('.group-count').text($count + 1);
            }

        }



        function rereshSidebarConnections($name)
        {
            $('.'+$name).remove();
        }




        function getUrlParameter(sParam)
        {

            var sPageURL = window.location.search.substring(1),

            sURLVariables = sPageURL.split('&'),
            sParameterName,
            i;

            for (i = 0; i < sURLVariables.length; i++) {
                sParameterName = sURLVariables[i].split('=');

                if (sParameterName[0] === sParam) {
                    return typeof sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
                }
            }
            return false;
        };


        function changePage($url_parameter,add_url)
        {
            

            $('.page-loader').removeClass('d-none');

            $.ajax({
                type: 'GET',
                url: '{{ route('social.render.page') }}?p='+$url_parameter,
                success: function (response) {

                    $('.render-page').html(response);
                                          $('[data-toggle="popover"]').popover();

                    $('.dropify').dropify();
                    $('.page-loader').addClass('d-none');

                    $('.'+$url_parameter).parent('.account-sidebar-links').find('a').removeClass("page-active");
                    $('.'+$url_parameter).addClass('page-active');

                    convertInTags();
                    getAllNotification();


                    $now_url = window.location.href; 
                    // $now_url=$now_url.slice(0,-1)
                    console.log('new url is '+$now_url);

                    if (add_url=='no')
                    {}else{
                        $url_array.splice(0, 0,$now_url);
                        console.log($url_array);
                    }
                    


              },
              error: function (xhr, ajaxOptions, thrownError) {
                if(xhr.status == 401)
                {
                    window.location.href = "{{ route('login')}}";
                }

              }

            });

        }


        function convertInTags()
        {
            $( ".caption-paragraph" ).each(function(index) {
                var string = $(this).text();
                $(this).html(string.replace(/#(\S*)/g,'<a class="text-primary btn-tag">#$1</a>'));
            });
        }



        function fullCalendar()
        {
                    var calendarEl = document.getElementById('calendar');
                    var calendar = new FullCalendar.Calendar(calendarEl, {

                      initialView: 'dayGridMonth',
                                headerToolbar: {
                                            left: 'prev,next',
                                            center: '',
                                            right: 'title'
                                        },
                                        height: 800,
                                        contentHeight: 750,
                                        aspectRatio: 3,

                                         defaultView: 'listWeek',

                                        editable: true,
                                        eventLimit: true,
                                        navLinks: true,
                                        events : []

                    });
                    calendar.render();
        }



    </script>



    <!-- Firebase App (the core Firebase SDK) is always required and must be listed first -->
    <script src="https://www.gstatic.com/firebasejs/4.9.1/firebase.js"></script>


    <script>
        $( document ).ready(function() {
            scrollChat();
        })

    </script>



    <script>

        var config = {
            apiKey: "{{ config('services.firebase.api_key') }}",
            authDomain: "{{ config('services.firebase.auth_domain') }}",
            databaseURL: "{{ config('services.firebase.database_url') }}",
            projectId: "{{ config('services.firebase.project_id') }}",
            storageBucket: "{{ config('services.firebase.storage_bucket') }}",
            messagingSenderId: "{{ config('services.firebase.messaging_sender_id') }}"
        };
        firebase.initializeApp(config);

        var convo_id = {{ $con->id??0 }};

        firebase.database().ref("/notifications").orderByChild("ID").on("value",snapshot => {
            if (snapshot.exists()){
                const userData = snapshot.val();
                getAllNotification()

            }
        });

        firebase.database().ref("/messages").orderByChild("ID").on("value",snapshot => {
            if (snapshot.exists()){
                const userData = snapshot.val();
                console.log('firebase is init on messsage send')
                var chat_id=$('.active_chat .change-chat').data('id')
                reloadConversation(chat_id)
            }
        });




        var reloadConversation = function(id){
            if (id)
            {

            }else {

                id=0;
            }
            console.log('id of conversation to reload chat'+id)
            $.get("{{ route('get.chat') }}?id="+id, function(messages){
                console.log('chat view is blow')

                $('.render-messages').html(messages);
                scrollDown();
            });
        }
        function ajaxRun(message,receiver_id) {
            $.ajax({
                url: '{{ route("save.messsage") }}',
                data: {
                    message: message,
                    con_id: {{ $con->id??0 }},
                    receiver_id:receiver_id,

                },
                method: 'post',
                headers: {
                    'X-CSRF-TOKEN': "{{ csrf_token() }}"
                },
                success: function(response) {

                    $('#btnSend').attr('disabled', false);
                    $('#message').val('');

                    console.log('response come after message send and id is '+response.id )
                    reloadConversation(response.id.toString());
                    scrollDown();

                }
            });
        }


        $(document).on('keypress','#message',function (e) {
            var key = e.which;

            if (key == 13)  // the enter key code
            {
                var self = $(this);
                var message = $('#message').val();
                var receiver_id= $('.active_chat .change-chat').attr('data-receiver-id')
                if(message == '')
                {
                    $('#message').css('border','1.3px solid red');
                    return false;
                }
                self.attr('disabled', true);
                ajaxRun(message,receiver_id);
            }
        });

        $(document).on('click','#btnSend',function(e) {
            var self = $(this);
            var message = $('#message').val();
           var receiver_id= $('.active_chat .change-chat').attr('data-receiver-id')


            if(message == '')
            {
                $('#message').css('border','1.3px solid red');
                return false;
            }

            self.attr('disabled', true);
            ajaxRun(message,receiver_id);

        });
    </script>
    <script>
        var scrollChat = function()
        {
            var objDiv = document.getElementById("render-messages");

            objDiv.scrollTop = objDiv.scrollHeight;

        }
    </script>

    <script>
        $(document).ready(function(){
            var input = document.getElementById("message");

            input.addEventListener("keyup", function(event) {

                if (event.keyCode === 13) {
                    event.preventDefault();
                    document.getElementById("btnSend").click();
                }
            });
        });

    </script>





        <script>


        getUrlParameter('p') == false ?  changePage('news_feed','yes') : changePage(getUrlParameter('p','yes'));




        var openFile = function(event) {
            var input = event.target;
            if (isVideo($('#imgupload').val())){
                $('.video-preview').attr('src', URL.createObjectURL(input.files[0]));
                $('.showable-img').hide();
                $('.showable-video').show();
                // $('#output').hide();
                $('#media_type').val('video');
            }
            else
            {
                var reader = new FileReader();
                reader.onload = function () {
                    var dataURL = reader.result;
                    var output = document.getElementById('output');
                    output.src = dataURL;
                };
                reader.readAsDataURL(input.files[0]);
                $('.showable-img').show();
                $('.showable-video').hide();
                $('#output').show();
                $('#media_type').val('photo');

            }
        }
        function isVideo(filename) {
            var ext = getExtension(filename);
            switch (ext.toLowerCase()) {
                case 'm4v':
                case 'avi':
                case 'mp4':
                case 'mov':
                case 'mpg':
                case 'mpeg':
                    // etc
                    return true;
            }
            return false;
        }
        function getExtension(filename) {
            var parts = filename.split('.');
            return parts[parts.length - 1];
        }

        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#output').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $(document).on("change", "#imgupload", function(evt) {

            if (isVideo($(this).val()))
            {
                var $source = $('#video_here');
                $source[0].src = URL.createObjectURL(this.files[0]);
                $source.parent()[0].load();
                $('.showable-img').hide();
                $('.showable-video').show();
                $('#media_type').val('video');
            }else {
                readURL(this);
                $('.showable-img').show();
                $('.showable-video').hide();
                $('#output').show();
                $('#media_type').val('photo');
            }

        });
    </script>
    <script>
        $(document).ready(function (){
            $('#imgupload').hide()
            $('.like-heart').hide()
            $('.showable-img').hide()
            $('.showable-video').hide()


        });

        $(document).on('click','.comment-btn',function (){
            $(this).closest('.post-actions').find('.comment-input').focus()
            // $(this).closest('.post-actions').find('.comments-div').show()
        })

        $('#OpenImgUpload').click(function(){
            $('#imgupload').trigger('click');
            $(this).attr('data-toogle').hide()

        });


        $(document).on('click','.post_delete_btn',function (e){
            e.preventDefault()
            
            var thiss=$(this)
            var url=$(this).attr('data-url');
            $.ajax({
                method:'get',
                url:url,
                success:function (data){
                    console.log('post delete')
                    thiss.closest('.card').remove()
                    toastr.success('Post Delete Successfully')
                    location.reload();
                }
            })
        })

        $(document).on('click','.follow_btn',function (e){
            e.preventDefault()
            var thiss=$(this);
            var url=thiss.attr('data-url')
            var data=thiss.closest('form').serialize()
            $.ajax({
                method:'post',
                url:url,
                data:data,
                success:function (data){
                    console.log('follow')

                    thiss.text('UnFollow')
                    thiss.css('background-color','#ff8510')
                    thiss.removeClass('follow_btn')
                    thiss.addClass('un_follow_btn')
                }
            })

        })
        $(document).on('click','.un_follow_btn',function (e){
            e.preventDefault()
            var thiss=$(this);

            var url=$(this).closest('form').find('.un_follow_url').val()
            var data=thiss.closest('form').serialize()

            $.ajax({
                method:'post',
                url:url,
                data:data,
                success:function (data){
                    console.log('unfollow')

                    thiss.text('Follow')
                    thiss.css('background-color','#00cfe8')
                    thiss.removeClass('un_follow_btn')
                    thiss.addClass('follow_btn')

                }
            })

        })

        $(document).on('click','.like-btn',function (){
            var thiss=$(this);
            $(this).closest('.row').find('.fa-heart').toggleClass('text-danger')
            var id=thiss.closest('.row').find('.social_post_id').val()

            var url="{{route('social.reaction','id')}}"
            url=url.replace('id',id)
            $.ajax({
                method:'get',
                url:url,
                success:function (data){

                    var likes=thiss.closest('.row').find('.total-likes').text(data.likes)

                }
            })

        })


        $(document).on('click','.show_more_comments',function (e){
            e.preventDefault()
            var thiss=$(this);

            thiss.closest('.comments-row').find('.less-comments-div').toggleClass('d-none')
            thiss.closest('.comments-row').find('.show-all-comments-div').toggleClass('d-none')

        })

        $(document).on('click','.show_less_comments_btn',function (e){
            e.preventDefault()
            var thiss=$(this);

            thiss.closest('.comments-row').find('.less-comments-div').toggleClass('d-none')
            thiss.closest('.comments-row').find('.show-all-comments-div').toggleClass('d-none')

        }) 
        $(document).on('click','.reply',function (e){
            e.preventDefault()
            $('.comments-show').each(function (){
                $(this).removeClass('after')
            })
            var name=$(this).closest('.comments-show').find('.image-name').text()
            $(this).closest('.comments-show').addClass('after')
            $(this).closest('.comments-div').find('.comment-input').focus()
            var comment_id=$(this).closest('.reply-div').find('.reply_comment_id').val()
            $(this).closest('.comments-div').find('.comment_id').val('')
            $(this).closest('.comments-div').find('.comment_id').val(comment_id)
            // $(this).closest('.comments-div').find('.comment-input').val(name+' '+' ')
        })

        $(document).on('click','.media-album-popup',function(){

            var id=$(this).data('id');
            var url="{{ route('social.load.album',':id') }}";
            url=url.replace(':id',id);

            $.ajax({
                method:'get',
                url:url,
                success:function(response)
                {
                    $('#albumModal .modal-body').html(response);
                    $('#albumModal').modal('show');
                }
            });

        })

        $(document).on('click','.delete_comment',function(e){
            e.preventDefault();



            var thiss=$(this);
            var id=$(this).data('id');
            var removeClass=$(this).data('removeclass');
            var url="{{route('social.comment.delete',':id')}}"
            url=url.replace(':id',id);

            $.ajax({

                method:'get',
                url:url,
                beforeSend: function() {
                    return confirm("Are you sure you want to delete?");
                },
                success:function(data)
                {
                    // thiss.closest('.parent-div').remove();
                    $('.'+removeClass+'').remove();

                }
            });


        })
        function confirmIt()
        {
            confirm('You are going to delete it?');
        }

        $(document).on('submit','.comment-form',function (e){

            e.preventDefault()
            var thiss=$(this);
            var url=thiss.attr('action')
            $.ajax({
                method:'post',
                url:url,
                data:thiss.serialize(),
                success:function (data){
                    thiss.closest('.comments-div').find('.comment_id').val('')
                    if (data)
                    {
                       if (data.comments.parent_id)
                        {
                            // thiss.closest('.comments-div').find('.comments-row .after').css('background-color','red');


                            thiss.closest('.comments-div').find('.comments-row .after').append('<div class="comments parent-div mt-2 ml-3" style="border-radius: 5px; background-color: #f4f4f4;">\n' +
                                '                <img class="profile-avatar-small1 float-left" src="{{ asset(Auth::user()->avatar) }}" alt=""><sapn class="ml-1"><strong class="image-name">{{ Auth::user()->name }}</strong></sapn>\n' +

                                '            <div class="comment-text-div">\n' +
                                '                <p class="pl-5 mb-0">'+data.comments.comment+'</p>\n' +
                                '                <div class="reply-div">\n' +
                                '                    <input type="hidden" value='+data.comments.id+' class="reply_comment_id">\n' +
                                '                        <a href="##" class="ml-1 mb-1 reply">Reply</a>\n' +
                                '                           <a class=" delete_comment text-danger pl-1" data-id='+data.comments.id+'>Delete</a>\n' +
                                '                </div>\n' +
                                '            </div>\n' +
                                '        </div>');
                        }else {
                            thiss.closest('.comments-div').find('.comments-row').append('<div class="col-sm-12 mt-2 comments-show parent-div">\n' +
                                '<div class="comments" style="border-radius: 5px; background-color: #f4f4f4;">\n' +
                                '                <img class="profile-avatar-small1 float-left" src="{{ asset(Auth::user()->avatar) }}" alt=""><sapn class="ml-1"><strong class="image-name">{{ Auth::user()->name }}</strong></sapn>\n' +

                                '            <div class="comment-text-div">\n' +
                                '                <p class="pl-5 mb-0">'+data.comments.comment+'</p>\n' +
                                '                <div class="reply-div">\n' +
                                '                    <input type="hidden" value='+data.comments.id+' class="reply_comment_id">\n' +
                                '                        <a href="##" class="ml-1 mb-1 reply">Reply</a>\n' +
                                '                           <a class="delete_comment text-danger pl-1" data-id='+data.comments.id+'>Delete</a>\n' +
                                '                </div>\n' +
                                '            </div>\n' +
                                '        </div>\n' +
                                '</div>');
                        }
                        thiss.closest('.comments-div').find('.comment-input').val('');
                    }

                }
            })

        })


    </script>






    <script>
        $(document).on('click', '.btn-update-group-status', function(){

            $group_id = $(this).data('id');
            $('.post-hidden-input').html('<input type="hidden" name="group_id" value="'+$group_id+'">');
        })
    </script>

    <script>
        $(document).on('click', '.media-popup', function(){

            $('#albumModal').modal('hide');

            $type = $(this).data('type');
            $src = $(this).attr('src');

            if($(this).attr('data-src'))
            {
                $('#modalMediaPopup .modal-body').html('<img src="'+$(this).attr('data-src')+'">');
            }
            else
            {
                if($type == 'video')
                {
                      $('#modalMediaPopup .modal-body').html('<video src="'+$src+'" controls="controlls">');
                }
                else
                {
                    $('#modalMediaPopup .modal-body').html('<img src="'+$src+'">');
                }
            }


            $('#modalMediaPopup').modal('show');

        })



        $(document).on('click', '.post_edit_btn', function(e){
            e.preventDefault()
            var url = $(this).attr('data-url');
            $.ajax({
                type: 'GET',
                url: url,
                success: function (response) {

                    $('#post_id').val(response.id)
                    $('#post_status_input').val(response.status);

                    $('.caption_textarea').text('')
                    $('.caption_textarea').text(response.caption)
                    $('#desc_textarea').text(response.desc)
                    $('.note-editable').html(response.desc)
                    if (response.status=='Public')
                    {
                        $('#post_status_type option:first').attr('selected','selected');
                    }
                    else
                    {
                        $('#post_status_type option:last').attr('selected','selected');

                    }
                    if(response.media_type=='video')
                    {
                        $('#media_type').val('video');
                        $('#video').attr('src',response.media_path)
                        $('.showable-img').hide()
                        $('.showable-video').show()
                    }if(response.media_type=='photo') {
                        $('#media_type').val('photo')
                        $('#output').attr('src',response.media_path)
                        $('.showable-video').hide()
                        $('.showable-img').show()
                    }
                    if(response.post_type!='News' && response.post_type!=null) {
                        
                        $('.note-editor').show()
                    }else{
                        $('.note-editor').hide()
                    }
                    $('#post-modalLabel').text('Update Post')
                    $('#modalUpdatePostStatus').modal('show')

                }

            });
        })

         $('body').on('mouseleave', '.popover', function () {
            $(this).toggleClass('show');
        });

        $(document).on('click','.input-type',function (){

           var type= $(this).data('value');
           

           var group_id= $(this).data('user_social_group_id');


            $('#post_type').val(type)
            $('#user_social_group_id').val(group_id)

            if (type=='News')
            {
                $('.note-editor').hide()
                $('#desc_textarea').attr('disabled',true);
                $('.create-post-model .modal-content .modal-body').css('height','225px')
            }else {

                $('.note-editor').show()
                $('#desc_textarea').attr('disabled',false);

                $('.create-post-model .modal-content .modal-body').css('height','348px')
            }
            $('.create-post-model').modal('show')

        })
        $(document).on('click','#post_type_btn',function (){
            $('#modalPostType').modal('hide')

        })


        $(document).on('change','#post_status_type',function (){
            var val=$(this).val();
            $(this).closest('.modal').find('#post_status_input').val(val);

        });

        $(document).on('click','.post_status_change_btn',function (){
            var thiss=$(this);
            var url=$(this).data('url');
            var status=$(this).data('status');

            
            $.ajax({
                method:'get',
                url:url,
                data:{status:status},
                success:function(data)
                {
                    if (data)
                    {
                        thiss.text(' ');
                       
                        
                        if (data=='Public') 
                        {
                             thiss.data('status','Private');
                            thiss.append('<i class="fa fa-check mr-1"></i> Private');
                        }else{
                            thiss.data('status','Public');
                            thiss.append('<i class="fa fa-check mr-1"></i> Public');
                        }
                        
                        toastr.success('Post status has been changed');
                    }
                }
            })

            

        });


    </script>




    <script>

        $(document).ready(function() {
           
            $('#desc_textarea').summernote({

                toolbar: [
                    ['style', ['bold', 'italic', 'underline', 'clear']],
                    ]
            });
        });

        hideSponserModel()
        {
            $('#modalAdvocateSlideshow').model('hide');
        }

         @php
            
            if(!Session::has('modalAdvocateSlideshow'))
            {
                Session::put('modalAdvocateSlideshow', true);
            }

        @endphp

    
    </script>
        <script type="text/javascript">
        function showToastMessage()
        {

            var url =window.location.href;
             var parts = url.split("/");
            var last_part = parts[parts.length-1];
            last_part=last_part+'-toast';

             
            // $('.toast-text').text('');
            // var text="{{$setting['dashboard-toast']??''}}"
            // $('.toast-text').text(text);
            $('.toast').toast('show');
        }
        $(document).ready(function(){
            
            showToastMessage()
        });
    </script>
     <!-- social album script -->
    <script>

        $(document).on('click','.upload-photo-in-album',function(e){
            
                e.preventDefault();
                var id=$(this).data('id');
                
                $('#uploadAlbumModelTitle select option').each(function(){
                    var val=$(this).val();
                    if (val==id) {
                        $(this).attr('selected','selected');
                        return false;
                    }
                })
                $('#uploadAlbumModelTitle').modal('show');
            // $('.page-loader').removeClass('d-none')
           
        });



        $(document).on('submit','#createNewAlbumForm',function(e){
            
                e.preventDefault();
            $('.page-loader').removeClass('d-none')
            $('#createNewalbumModal').modal('hide');
            var url=$(this).attr('action');
            var data=$(this).serialize();
            $.ajax({
                method:'post',
                url:url,
                data:data,
                dataType:'JSON',
                success:function(data)
                {
                   
                    // changePage('media','yes');
                    changePage(getUrlParameter('p'),'yes');

                }
            })
        });

        $(document).on('submit','#uploadPhotoInAlbumForm',function(e){
                e.preventDefault();

            $('.page-loader').removeClass('d-none')
            
            
            $(this).find('select option:first').attr('selected','selected');
            $(this).find('dropify-wrapper .dropify-preview').css('display','none');
            $('#uploadAlbumModelTitle').modal('hide');

            var url=$(this).attr('action');
            
           
            $.ajax({
                method:'post',
                url:url,
                data: new FormData(this),
                dataType:'JSON',
                processData: false,
                contentType: false,
                success:function(data)
                {
                   
                    changePage(getUrlParameter('p'),'yes');
                    $('.page-loader').addClass('d-none')

                }
            })
        })
        $(document).on('click','.delete-album-btn',function(e){
            
                e.preventDefault();
            // $('.page-loader').removeClass('d-none')
           
            var id=$(this).data('id');
            var url=$(this).attr('href');
            
          
            $.ajax({
                method:'get',
                url:url,
                dataType:'JSON',
                beforeSend: function() {
                    return confirm("Are you sure you want to delete?");

                },
                success:function(data)
                {
                   
                    changePage(getUrlParameter('p'),'yes');

                }

            })
        });
        $(document).on('click','.edit-album-btn',function(e){
            
                e.preventDefault();
           
            var id=$(this).data('id');
            var name=$(this).data('name');
            $('#createNewalbumModal').find('#album_id_for_edit').val(id);
            $('#createNewalbumModal').find('.name').val(name);
            $('#createNewalbumModal').modal('show');
            
        });
        $(document).on('click','.upload-photo-in-album',function(e){
            
                e.preventDefault();
                getModelBody();
            
        });

        function getModelBody()
        {

            var url="{{route('social.get.model.body')}}"
              $.ajax({
                method:'get',
                url:url,
               
                success:function(data)
                {

                    $('#uploadAlbumModelTitle').find('#model-body').html(' ');
                    $('#uploadAlbumModelTitle').find('#model-body').html(data);
                    $('.dropify').dropify();
                    $('#uploadAlbumModelTitle').modal('show');
                    

                }
            })
        }
    </script>

    @yield('js')

</body>
</html>
