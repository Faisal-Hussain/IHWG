@extends('layouts.advocate')
@section('title','Article Management')
@section('heading','Article Management')
@section('css')
    <style>
        .modal-body .showable-img #output{
            width: 100%;
            height: 220px;
            object-fit: cover;
            border: 0;
            padding-left: 0;
            padding-right: 0;
            padding-top: 5px;

        }
        .showable-img{
            width: 100%;
            height: 220px;
            object-fit: cover;
            border: 0;
            padding-left: 0;
            padding-right: 0;
            padding-top: 5px;
        }
        .video-preview{
            width: 100%;
            height: 200px;
            padding: 0;
        }
        .btn-row{
            border-radius: 4px;
            padding-top: 40px;

        }
        .modal-title{
            text-align: center;
        }
        .dropdown-toggle::after {
            border: none !important;
            content: '\e842' !important;
            position: absolute;
        }
        .comments-div.comment-input{
            border-radius: 7px;
        }
        .fa-caret-right{
            font-size: 20px;
        }
        .caption_textarea{
            resize: none;
            overflow: auto;
            border: white;
        }
        .profile-avatar-small1 {
            border-radius: 100px;
            width: 29px;
            height: 28px;
            border: 2px solid red;
        }
        .html body p {
            line-height: 0.5rem;
        }


    </style>
@endsection

