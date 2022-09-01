
<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <input type="hidden" name="csrf_token" id="csrf_token" value="{{csrf_token()}}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>@yield('title') - {{ env('APP_NAME') }}</title>
    <link rel="icon" type="image/png" sizes="16x16" href="{{ asset($setting['favicon'] ?? '')  }}">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <link href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/tables/datatable/datatables.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/vendors/css/tables/datatable/extensions/dataTables.checkboxes.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/pages/data-list-view.css') }}">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" />

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
    <!-- BEGIN: Page CSS-->
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/menu/menu-types/horizontal-menu.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/core/colors/palette-gradient.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('admin/css/custom.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/owl.carousel.min.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('front/icomoon/style.css') }}">
    <link rel="stylesheet" type="text/css" href="{{ asset('css/switch/style.css') }}">
    <!-- END: Page CSS-->
    <style>
        .btn
        {
            border-radius: 0 !important;
        }
        .main-menu
        {
            width: 260px;
        }
        .main-menu.menu-light ,
        .main-menu.menu-light .navigation
        {
            background-color: #388AF4;    
        }
        .main-menu.menu-light * ,
        .main-menu.menu-light li a ,
        .main-menu.menu-light .navigation *
        {
            color: #fff !important;
        }
        .main-menu.menu-light .navigation > li
        {
            padding: 0px;
        }

        .main-menu.menu-light li a
        {
            border-bottom: 1px solid #fff;
        }
        
        .main-menu i
        {
            font-size: 24px !important;
        }

        .main-menu ul.navigation-main > li:first-child {
            margin-top: 0rem;
        }


            .main-menu.menu-light .navigation > li.open > a, .main-menu.menu-light .navigation > li.sidebar-group-active > a 
            {
                color: transparent;
                background: transparent;
                border-radius: 0px;
                margin-bottom: 7px;
            }
            .main-menu.menu-light .navigation > li > ul
            {
                background-color: transparent;
            }

            .main-menu .fa-chevron-down 
            {
                font-size: 15px !important;
                line-height: 30px;
                opacity: 0.8;
            }
            .vertical-overlay-menu .main-menu .navigation li.has-sub > a:not(.mm-next):after
            {
                display: none;
            }
            .custom-toast {
                background-color: #ffffff;
                color: #000;
                border: none;
                box-shadow: 0 0.25rem 0.75rem rgb(34 41 47 / 15%);
            }

    </style>
    <style>
    

.card0 {
    background-color: #F5F5F5;
    border-radius: 8px;
    z-index: 0
}

.card00 {
    z-index: 0
}

.card1 {
    margin-left: 80px;
    z-index: 0;
    border-right: 1px solid #F5F5F5
}

.card2 {
    display: none
}

.card2.show {
    display: block
}

.social {
    border-radius: 50%;
    background-color: #FFCDD2;
    color: #388af4;
    height: 47px;
    width: 47px;
    padding-top: 16px;
    cursor: pointer
}



input:focus,
select:focus {
    -moz-box-shadow: none !important;
    -webkit-box-shadow: none !important;
    box-shadow: none !important;
    border: 1px solid #388af4 !important;
    outline-width: 0 !important
}

.custom-checkbox .custom-control-input:checked~.custom-control-label::before {
    background-color: #388af4
}

.form-group {
    position: relative;
    margin-bottom: 1.5rem;
    width: 77%
}

.form-control-placeholder {
    position: absolute;
    top: 0px;
    padding: 12px 2px 0 2px;
    transition: all 300ms;
    opacity: 0.5
}

.form-control:focus+.form-control-placeholder,
.form-control:valid+.form-control-placeholder {
    font-size: 95%;
    top: 10px;
    transform: translate3d(0, -100%, 0);
    opacity: 1;
    background-color: #fff
}

.next-button {
    width: 18%;
    height: 50px;
    background-color: #388af4;
    color: #fff;
    border-radius: 6px;
    padding: 15px;
    cursor: pointer
}

.next-button:hover {
    background-color: #388af4;
    color: #fff
}

.get-bonus {
    margin-left: 154px
}

.pic {
    width: 230px;
    height: 110px
}

#progressbar {
    position: absolute;
    left: 0px;
    overflow: hidden;
    color: #388af4;
}

