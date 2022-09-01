@extends('layouts.front')
@section('title', $setting['mission_title'] ?? '')

@section('meta')
    <meta name="keywords" content="{{$setting['mission_keywords'] ?? ''}}">
    <meta name="description" content="{{$setting['mission_description'] ?? ''}}">
@endsection

@section('content')

@include('front.components.pages_banner', ['heading' => $setting['mission_title'] ?? '', 'description' => $setting['mission_description'] ?? ''])

<!--MAIN CONTENT SECTION-->
<section class="content">
    <div id="custom_single_page">
        <div class="py-4"  style="background-color:#F2F2F2 ;">
            <div class="container text-center">
                <h2 class="">MISSION STATEMENT</h2>
                <p style="margin:0 auto; max-width:849px">
                    {{$setting['mission_statemtnt_heading'] ?? ''}}
                </p>
            </div>
        </div>
        <div class="container py-4">
            <div class="row text-center">
                <div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
                    <div class="row img-part">
                        <div class="col-md-12 col-sm-12 colxs-12 img-section">
                            <svg preserveAspectRatio="xMidYMid meet" data-bbox="36 29.5 128.001 141" viewBox="36 29.5 128.001 141" height="108" width="130" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid--e99zcddjmg90"><defs><style>#comp-kouebxid svg [data-color="1"] {fill: #FF8080;}</style></defs><title id="svgcid--e99zcddjmg90"></title>
                                <g>
                                <path d="M140 122.6c-7.379 0-13.988 3.343-18.394 8.588L82.46 108.434A23.806 23.806 0 0 0 84 100c0-2.968-.548-5.81-1.541-8.435l39.127-22.776C125.991 74.047 132.61 77.4 140 77.4c13.233 0 24-10.744 24-23.95S153.233 29.5 140 29.5s-24 10.744-24 23.95c0 2.968.548 5.81 1.541 8.435L78.415 84.661C74.009 79.403 67.39 76.05 60 76.05c-13.233 0-24 10.744-24 23.95s10.767 23.95 24 23.95c7.391 0 14.011-3.354 18.417-8.614l39.137 22.749a23.773 23.773 0 0 0-1.553 8.465c0 13.206 10.767 23.95 24 23.95s24-10.744 24-23.95S153.233 122.6 140 122.6zm0-85.1c8.822 0 16 7.155 16 15.95s-7.178 15.95-16 15.95-16-7.155-16-15.95 7.178-15.95 16-15.95zm-80 78.45c-8.822 0-16-7.155-16-15.95s7.178-15.95 16-15.95S76 91.205 76 100s-7.178 15.95-16 15.95zm80 46.55c-8.822 0-16-7.155-16-15.95a15.8 15.8 0 0 1 1.894-7.513c.132-.162.256-.332.364-.518.07-.121.114-.25.17-.375 2.828-4.52 7.846-7.544 13.572-7.544 8.822 0 16 7.155 16 15.95s-7.178 15.95-16 15.95z" fill="#FF8080" data-color="1"></path>
                            </g>
                        </svg>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 image-title">
                        <span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;text-align: center;">{{$setting['mission_stat_1st_heading'] ?? ''}}</span>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12 image-description">
                        <p>{{$setting['mission_stat_1st_description'] ?? ''}}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
                <div class="row img-part ">
                    <div class="col-md-12 col-sm-12 colxs-12 img-section">
                        <svg preserveAspectRatio="xMidYMid meet" data-bbox="35.5 45 129.001 110" viewBox="35.5 45 129.001 110" height="120" width="120" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid-5wxx00-dhci8w"><defs><style>#comp-koueca90 svg [data-color="1"] {fill: #172A47;}</style></defs><title id="svgcid-5wxx00-dhci8w"></title>
                            <g>
                            <path d="M160.95 59.058a2.24 2.24 0 0 0-2.009.61l-11.555 11.545-7.195-1.926-1.927-7.189 11.555-11.545a2.229 2.229 0 0 0 .611-2.007 2.227 2.227 0 0 0-1.331-1.623c-9.379-3.889-20.078-1.774-27.254 5.396-7.566 7.559-9.251 18.8-5.064 28.004l-14.993 13.205-15.182-13.351a16.362 16.362 0 0 0 2.979-7.424c1.199-8.844 5.706-14.768 12.056-15.844 2.579-.438 4.564-2.685 4.621-5.349.057-2.662-1.887-4.985-4.521-5.407-6.649-1.058-19.774-.874-33.008 12.264l-14.645 14.54a5.331 5.331 0 0 0-1.586 3.791 5.329 5.329 0 0 0 1.561 3.801.916.916 0 0 1-.005 1.296L52.895 83a.915.915 0 0 1-1.296-.003 5.331 5.331 0 0 0-3.794-1.585h-.017a5.345 5.345 0 0 0-3.786 1.559l-6.384 6.338a7.063 7.063 0 0 0-.987 8.877 40.175 40.175 0 0 0 5.336 6.696 40.213 40.213 0 0 0 6.669 5.375 7.122 7.122 0 0 0 3.877 1.155 7.099 7.099 0 0 0 5.013-2.084l6.384-6.337a5.331 5.331 0 0 0 1.586-3.791 5.329 5.329 0 0 0-1.561-3.801.914.914 0 0 1 .004-1.294l1.165-1.156a.917.917 0 0 1 1.297.004 5.383 5.383 0 0 0 7.597.025l.254-.252 12.44 14.101L59.017 131.2a13.46 13.46 0 0 0-4.604 9.773 13.46 13.46 0 0 0 3.98 10.044C60.974 153.594 64.371 155 68 155a13.487 13.487 0 0 0 10.228-4.608l23.432-26.597 23.44 26.568A13.576 13.576 0 0 0 135.395 155c3.655 0 7.075-1.414 9.672-4.01a13.554 13.554 0 0 0 4.006-10.11c-.12-3.818-1.767-7.313-4.635-9.841l-27.7-24.362c.015-.016.032-.031.047-.048l12.312-13.973a25.064 25.064 0 0 0 10.413 2.262c6.397 0 12.795-2.433 17.665-7.299 7.176-7.169 9.295-17.859 5.401-27.231a2.23 2.23 0 0 0-1.626-1.33zM69.559 89.814a5.386 5.386 0 0 0-7.597-.025l-1.165 1.158a5.37 5.37 0 0 0-.023 7.59.905.905 0 0 1 .266.648.907.907 0 0 1-.27.646l-6.384 6.338a2.653 2.653 0 0 1-3.328.351 35.6 35.6 0 0 1-5.93-4.778c-1.737-1.745-3.332-3.749-4.742-5.954a2.644 2.644 0 0 1 .372-3.323l6.384-6.337a.912.912 0 0 1 .647-.267h.002c.142 0 .414.036.648.271a5.379 5.379 0 0 0 7.597.023L57.199 85a5.331 5.331 0 0 0 1.586-3.791 5.329 5.329 0 0 0-1.561-3.801.905.905 0 0 1-.266-.648c0-.142.036-.414.27-.646l14.645-14.54C83.712 49.825 95.23 49.62 101.039 50.55c.455.072.778.458.766 1.036-.009.41-.442.855-.909.935-8.248 1.397-14.274 8.922-15.726 19.635-.349 2.572-1.525 4.966-3.312 6.74L70.855 89.819a.916.916 0 0 1-1.296-.005zm5.326 57.635a9.065 9.065 0 0 1-6.58 3.094c-2.568.1-4.956-.868-6.762-2.674a9.06 9.06 0 0 1-2.677-6.756 9.066 9.066 0 0 1 3.096-6.575l27.673-24.374 9.055 10.263-23.805 27.022zm69.733-6.43a9.15 9.15 0 0 1-2.702 6.824c-1.826 1.823-4.252 2.807-6.829 2.7a9.16 9.16 0 0 1-6.645-3.124L77.416 89.582l6.173-6.128 57.903 50.926a9.143 9.143 0 0 1 3.126 6.639zm-31.178-37.331c-.015.017-.025.037-.039.055l-8.242-7.249 13.881-12.225a24.953 24.953 0 0 0 2.805 3.351 25.066 25.066 0 0 0 3.31 2.773l-11.715 13.295zm40.584-19.216c-8.003 7.996-21.027 7.996-29.03 0s-8.003-21.009 0-29.005a20.473 20.473 0 0 1 19.099-5.488l-9.888 9.88a2.222 2.222 0 0 0-.577 2.149l2.593 9.671a2.226 2.226 0 0 0 1.576 1.575l9.679 2.591a2.231 2.231 0 0 0 2.151-.577l9.888-9.88a20.424 20.424 0 0 1-5.491 19.084z" fill="#172A47" data-color="1"></path>
                        </g>
                    </svg>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 image-title">
                    <span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;">{{$setting['mission_stat_2nd_heading'] ?? ''}}</span>
                </div>
                <div class="col-md-12 col-sm-12 col-xs-12 image-description">
                    <p>{{$setting['mission_stat_2nd_description'] ?? ''}}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
            <div class="row img-part">
                <div class="col-md-12 col-sm-12 colxs-12 img-section">
                    <svg preserveAspectRatio="xMidYMid meet" data-bbox="17 38.8 166.1 122.7" viewBox="17 38.8 166.1 122.7" height="150" width="150" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid-gvyzjwad96l4"><defs><style>#comp-koueceuz svg [data-color="1"] {fill: #58C763;}</style></defs><title id="svgcid-gvyzjwad96l4"></title>
                        <g>
                        <path d="M130.2 69.6c-.7.9-.7 2.5.2 3.1l30.7 24c.4.4.9.4 1.4.4.7 0 1.4-.2 1.9-.9.7-.9.7-2.5-.2-3.1l-30.7-23.9c-1-.6-2.7-.6-3.3.4z" fill="#92EA59" data-color="1"></path>
                    <path d="M151.8 101.7c.7 0 1.4-.2 1.9-.9.7-.9.7-2.5-.2-3.1l-18-14.1c-.9-.6-2.6-.6-3.2.2s-.7 2.5.2 3.1l18 14.1c.1.5.9.7 1.3.7z" fill="#92EA59" data-color="1"></path>
                <path d="M116.4 54.2l6.8-6.7c.7-.6 1.9-.9 2.8 0l41.4 32.3c.4.4.9.4 1.4.4.7 0 1.4-.2 1.9-.9.7-.9.7-2.5-.2-3.1l-32.9-25.4 3.4-4c2.1-2.7 5.3-4 8.9-4 2.6 0 4.9.6 6.8 2.3l12.5 9.4c2.3 1.8 3.4 4.5 3.4 7.2 0 2-.7 4-1.9 5.6-.7 1.1-.4 2.5.4 3.1.4.2.9.4 1.4.4.7 0 1.4-.2 1.9-.9 1.9-2.5 2.8-5.2 2.8-8.1 0-4.3-1.9-8.1-5.6-10.8l-12.1-9.1c-2.8-2-6.1-3.1-9.5-3.1-4.9 0-9.5 2.3-12.3 5.8l-3.4 4-4.9-3.8c-2.6-2.3-6.8-2.3-9.3.2l-6.8 6.7c-.9.9-.9 2.3 0 3.1.8.7 2.2.3 3.1-.6z" fill="#92EA59" data-color="1"></path>
            <path d="M71.9 100.3c.9.4 1.9.6 3 .6.4 0 .9 0 1.4-.2l22.9-5.8c1.9-.2 3.2-1.8 3.2-3.6 0-.9-.4-1.8-.9-2.5l-7.9-9.4c-.2-.2-.2-.6-.2-.9 0-.4.2-1.1.7-1.6L108.5 62c.9-.9.9-2.3 0-3.1s-2.3-.9-3.2 0L90.6 74.2c-1.4 1.1-2.1 2.9-2.1 4.7 0 1.1.2 2.5.9 3.3 0 0 0 .2.2.2l7.2 8.7-21.6 5.6c-.4 0-.9 0-1.4-.2-1.1-.4-2.6 0-3 1.1-.5.9 0 2.3 1.1 2.7z" fill="#92EA59" data-color="1"></path>
        <path d="M112.9 109c-1.4-1.3-3.2-2-5.1-2h-.7l-29.8 1.8c-2.1.2-4 1.1-5.1 2.7l-6.5 8.3c-.9 1.1-2.1 1.8-3.4 2l-2.1.2c-.2 0-.4-.2-.4-.4l-4.2-28.4c0-.2.2-.4.4-.4l2.1-.2c1.4-.2 2.8.2 4.2 1.1.9.6 2.3.4 3.2-.4.7-.9.4-2.5-.4-3.1-2.1-1.6-4.9-2.3-7.4-1.8l-2.1.2c-2.6.4-4.4 2.5-4.4 5v.6l4.2 28.2c.4 2.7 3 4.7 5.8 4.3l1.9-.2c2.6-.4 4.9-1.6 6.5-3.6l6.5-8.3c.4-.4 1.1-.9 1.7-.9l29.8-1.8c.7 0 1.4.2 1.9.6l17.2 19.5c.4.4 1.1.6 1.9.6.4 0 1.1-.2 1.4-.4.9-.9 1.1-2.3.2-3.1L112.9 109z" fill="#92EA59" data-color="1"></path>
    <path d="M180.4 84.4l-1.1-.9c-.9-.6-2.6-.6-3.2.2-.7.9-.7 2.5.2 3.1l1.1.9c.4.4.7.9.7 1.3s-.2.9-.7 1.3l-14.2 15-4.4-3.6c-.9-.6-2.6-.6-3.2.2-.7.9-.7 2.5.2 3.1l4.2 3.3-23.1 24.4-.4.4c-1.1.6-1.7 2-.9 2.9.4.6 1.1 1.1 2.1 1.1.4 0 .7 0 1.1-.2.7-.2 1.1-.6 1.9-1.3l40.5-42.5c1.1-1.1 1.9-2.7 1.9-4.5-.5-1.3-1.2-2.8-2.7-4.2z" fill="#92EA59" data-color="1"></path>