@section('content')

    <div id="user-profile">

        <section id="profile-info">
            <div class="row">
                <div class="col-lg-3 col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="text-center">
                                <img class="profile-avatar mb-1" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                <h6 class="m-0">Maria Selva</h6>
                                <small>Nipissing, Ontario</small>

                                <div class="row mt-2 account-counter">
                                    <div class="col-sm-4">
                                        <strong>120</strong>
                                        <small>POSTS</small>
                                    </div>
                                    <div class="col-sm-4">
                                        <strong>50</strong>
                                        <small>CONNECTIONS</small>
                                    </div>
                                    <div class="col-sm-4">
                                        <strong>4</strong>
                                        <small>GROUPS</small>
                                    </div>
                                </div>
                            </div>

                            <hr class="my-2">
                            <div class="account-sidebar-links ml-1">
                                <a href="#"><i class="fas fa-comment-alt pr-1"></i> News Feed</a>
                                <a href="#"><i class="fas fa-comment-dots pr-1"></i> Messages</a>
                                <a href="#"><i class="fas fa-comment-alt pr-1"></i> Events</a>
                                <a href="#"><i class="fas fa-user-alt pr-1"></i> Connections</a>
                                <a href="#"><i class="fas fa-users pr-1"></i> Groups</a>
                                <a href="#"><i class="fas fa-camera pr-1"></i> Photos</a>
                                <a href="#"><i class="fas fa-calendar pr-1"></i> Calendar</a>
                            </div>

                        </div>
                    </div>
                    <div class="groups-connection-card">
                        <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-sm-12 text-left mb-2">
                                            <strong>Connections 1234</strong>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>maria</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>shamsha</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>shammo</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                        <div class="col-sm-4 mb-2 p-0">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <small>ramssy</small>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row text-left">
                                        <div class="col-sm-12 mb-2">
                                            <strong>Groups 4</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                    </div>

                                </div>
                            </div>

                            <div class="card">
                                <div class="card-body">
                                    <div class="row text-left">
                                        <div class="col-sm-12 mb-2">
                                            <strong>Associations</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                        <div class="col-sm-12 mb-2">
                                            <img class="profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                            <strong class="pl-1">ramssy</strong>
                                        </div>
                                    </div>

                                </div>
                            </div>
                    </div>

                </div>
                <div class="col-lg-6 col-12">

                    <div class="card">
                        <div class="card-body">
                            <div class="cover-container">
                                <div class="cover-notification-content">
                                    <a href="#" class="btn-notification">Notifications ON <i class="fas fa-info-circle"></i></a>
                                </div>
                                <img class="profile-cover-avatar" src="https://images.pexels.com/photos/15286/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940" alt="">
                                <div class="cover-heading-content">
                                    <small class="mt-0 font-weight-bold text-white">Innerself Homepathy Wellness Group</small>
                                </div>
                            </div>

                            <div class="row mt-2">
                                <div class="col-sm-6">
                                    <div class="media">
                                        <img class="mr-1 profile-avatar-small" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt="">
                                        <div class="media-body">
                                            <small class="mt-0 font-weight-bold">Innerself Homepathy Wellness Group</small>
                                            <strong>Solutions Company</strong>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 m-auto text-center">
                                    <a href="##" class="btn-social-icon" data-toggle="modal" data-target="#exampleModalCenter">Write a message</a>
                                    <a href="" class="btn-social-icon">Connect</a>
                                </div>
                            </div>

                        </div>
                    </div>

                    <div class="card news-feed-links">
                        <div class="card-body">
                            <a href="#">Events</a>
                            <a href="#">About</a>
                            <a href="#">News</a>
                            <a href="#">Articles</a>
                            <a href="#">Feed</a>
                        </div>
                    </div>

                    <div class="row">
                        
                        <div class="col-sm-12 wrapper">

                            @if($connects)
                                <div id="connects">
                                    @include('advocate.social-network.connects',['connects'=>$connects])
                                </div>
                            @else
                                <div id="results">

                                </div>
                                <div class="auto-load text-center">
                                    <svg version="1.1" id="L9" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                         x="0px" y="0px" height="60" viewBox="0 0 100 100" enable-background="new 0 0 0 0" xml:space="preserve">
                                                <path fill="#000"
                                                      d="M73,50c0-12.7-10.3-23-23-23S27,37.3,27,50 M30.9,50c0-10.5,8.5-19.1,19.1-19.1S69.1,39.5,69.1,50">
                                                    <animateTransform attributeName="transform" attributeType="XML" type="rotate" dur="1s"
                                                                      from="0 50 50" to="360 50 50" repeatCount="indefinite" />
                                                </path>
                                            </svg>
                                </div>
                            @endif

                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-12">
                    <div class="card">
                        <div class="card-body pt-1">
                            <h6>Photo Albums  2</h6>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="https://static.wixstatic.com/media/nsplsh_bca9a2ee9fd94f489d389d01d36df034~mv2.jpg/v1/fill/w_147,h_98,al_c,q_80,usm_0.66_1.00_0.01/Image%20by%20Zane%20Lee.webp" class="w-100 mb-1 rounded-sm" alt="">
                                </div>
                                <div class="col-md-12">
                                    <img src="https://static.wixstatic.com/media/nsplsh_9a4d5b069a454862968fe21c121e2603~mv2.jpg/v1/fill/w_147,h_98,al_c,q_80,usm_0.66_1.00_0.01/Image%20by%20Headway.webp" class="w-100 mb-1 rounded-sm" alt="">
                                </div>

                            </div>
                            <h6>Videos 4</h6>
                            <div class="row">
                                <div class="col-md-12">
                                    <img src="https://static.wixstatic.com/media/nsplsh_bca9a2ee9fd94f489d389d01d36df034~mv2.jpg/v1/fill/w_147,h_98,al_c,q_80,usm_0.66_1.00_0.01/Image%20by%20Zane%20Lee.webp" class="w-100 mb-1 rounded-sm" alt="">
                                </div>
                                <div class="col-md-12">
                                    <img src="https://static.wixstatic.com/media/nsplsh_9a4d5b069a454862968fe21c121e2603~mv2.jpg/v1/fill/w_147,h_98,al_c,q_80,usm_0.66_1.00_0.01/Image%20by%20Headway.webp" class="w-100 mb-1 rounded-sm" alt="">
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>


    <!-- post Modal -->
    <div class="modal fade" data-backdrop="static" data-keyboard="false" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title text-center" id="post-modalLabel">Create Post</h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="d-flex align-items-center pt-1">
                    <div class="user-img">
                        <img src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" width="40" height="40" alt="userimg" class="avatar-60 rounded-circle img-fluid ml-2">
                    </div>
                    <div class="post-text pl-1" action="">
                        <strong>Remssy</strong>
                    </div>
                </div>
                <form id="post-form" action="{{route('advocate.save-post')}}" method="post" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="media_type" value="" id="media_type">
                    <div class="modal-body">
                        <textarea class="form-control caption_textarea" rows="2" placeholder="What's in your Mind..." name="caption" required=""></textarea>
                        <div class="showable-img">
                            <img src="" id="output" class="show-image">
                        </div>
                        <div class="showable-video">
                            <video width="100%" controls>
                                <source src="mov_bbb.mp4" id="video_here">
                                Your browser does not support HTML5 video.
                            </video>
                        </div>

                        <ul class="d-flex flex-wrap align-items-center shadow-sm list-inline m-0 p-0">

                            <li class="col-md-6">
                                <div class="iq-bg-primary rounded p-2 pointer mr-3"><h6><b>Add to your Post</b></h6></div>
                            </li>
                            <li class="col-md-6">
                                <input type="file" name="file" id="imgupload" class="form-control">
                                <a href="##" id="OpenImgUpload" data-toggle="tooltip" title="Photo/Video"><div class="iq-bg-primary rounded p-2 pointer mr-3"><img src="https://templates.iqonic.design/socialv/html/images/small/07.png" alt="icon" class="img-fluid"> Photo/Video</div>
                                </a>
                            </li>
                        </ul>
                        <hr>
                        <button type="submit" class="btn btn-primary form-control save-post mb-1">Post</button>
                    </div>




                </form>
            </div>
        </div>
    </div>