#progressbar li {
    list-style-type: none;
    font-size: 8px;
    font-weight: 400;
    margin-bottom: 36px
}

#progressbar li:nth-child(3) {
    margin-bottom: 0px
}

#progressbar .step0:before {
    content: "";
    color: #fff
}

#progressbar li:before {
    width: 30px;
    height: 30px;
    line-height: 30px;
    display: block;
    font-size: 20px;
    background: #fff;
    border: 2px solid #388af4;
    border-radius: 50%;
    margin: auto
}

#progressbar li:last-child:before {
    width: 40px;
    height: 40px
}

#progressbar li:after {
    content: '';
    width: 3px;
    height: 66px;
    background: #BDBDBD;
    position: absolute;
    left: 58px;
    top: 15px;
    z-index: -1
}

#progressbar li:last-child:after {
    top: 147px;
    height: 132px
}

#progressbar li:nth-child(3):after {
    top: 81px
}

#progressbar li:nth-child(2):after {
    top: 0px
}

#progressbar li:first-child:after {
    position: absolute;
    top: -81px
}

#progressbar li.active:after {
    background: #388af4
}

#progressbar li.active:before {
    background: #388af4;
    font-family: FontAwesome;
    content: "\f00c"
}

.tick {
    width: 100px;
    height: 100px
}

.prev {
    display: block;
    position: absolute;
    left: 40px;
    top: 20px;
    cursor: pointer
}

.prev:hover {
    color: #D50000 !important
}

@media screen and (max-width: 912px) {
    .card00 {
        padding-top: 30px
    }

    .card1 {
        border: none;
        margin-left: 50px
    }

    .card2 {
        border-bottom: 1px solid #F5F5F5;
        margin-bottom: 25px
    }

    .social {
        height: 30px;
        width: 30px;
        font-size: 15px;
        padding-top: 8px;
        margin-top: 7px
    }

    .get-bonus {
        margin-top: 40px !important;
        margin-left: 75px
    }

    #progressbar {
        left: -25px
    }
}
.supporting_document_for_approval
{
    background-color: #2c3d58;
    
    color: white;
    font-weight: bold;
    font-size: 14px;
}
.supporting_document_for_approval2
{
    background-color: #2c3d58;
    
    color: white;
    font-weight: bold;
    font-size: 14px;
}


</style>
    @yield('css')

</head>

<body class="vertical-layout vertical-menu-modern 2-columns  navbar-floating footer-static   menu-expanded" data-open="click" data-menu="vertical-menu-modern" data-col="2-columns">
@php 

$last = url()->current();
$split = explode("/", $last);

$text_name=$split[count($split)-1];

$text=$setting[$text_name.'-toast']??'';





@endphp
    <!-- toaster -->

@if($text)
    <div class="toast custom-toast" role="alert" aria-live="assertive" aria-atomic="true" data-delay="6000" style="position: fixed; z-index:100 ; top: 1rem; left: 45%;">

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


    <!-- BEGIN: Navbar-->
    @include('homeopath.components.navbar')
    <!--End: Navbar-->

    <!-- BEGIN: Sidebar-->
    @include('homeopath.components.sidebar')
    <!-- END: Sidebar-->



    <!-- BEGIN: Content-->
    <div class="app-content content">
        <div class="content-overlay"></div>
        <div class="header-navbar-shadow"></div>
        <div class="content-wrapper mt-1">
            <div class="content-body">
                
                @if(Auth::User()->HomeopathProfile)
                    @yield('content')
                @else
                    @include('homeopath.post_registration')
                @endif
    
            </div>
        </div>
    </div>
    <!-- END: Content-->

    <div class="sidenav-overlay"></div>
    <div class="drag-target"></div>

        @include('homeopath.homeopath_modals')



        @if(Route::is('homeopath.dashboard'))
            <a href="{{ route('get.more.badges') }}" class="report-float bg-dark" title="Learn How to Get More Badges?">
                <i class="fas fa-award"></i>
            </a>
        @endif

    <script src="{{ asset('admin/vendors/js/vendors.min.js') }}"></script>

    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.buttons.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.bootstrap4.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/buttons.bootstrap.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/dataTables.select.min.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/tables/datatable/datatables.checkboxes.min.js') }}"></script>
    <script src="{{asset('admin/dropify/js/dropify.min.js') }}"></script>

    <script src="{{ asset('admin/vendors/js/extensions/tether.min.js') }}"></script>
    <script src="{{ asset('admin/js/core/app-menu.js') }}"></script>
    <script src="{{ asset('admin/js/core/app.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/components.js') }}"></script>
    <script src="{{ asset('admin/js/sweetalert.min.js') }}"></script>
    <script src="{{ asset('admin/js/scripts/ui/data-list-view.js') }}"></script>
    <script src="{{ asset('admin/vendors/js/extensions/toastr.min.js') }}"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="{{ asset('admin/js/map_autocomplete.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    <script src="{{ asset('admin/js/tag_input.js') }}"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/15.0.0/classic/ckeditor.js"></script>