<path d="M47.5 122.3h1.1c1.1-.2 2.1-1.3 2.1-2.5-.2-1.1-1.4-2-2.6-2l-1.1.2c-1.1.2-2.3.6-3.4 1.3-1.4.9-2.1 2.9-2.1 5.8 0 1.1 0 2.3.2 3.3.2 2 .9 4.5 2.1 7.2.4.9 1.1 1.3 2.1 1.3.2 0 .4 0 .9-.2 1.1-.4 1.9-1.8 1.4-2.9-.9-2.3-1.7-4.5-1.9-6-.2-.9-.2-2-.2-2.7 0-1.3.2-2.3.2-2.5.5-.1.8-.1 1.2-.3z" fill="#92EA59" data-color="1"></path>
<path d="M53.1 143.6c-.7-1.1-2.1-1.3-3.2-.6-1.1.6-1.4 2-.7 3.1.4.6.7 1.1.9 1.6.4.6 1.1.9 1.9.9.4 0 .9-.2 1.4-.4 1.1-.6 1.4-2 .7-3.1-.4-.4-.6-.8-1-1.5z" fill="#92EA59" data-color="1"></path>
<path d="M26.8 107.8c.7 0 1.1-.2 1.7-.6.9-1.1 2.1-2 3.2-2.7 3.4-2.5 7.4-4 11.7-4.7 1.1-.2 2.1-1.3 1.9-2.5-.2-1.1-1.4-2-2.6-1.8-4.9.6-9.5 2.7-13.5 5.6-1.4.9-2.8 2-4 3.3-.9.9-.7 2.3.2 3.1.3 0 .9.3 1.4.3z" fill="#92EA59" data-color="1"></path>
<path d="M22.6 132.4c0-.4-.2-.9-.2-1.3-.2-2-.4-4-.4-5.8 0-3.3.4-6.5 1.4-9.4.4-1.1-.2-2.5-1.7-2.7-1.1-.4-2.6.2-3 1.6-1.1 3.3-1.7 6.9-1.7 10.8 0 2 .2 4.3.4 6.5 0 .4.2 1.1.2 1.6.2 1.1 1.1 1.8 2.3 1.8h.4c1.6-.7 2.5-2 2.3-3.1z" fill="#92EA59" data-color="1"></path>
<path d="M25.7 142.6c-.4-1.1-1.9-1.8-3-1.3-1.1.4-1.9 1.8-1.4 2.9 3.4 8.3 7.9 15 8.9 16.4.4.6 1.1.9 1.9.9.4 0 .9-.2 1.4-.4 1.1-.6 1.4-2 .7-3.1-.7-.8-5.3-7.3-8.5-15.4z" fill="#92EA59" data-color="1"></path>
<path d="M38.9 113.6c.4-.4.9-.6 1.4-.9 1.1-.6 1.4-2 .9-3.1-.7-1.1-2.1-1.3-3.2-.9-.7.4-1.4.9-1.9 1.3-4.7 3.3-6.8 8.3-6.8 15.2v.6c0 1.1 1.1 2.3 2.3 2.3 1.4 0 2.3-1.1 2.3-2.3v-.6c.1-5.4 1.7-9.2 5-11.6z" fill="#92EA59" data-color="1"></path>
<path d="M36.1 136.2c-.4-1.1-1.7-1.8-3-1.3-1.1.4-1.9 1.6-1.4 2.9 3 8.7 8.4 16.1 8.7 16.6.4.6 1.1.9 1.9.9.4 0 .9-.2 1.4-.4 1.1-.6 1.4-2 .7-3.1-.4-.4-5.5-7.5-8.3-15.6z" fill="#92EA59" data-color="1"></path>
</g>
</svg>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-title">
<span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;">{{$setting['mission_stat_3rd_heading'] ?? ''}}</span>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-description">
<p>{{$setting['mission_stat_3rd_description'] ?? ''}}</p>
</div>
</div>
</div>
</div>
<div class="row text-center">
<div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
<div class="row img-part">
<div class="col-md-12 col-sm-12 colxs-12 img-section">
<svg preserveAspectRatio="xMidYMid meet" data-bbox="10 10 180 180" viewBox="10 10 180 180"  height="120" width="120"  xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid--kkuyl5tlxwr"><defs><style>#comp-koueeho8 svg [data-color="1"] {fill: #FF8C62;}</style></defs><title id="svgcid--kkuyl5tlxwr"></title>
<g>
<path d="M91.4 51.9c-9.7 1.7-18.4 7.6-25.1 13H81c2.8-2.7 6.3-9.3 10.4-13z" fill="#FF8C62" data-color="1"></path>
<path d="M78 70.3H61.4c-5.7 9-9.2 16.2-9.5 27h19.9c.1-10.8 2.4-18 6.2-27z" fill="#FF8C62" data-color="1"></path>
<path d="M71.7 101.8H51.9c.6 9.9 3.5 16.2 7.9 23.4H77c-3-7.2-4.8-13.5-5.3-23.4z" fill="#FF8C62" data-color="1"></path>
<path d="M116.5 125.2c3.3-7.2 5.4-13.5 5.8-23.4h-45c.4 9.9 2.5 16.2 5.8 23.4h33.4z" fill="#FF8C62" data-color="1"></path>
<path d="M133.4 64.9c-6.8-5.4-15.5-11.2-25.1-13 4.1 3.8 7.6 10.3 10.4 13h14.7z" fill="#FF8C62" data-color="1"></path>
<path d="M115.4 70.3H84.2c-4.2 9-6.7 16.2-6.9 27h45.1c-.3-10.8-2.8-18-7-27z" fill="#FF8C62" data-color="1"></path>
<path d="M112.1 64.9c-3.4-5.4-7.6-9.4-12.3-12.8-4.7 3.4-8.9 7.4-12.2 12.8h24.5z" fill="#FF8C62" data-color="1"></path>
<path d="M127.9 97.3h19.9c-.4-10.8-3.9-18-9.5-27h-16.7c3.8 9 6 16.2 6.3 27z" fill="#FF8C62" data-color="1"></path>
<path d="M100 10c-49.7 0-90 40.2-90 90 0 49.7 40.3 90 90 90s90-40.3 90-90c0-49.8-40.2-90-90-90zm-.2 142.5c-29.5 0-53.5-24-53.5-53.6s24-53.5 53.5-53.5 53.5 24 53.5 53.5-24.1 53.6-53.5 53.6z" fill="#FF8C62" data-color="1"></path>
<path d="M79.8 130.6H64.3c7 8.1 16.4 13.1 27.1 15-4.7-4.3-8.6-10.5-11.6-15z" fill="#FF8C62" data-color="1"></path>
<path d="M122.5 125.2h17.2c4.5-7.2 7.3-13.5 7.9-23.4h-19.8c-.4 9.9-2.2 16.2-5.3 23.4z" fill="#FF8C62" data-color="1"></path>
<path d="M86.1 130.6c3.6 7.2 8.2 11 13.7 14.9 5.4-4 10-7.6 13.7-14.9H86.1z" fill="#FF8C62" data-color="1"></path>
<path d="M108.3 145.6c10.6-1.9 20.1-6.9 27.1-15h-15.5c-3.2 4.5-7 10.7-11.6 15z" fill="#FF8C62" data-color="1"></path>
</g>
</svg>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-title">
<span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;">{{$setting['mission_stat_4th_heading'] ?? ''}}</span>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-description">
<p>{{$setting['mission_stat_4th_description'] ?? ''}}</p>
</div>
</div>
</div>
<div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
<div class="row img-part">
<div class="col-md-12 col-sm-12 colxs-12 img-section">
<svg preserveAspectRatio="xMidYMid meet" data-bbox="45 30.967 110 138.037" viewBox="45 30.967 110 138.037" height="110" width="110" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img"><defs><style>#comp-koueendj svg [data-color="1"] {fill: #008AFC;}</style></defs>
<g>
<path d="M116.9 41.2c.6-.1 1.1-.2 1.7-.3l-15.8-9.4c-1.5-.8-3.4-.7-4.8.3L69.1 53.9l47.8-12.7z" fill="#008AFC" data-color="1"></path>
<path d="M129.5 63l16.5 8.6v-6.1c0-2.3-1.2-4.5-3.3-5.7l-19.2-11.4c-1.1-.6-3.2-1.3-4.4-1L59.7 62.3c-2.5.7-4.2 2.9-4.2 5.5v8.1L121.4 62c2.7-.8 5.6-.4 8.1 1z" fill="#008AFC" data-color="1"></path>
<path d="M155 86.4c0-2.3-1.3-4.5-3.4-5.6L126.8 68h-.1c-1.2-.7-2.6-.9-3.9-.5L50.7 82.6c-.1 0-.2 0-.3.1-3.2.8-5.4 3.6-5.4 6.8v75c0 2.5 2.1 4.6 4.6 4.5l70.9-.3c.5 0 .9-.4.9-.9V78.6c0-1.5 1.2-2.9 2.8-2.9 1.6 0 2.9 1.2 2.9 2.8v89.4c0 .5.4.8.8.8l21.6-.2c3 0 5.5-2.5 5.5-5.4V86.4zm-96.4 38.2c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm0-20.8c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm13.2 17.5c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm0-20.7c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zM85 118.4c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm0-20.7c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm13.8 17.9c0 1.3-1.1 2.4-2.4 2.4s-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8zm0-20.7c0 1.3-1.1 2.4-2.4 2.4S94 96.2 94 94.9v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8zm13.8 17.4c0 1.3-1.1 2.4-2.4 2.4s-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8zm0-20.7c0 1.3-1.1 2.4-2.4 2.4s-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8zm26 21.2c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm0-20.2c0 1.3-1.1 2.4-2.4 2.4-1.3 0-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4 1.3 0 2.4 1.1 2.4 2.4v8zm11.4 24.9c0 1.3-1.1 2.4-2.4 2.4s-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8zm0-20.2c0 1.3-1.1 2.4-2.4 2.4s-2.4-1.1-2.4-2.4v-8c0-1.3 1.1-2.4 2.4-2.4s2.4 1.1 2.4 2.4v8z" fill="#008AFC" data-color="1"></path>
</g>
</svg>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-title">
<span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;">{{$setting['mission_stat_5th_heading'] ?? ''}}</span>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-description">
<p>{{$setting['mission_stat_5th_description'] ?? ''}}</p>
</div>
</div>
</div>
<div class="col-md-4 col-sm-4 col-xs-12 image-main-section">
<div class="row img-part">
<div class="col-md-12 col-sm-12 colxs-12 img-section">
<svg preserveAspectRatio="xMidYMid meet" data-bbox="24.38 32.417 129.752 139.585" viewBox="24.38 32.417 129.752 139.585" height="130" width="130" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img" aria-labelledby="svgcid--qjm78y-l0lwct"><defs><style>#comp-koueeru1 svg [data-color="1"] {fill: #558A83;}</style></defs><title id="svgcid--qjm78y-l0lwct"></title>
<g>
<path d="M78.529 40.498c.067.073.137.143.21.21a3.466 3.466 0 0 0-.21.21 3.466 3.466 0 0 0-.21-.21 4.16 4.16 0 0 0 .21-.21m0-8.081l-2.932 5.36-5.36 2.932 5.36 2.932L78.529 49l2.932-5.36 5.36-2.932-5.36-2.932-2.932-5.359z" fill="#558A83" data-color="1"></path>
<path d="M57.529 62.498c.067.073.137.143.21.21a3.466 3.466 0 0 0-.21.21 3.466 3.466 0 0 0-.21-.21 4.16 4.16 0 0 0 .21-.21m0-8.081l-2.932 5.36-5.36 2.932 5.36 2.932L57.529 71l2.932-5.36 5.36-2.932-5.36-2.932-2.932-5.359z" fill="#558A83" data-color="1"></path>
<path d="M135.555 80.939a2.506 2.506 0 0 0-.423-.659c-7.076-10.601-19.119-17.613-32.778-17.68-.03 0-.059-.005-.089-.005l-.033.002-.073-.002c-13.741 0-25.866 7.034-32.975 17.688-.17.196-.317.412-.42.654a39.353 39.353 0 0 0-6.208 20.637c-.055.206-.093.418-.093.641s.039.435.093.641c.066 4.091.77 8.025 1.991 11.727l1.29-1.106 3.205-1.221a34.486 34.486 0 0 1-1.401-7.541h15.222c.013.758.056 1.497.09 2.242l1.246-.475h3.749c-.029-.589-.072-1.18-.085-1.767h11.799v5.853l5 1.842v-7.695h12.433a68.004 68.004 0 0 1-1.715 13.718h-6.032l.207.289 10.206 4.711h9.726a35.034 35.034 0 0 1-4.813 5.04l.618.741h5.246l1.449-.966c6.092-6.966 9.794-16.072 9.794-26.033a39.388 39.388 0 0 0-6.226-21.276zM82.928 99.715H67.64a34.396 34.396 0 0 1 4.842-15.305h12.649c-1.21 4.831-1.964 10.072-2.203 15.305zm3.673-20.305H76.145A34.699 34.699 0 0 1 91.57 69.258c-1.969 2.763-3.635 6.244-4.969 10.152zm13.058 20.305H87.926c.251-5.65 1.081-10.83 2.295-15.305h9.438v15.305zm0-20.305h-7.812c2.161-5.622 4.963-9.564 7.812-11.099V79.41zm5-11.205c2.96 1.453 5.931 5.465 8.229 11.206h-8.229V68.205zm0 31.51V84.41h9.927c1.282 4.497 2.166 9.685 2.435 15.305h-12.362zm8.465-30.33a34.705 34.705 0 0 1 15.049 10.025h-10.01c-1.369-3.852-3.064-7.283-5.039-10.025zm6.575 15.025h12.138a34.38 34.38 0 0 1 4.842 15.305H122.02c-.254-5.241-1.056-10.48-2.321-15.305zm13.034 34.023h-12.139c.893-4.218 1.414-8.841 1.498-13.718h14.587a34.368 34.368 0 0 1-3.946 13.718z" fill="#558A83" data-color="1"></path>
<path d="M153.988 135.117c-.646-2.905-3.201-4.527-3.49-4.703l-.178-.098c-8.274-4.137-15.115.614-18.281 4.476l-7.087-.238c-1.25-5.128-10.352-8.86-16.682-10.867l-2.615-5.229a2.995 2.995 0 0 0-1.341-1.341c-.398-.199-9.812-4.897-14.74-6.54-5.53-1.842-19.013 4.539-23.014 6.54-.161.08-.314.175-.458.283l-5.784 4.337-32.385 5.191a2.968 2.968 0 0 0-1.384.625 2.496 2.496 0 0 0-.377 4.869c2.004.601 7.82 3.045 8.246 6.282.106.811-.415 1.95-.966 3.156-1.04 2.272-2.462 5.384-.678 8.954 1.452 2.905 3.735 4.41 5.57 5.619.982.647 1.831 1.207 2.373 1.844 1.344 1.58.643 3.93-.413 6.839-.746 2.054-1.39 3.829-.44 5.436.355.6.922.995 1.548 1.151.354.183.742.299 1.144.299.357 0 .719-.077 1.063-.238 6.378-3.001 12.927-6.872 19.259-10.614 5.933-3.506 12.059-7.126 17.952-9.969 1.604.521 3.121 1.012 4.58 1.483 7.517 2.431 13.454 4.351 21.834 7.398 2.721.989 8.256.585 8.949.453 16.937-3.226 27.079-11.932 33.139-17.134 1.162-.997 2.164-1.857 2.955-2.444l.589-.62c1.406-2.108 1.381-3.991 1.112-5.2zm-5.084 2.109c-.833.647-1.77 1.451-2.829 2.36-5.682 4.877-15.191 13.04-30.788 16.011-.955.145-5.087.218-6.334-.235-8.464-3.078-14.439-5.01-22.004-7.457-1.741-.563-3.564-1.153-5.52-1.79l-1.838.115c-6.377 3.001-12.925 6.871-19.256 10.613-4.872 2.879-9.873 5.829-14.769 8.369.957-2.935 1.745-6.903-1.039-10.176-1.003-1.18-2.237-1.993-3.43-2.779-1.608-1.06-2.998-1.976-3.85-3.681-.682-1.363-.185-2.588.752-4.638.783-1.711 1.67-3.651 1.376-5.887-.344-2.617-1.919-4.686-3.814-6.27L62 127.544c.48-.077.936-.27 1.325-.562l6.159-4.619c7.833-3.888 16.297-6.727 18.193-6.094 3.698 1.232 10.61 4.57 13.063 5.773l2.737 5.475a3.001 3.001 0 0 0 1.821 1.532c7.116 2.135 13.084 5.332 13.804 6.828.004.707.037 1.412.071 2.099.048.98.119 2.42-.042 2.986-.274.063-1.066.157-2.817-.193-7.48-1.496-19.847-7.65-19.971-7.712a3 3 0 0 0-2.683 5.366c.536.268 13.208 6.575 21.477 8.229.966.193 2.112.373 3.286.373 1.639 0 3.334-.351 4.675-1.505 1.822-1.57 2.141-3.775 2.131-5.955l7.948.267 2.159-1.104c.532-.784 5.385-7.523 12.63-4 .25.178.993.801 1.142 1.472.026.121.099.45-.204 1.026z" fill="#558A83" data-color="1"></path>
</g>
</svg>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-title">
<span style="font-family:poppins-semibold,poppins,sans-serif;font-weight:bold;font-size:30px;">{{$setting['mission_stat_6th_heading'] ?? ''}}</span>
</div>
<div class="col-md-12 col-sm-12 col-xs-12 image-description">
<p>{{$setting['mission_stat_6th_description'] ?? ''}}</p>
</div>
</div>
</div>
</div>
</div>
<div class="banner-bottom2  text-center py-4">
<div class="inner">
<p><svg preserveAspectRatio="xMidYMid meet" data-bbox="40.792 40.117 118.416 119.766" viewBox="40.792 40.117 118.416 119.766" height="50" width="50" xmlns="http://www.w3.org/2000/svg" data-type="color" role="img"><defs><style>#comp-koufgdbg svg [data-color="1"] {fill: #FF0000;}
#comp-koufgdbg svg [data-color="2"] {fill: #FF0000;}</style></defs>
<g>
<path d="M159.201 102.479a2.225 2.225 0 0 0-1.111-1.76l-6.099-3.495c.813-2.654 3.333-10.666 5.075-16.187a2.22 2.22 0 0 0-2.548-2.849c-5.163 1.014-12.575 2.469-14.978 2.935l-4.457-7.899a2.22 2.22 0 0 0-1.719-1.12 2.22 2.22 0 0 0-1.903.763L119.564 86.71c.996-4.431 4.455-19.598 6.859-30.111a2.221 2.221 0 0 0-3.24-2.441c-3.317 1.829-8.329 4.578-10.655 5.823l-10.601-18.736a2.223 2.223 0 0 0-1.935-1.128h-.001a2.225 2.225 0 0 0-1.935 1.131L87.489 59.981c-2.325-1.243-7.347-3.995-10.666-5.824a2.224 2.224 0 0 0-3.239 2.441l6.889 30.131L68.54 72.865a2.225 2.225 0 0 0-3.621.358l-4.451 7.894c-2.431-.471-9.828-1.92-14.981-2.932a2.222 2.222 0 0 0-2.548 2.851c1.745 5.517 4.266 13.521 5.083 16.181l-6.111 3.5a2.226 2.226 0 0 0-1.113 1.76c-.055.735.256 1.45.833 1.909l28.366 22.553c-.488 1.973-1.92 7.567-2.854 11.194a2.22 2.22 0 0 0 2.61 2.729l28.023-5.897v22.695a2.223 2.223 0 0 0 4.446 0v-22.696l28.033 5.897a2.218 2.218 0 0 0 2.065-.64 2.224 2.224 0 0 0 .544-2.093c-.939-3.618-2.379-9.197-2.872-11.181l28.375-22.562a2.218 2.218 0 0 0 .834-1.906z" fill="#FF0000" data-color="1"></path>
<path d="M126.686 123.898a2.197 2.197 0 0 0-.23.212 3.705 3.705 0 0 0-1.037 2.551c0 .334 0 .448 2.243 9.114l-25.439-5.352v-6.473l34.237-23.786a2.223 2.223 0 0 0-2.535-3.651l-31.702 22.024V70.982a2.223 2.223 0 0 0-4.446 0v9.797l-3.23-2.826a2.224 2.224 0 0 0-3.136.209 2.22 2.22 0 0 0 .21 3.136l6.156 5.386v31.853l-13.057-9.071a2.224 2.224 0 0 0-2.535 3.651l15.592 10.832v6.474l-25.436 5.352c2.227-8.668 2.227-8.783 2.227-9.115 0-.972-.372-1.887-1.048-2.578a2.393 2.393 0 0 0-.205-.185l-26.35-20.951 3.846-2.203a3.73 3.73 0 0 0 1.849-3.197c0-.437 0-.501-4.353-14.277 12.306 2.414 12.326 2.414 12.585 2.414 1.069 0 2.103-.501 2.836-1.375.088-.106.166-.219.234-.338l3.273-5.806L77.79 90.425c.052.06.107.117.165.171a4.344 4.344 0 0 0 2.94 1.169 4.229 4.229 0 0 0 4.221-4.225c0-.213 0-.589-.136-1.04l-5.957-26.057c8.067 4.438 8.166 4.438 8.824 4.438 1.117 0 2.179-.575 2.839-1.54a2.51 2.51 0 0 0 .103-.164l9.206-16.321 9.265 16.373a3.418 3.418 0 0 0 2.916 1.652c.66 0 .75-.001 8.808-4.437-6.102 26.694-6.102 26.769-6.102 27.097a4.233 4.233 0 0 0 4.231 4.225c1.048 0 2.046-.383 2.885-1.108.084-.072.161-.15.233-.234l10.534-12.259 3.275 5.805c.08.14.174.271.281.391.978 1.093 2.074 1.322 2.82 1.322.252 0 .272 0 12.556-2.414-4.344 13.776-4.344 13.84-4.344 14.277a3.72 3.72 0 0 0 1.858 3.207l3.825 2.192-26.35 20.953z" fill="#FF0000" data-color="2"></path>
</g>
</svg></p>
<p  style="font-size:15px; line-height:1.2em; text-align:center;font-size:15px;font-weight:bold;color:#696969;">VISION STATEMENT</p>
<h2 class="mb-0">{{$setting['vision_statemtnt_heading'] ?? ''}}</h2>
</div>
</div>
<div class="banner-bottom3  py-4 px-0"  style="background:#dcf2fa url({{ asset('front/assets') }}/templates-assets/header/img/hbg.jpg) no-repeat 50% center;background-size: cover;">

    <div class="container">
        <div class="row">
            <div class="col-lg-6">

                <div class=" card-site p-3 rounded">
                    
                    <div class="media">
                        <i class="fas fa-users fa-5x m-auto"></i>
                      <div class="media-body ml-3 m-auto pl-3" style="min-height:130px">
                        <div style="display: flex;"><h1 class="timer count-title count-number mt-3" data-to="{{$setting['statement_users_count'] ?? ''}}" data-speed="6000" style="color:#008AFC">{{$setting['statement_users_count']}} </h1><span class="text-dark" style="font-size: 35px; margin: 13px;">million</span>
                        </div>
                        
                        <h6>{{$setting['statement_users'] ?? ''}}</h6>
                      </div>
                    </div>

                </div>

            </div>
            <div class="col-lg-6">
                <div class="card-site p-3 rounded">
                    <div class="media">
                        <i class="fas fa-flag fa-5x m-auto"></i>
                      <div class="media-body ml-3 m-auto pl-3" style="min-height: 130px;">
                        <div style="display: flex;">
                                <h1 class="timer count-title count-number mt-3" data-to="{{ $setting['statement_countries_count'] ??''}}" data-speed="6000" style="color:#008AFC"> {{$setting['statement_countries_count']}} </h1><span class="text-dark" style="font-size: 35px; margin: 13px;">countries</span>
                             
                        </div>
                       
                        {{$setting['statement_countries'] ?? ''}}
                      </div>
                    </div>    
                </div>
                
            </div>
            
        </div>
    </div>