@endsection
@section('js')
    <script>
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

        $('.comment-btn').on('click',function (){
            // alert()
            $(this).closest('.post-actions').find('.comments-div').show()
            // $(this).closest('.post-actions').css('background-color','red')
        })

        $('#OpenImgUpload').click(function(){
            $('#imgupload').trigger('click');
            $(this).attr('data-toogle').hide()

        });



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

            var url=thiss.closest('form').find('.un_follow_url').val()
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

            var url="{{route('advocate.reaction','id')}}"
            url=url.replace('id',id)
            $.ajax({
                method:'get',
                url:url,
                success:function (data){
                    console.log(data)
                    var likes=thiss.closest('.row').find('.total-likes').text(data.likes)

                }
            })

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
            $(this).closest('.comments-div').find('.comment_id').val(comment_id)
            // $(this).closest('.comments-div').find('.comment-input').val(name+' '+' ')
        })

        $(document).on('submit','.comment-form',function (e){

            e.preventDefault()
            var thiss=$(this);
            var url=thiss.attr('action')
            $.ajax({
                method:'post',
                url:url,
                data:thiss.serialize(),
                success:function (data){
                    console.log(data.comments.comment)
                    if (data)
                    {
                        if (data.comments.parent_id)
                        {
                            // thiss.closest('.comments-div').find('.comments-row .after').css('background-color','red');

                            thiss.closest('.comments-div').find('.comments-row .after').append('<div class="comments mt-2" style="border-radius: 5px; background-color: #f4f4f4;">\n' +
                                '                <img class="profile-avatar-small1 float-left" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt=""><sapn class="ml-1"><strong class="image-name">Ramssy</strong></sapn>\n' +
                                '            <div class="comment-text-div">\n' +
                                '                <p class="pl-5 mb-0">'+data.comments.comment+'</p>\n' +
                                '                <div class="reply-div">\n' +
                                '                    <input type="hidden" value='+data.comments.id+' class="reply_comment_id">\n' +
                                '                        <a href="##" class="ml-1 mb-1 reply">Reply</a>\n' +
                                '                </div>\n' +
                                '            </div>\n' +
                                '        </div>');
                        }else {
                            thiss.closest('.comments-div').find('.comments-row').append('<div class="col-sm-12 mt-2 comments-show">\n' +
                                '<div class="comments" style="border-radius: 5px; background-color: #f4f4f4;">\n' +
                                '                <img class="profile-avatar-small1 float-left" src="http://127.0.0.1:8000/uploads/users/1625574373.jpg" alt=""><sapn class="ml-1"><strong class="image-name">Ramssy</strong></sapn>\n' +
                                '            <div class="comment-text-div">\n' +
                                '                <p class="pl-5 mb-0">'+data.comments.comment+'</p>\n' +
                                '                <div class="reply-div">\n' +
                                '                    <input type="hidden" value='+data.comments.id+' class="reply_comment_id">\n' +
                                '                        <a href="##" class="ml-1 mb-1 reply">Reply</a>\n' +
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
        var page = 1; //track user scroll as page number, right now page number is 1
        load_more(page); //initial content load
        $(window).scroll(function() { //detect page scroll
            if($(window).scrollTop() + $(window).height() >= $(document).height()) { //if user scrolled from top to bottom of the page
                page++; //page number increment
                load_more(page); //load content
            }
        });
        function load_more(page){
            $.ajax({
                url: '?page=' + page,
                type: "get",
                datatype: "html",
                beforeSend: function()
                {
                    $('.auto-load').show();
                }
            })
                .done(function(data)
                {
                    if(data.length == 0){
                        console.log(data.length);
                        //notify user if nothing to load
                        $('.auto-load').html("No more records!");
                        return;
                    }
                    $('.auto-load').hide(); //hide loading animation once data is received


                    $("#results").append(data); //append data into #results element
                    console.log(data);
                })
                .fail(function(jqXHR, ajaxOptions, thrownError)
                {
                    alert('No response from server');
                });
        }
    </script>

@endsection