<script type="text/javascript">
    $(document).ready(function(){
        
        showToastMessage()
    });
</script>
    <script>

        $(document).on('change','.booking_status_change',function(){
            var text="Are you sure you want to do this action with this appointment ?";
            var id=$(this).val();
            var status=$(this).find(':selected').data('status');
        
            $(this).closest('td').find('#appointment_status_change_form #hidden_appointment_id').val(id);
            $(this).closest('td').find('#appointment_status_change_form #hidden_appointment_status').val(status);
                var thiss=$(this);
            if (status)
            {
                    if (confirm(text) == true) 
                     {
                        
                            if (status=='Y2FuY2VsbGVk') 
                            {
                                $('#NoteModal').modal('show');
                            }else{
                                thiss.closest('td').find('#appointment_status_change_form').submit();
                            }

                            $(document).on('click','.submit_note_btn',function(){

                                var note=$('#NoteModal').find('#note_textarea').val();
                                
                                
                                
                                thiss.closest('td').find('#appointment_status_change_form #hidden_appointment_note').val(note);
                            
                                    thiss.closest('td').find('#appointment_status_change_form').submit();

                                 
                                    // window.location.href=$(this).val();
                                 
                            })
                        
                        // window.location.href=$(this).val();
                     }
            }
        })
        

    $(document).ready(function(){
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
        $('.datatable').DataTable();
            $(".datepicker").datepicker({
               minDate: 0,
               format: 'yyyy-mm-dd',
            });
    </script>
    <script type="text/javascript">
        $(function() {
    $('#form-tags-1').tagsInput();

    $('#form-tags-2').tagsInput({
        'onAddTag': function(input, value) {
            console.log('tag added', input, value);
        },
        'onRemoveTag': function(input, value) {
            console.log('tag removed', input, value);
        },
        'onChange': function(input, value) {
            console.log('change triggered', input, value);
        }
    });

    $('#form-tags-3').tagsInput({
        'unique': true,
        'minChars': 2,
        'maxChars': 10,
        'limit': 5,
        'validationPattern': new RegExp('^[a-zA-Z]+$')
    });

    $('#form-tags-4').tagsInput({
        'autocomplete': {
            source: [
                'apple',
                'banana',
                'orange',
                'pizza'
            ]
        }
    });

    $('#form-tags-5').tagsInput({
        'delimiter': ';'
    });

    $('#form-tags-6').tagsInput({
        'delimiter': [',', ';']
    });
});


    </script>





    <script>
        function showToastMessage()
        {

            var url =window.location.href;
             var parts = url.split("/");
            var last_part = parts[parts.length-1];
            last_part=last_part+'-toast';
            $('.toast').toast('show');

            
             
            
            
        }
        function anotherToast(text)
        {
            if ("{{$text_name}}"=='dashboard')
            {
                if (text) 
                {
                    $('.toast-text').text('');
                    $('.toast-text').text(text);
                    $('.toast').toast('show');
                }

            }
            else{
                    $('.toast-text').text('');
                    $('.toast-text').text(text);
                    $('.toast').toast('show');
                }
        }
    $(document).ready(function() {
        setTimeout(function() {
             @if(!Session::has('zoom-toast'))
             var text="{{$setting['zoom-toast']??''}}";
            @endif

            anotherToast(text);
          }, 8000);
        
        ClassicEditor
            .create(document.querySelector('#description'))
            .then(editor => {
                descriptionEditor = editor;
            })
            .catch(error => {
                console.error(error);
            });
        $('input[name="registration_number"]').click(function(){
            @if(!Session::has('register-homeopath-toast'))
                    var text="{{$setting['register-homeopath-toast']??''}}";

                    anotherToast(text);
            @endif
          
               
        });
        $('input[name="thumbnail"]').click(function(){
            
          var text="{{$setting['services-upload-avatar-toast']??''}}";
                    

            anotherToast(text);
               
        });
        $('input[name="caption"]').click(function(){
            
          var text="{{$setting['client-description-toast']??''}}";
                    

            anotherToast(text);
               
        });
            $(document).on('click','.btn-add-service',function(){

           
                    var text="{{$setting['themes-toast']??''}}";
                    

                    anotherToast(text);
       
          
               
        });
    });


        @php
            
            if(!Session::has('register-homeopath-toast'))
            {
                Session::put('register-homeopath-toast', true);
            }
            if(!Session::has('zoom-toast'))
            {
                Session::put('zoom-toast', true);
            }


        @endphp
   
</script>
<script type="text/javascript">
  
  function validate() 
  {

            var valid = true;
            $(".validation-alert").remove();
            $(".required:visible").each(function () {

              if ($(this).val() == "" || $(this).val() === null) {
                $(this)
                  .closest("div")
                  .append('<div class="validation-alert text-danger font-weight-bold">This field is required</div>');
                valid = false;
              }
            });
            if (!valid) {
              $("html, .main-panel").animate(
                {
                  scrollTop: $(".validation-alert:first").offset().top-80,
                },
                100
              );
            }
        return valid;
 }  

$(document).ready(function(){

var current_fs, next_fs, previous_fs;

// No BACK button on first screen
if($(".show").hasClass("first-screen")) {
$(".prev").css({ 'display' : 'none' });
}

// Next button
$(".next-button").click(function(){

    var next_div=$(this).data('next');
    var current_div=$(this).data('current');

 if (validate()) 
 {
            

            $("."+current_div).removeClass("show");
            $("."+next_div).addClass("show");
            $("ul ."+next_div).addClass("active");

            $("#progressbar li").eq($(".card2").index(next_fs)).addClass("active");

            $("."+current_div).animate({}, {
            step: function() {

            $("."+current_div).css({
            'display': 'none',
            'position': 'relative'
            });

            $("."+next_div).css({
            'display': 'block'
            });
            }
            });  
 }   


});

// Previous button
$(".prev").click(function(){

current_fs = $(".show");
previous_fs = $(".show").prev();

$(current_fs).removeClass("show");
$(previous_fs).addClass("show");

$(".prev").css({ 'display' : 'block' });

if($(".show").hasClass("first-screen")) {
$(".prev").css({ 'display' : 'none' });
}

$("#progressbar li").eq($(".card2").index(current_fs)).removeClass("active");

current_fs.animate({}, {
step: function() {

current_fs.css({
'display': 'none',
'position': 'relative'
});

previous_fs.css({
'display': 'block'
});
}
});
});

});

$(document).on('click','.supporting_document_for_approval',function(){
    var input=$(this).data('input');
    var html=`<div class="form-group input-group">
                                                       
                                                           
                                                            <input type="file" name="edu_designation[]" class="form-control" placeholder="" ><i class="fa fa-trash remove-designation-btn" style="font-size: 25px;padding-left: 15px;padding-top: 5px;color: red;"></i>
                                                            <div class="help-block"></div>
                                                        
                                                    </div>`;
    $('.append_designation_div').append(html)
});
$(document).on('click','.supporting_document_for_approval2',function(){
    var input=$(this).data('input');
  
    var html=`<div class="form-group input-group">
                                                       
                                                           
                                                            <input type="file" name="certifications[]" class="form-control" placeholder="Certification" ><i class="fa fa-trash remove-designation-btn" style="font-size: 25px;padding-left: 15px;padding-top: 5px;color: red;"></i>
                                                            <div class="help-block"></div>
                                                        
                                                    </div>`;
   
    $('.append_certification_div').append(html)
});
$(document).on('click','.remove-designation-btn',function(){

    $(this).closest('.form-group').remove();
})

</script>


    @yield('js')

</body>
<!-- END: Body-->

</html>