</div>
<br><br>
<div class="banner-bottom5  text-center d-none">
<div class="inner">
</div>
</div>
</div>
</section>

@include('front.components.work_with_us')

@endsection
@section('js')

    <script>

        (function ($) {
    $.fn.countTo = function (options) {
        options = options || {};
        
        return $(this).each(function () {
            // set options for current element
            var settings = $.extend({}, $.fn.countTo.defaults, {
                from:            $(this).data('from'),
                to:              $(this).data('to'),
                speed:           $(this).data('speed'),
                refreshInterval: $(this).data('refresh-interval'),
                decimals:        $(this).data('decimals')
            }, options);
            
            // how many times to update the value, and how much to increment the value on each update
            var loops = Math.ceil(settings.speed / settings.refreshInterval),
                increment = (settings.to - settings.from) / loops;
            
            // references & variables that will change with each update
            var self = this,
                $self = $(this),
                loopCount = 0,
                value = settings.from,
                data = $self.data('countTo') || {};
            
            $self.data('countTo', data);
            
            // if an existing interval can be found, clear it first
            if (data.interval) {
                clearInterval(data.interval);
            }
            data.interval = setInterval(updateTimer, settings.refreshInterval);
            
            // initialize the element with the starting value
            render(value);
            
            function updateTimer() {
                value += increment;
                loopCount++;
                
                render(value);
                
                if (typeof(settings.onUpdate) == 'function') {
                    settings.onUpdate.call(self, value);
                }
                
                if (loopCount >= loops) {
                    // remove the interval
                    $self.removeData('countTo');
                    clearInterval(data.interval);
                    value = settings.to;
                    
                    if (typeof(settings.onComplete) == 'function') {
                        settings.onComplete.call(self, value);
                    }
                }
            }
            
            function render(value) {
                var formattedValue = settings.formatter.call(self, value, settings);
                $self.html(formattedValue);
            }
        });
    };
    
    $.fn.countTo.defaults = {
        from: 0,               // the number the element should start at
        to: 0,                 // the number the element should end at
        speed: 1000,           // how long it should take to count between the target numbers
        refreshInterval: 100,  // how often the element should be updated
        decimals: 0,           // the number of decimal places to show
        formatter: formatter,  // handler for formatting the value before rendering
        onUpdate: null,        // callback method for every time the element is updated
        onComplete: null       // callback method for when the element finishes updating
    };
    
    function formatter(value, settings) {
        return value.toFixed(settings.decimals);
    }
}(jQuery));

jQuery(function ($) {
  // custom formatting example
  $('.count-number').data('countToOptions', {
    formatter: function (value, options) {
      return value.toFixed(options.decimals).replace(/\B(?=(?:\d{3})+(?!\d))/g, ',');
    }
  });
  
  // start all the timers
  $('.timer').each(count);  
  
  function count(options) {
    var $this = $(this);

    options = $.extend({}, options || {}, $this.data('countToOptions') || {});
    $this.countTo(options);
  }
});
    </script>
@endsection