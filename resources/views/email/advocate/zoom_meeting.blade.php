
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet">
</head>

<style>

    .btn-success{
        background-color: #0aa93f;
        padding: 8px !important;
        border-color: 1px solid #0aa93f ;
        text-decoration: none;
        color: white;
    }
</style>

<body>

<div style="margin-top: 50px;">
    <table cellpadding="0" cellspacing="0" style="font-family: Nunito, sans-serif; font-size: 15px; font-weight: 400; max-width: 600px; border: none; margin: 0 auto; border-radius: 6px; overflow: hidden; background-color: #fff; box-shadow: 0 0 3px rgba(60, 72, 88, 0.15);">
        <thead>
        <tr style="background-color: #EF7F1A; padding: 3px 0; border: none; line-height: 68px; text-align: center; color: #fff; font-size: 24px; letter-spacing: 1px;">
            <th scope="col">{{ env('APP_NAME') }}</th>
        </tr>
        </thead>

        <tbody>
        <tr>
            <td style="padding: 48px 24px 0; color: #161c2d; font-size: 18px; font-weight: 600;">
                <h1>Hello,</h1>
            </td>
        </tr>
        <tr>
            <td style="padding: 15px 24px 15px; color: #8492a6;">

                <h2>
                    @if($data[0]['event_generater']->user->id==$data[0]['event']->user_id)
                        <h5>{{emailSetting('zoom_meeting_email')->dear??'Dear'}} {{$data[0]['event_generater']->user->name}}, {!! emailSetting('zoom_meeting_email')->first_part ?? '' !!} <span class="font-weight-bold" style="font-size: 14px">{{$data[0]['event_generater']->title}}</span></h5>
                        <p>{{$data[0]['start_url']}}</p>
                        <a href="{{$data[0]['start_url']}}" class="btn btn-success">Start Meeting</a>
                        <h5>{!! emailSetting('zoom_meeting_email')->second_part ??'' !!} </h5>
                    @else
                        <h5>{{emailSetting('zoom_meeting_email')->dear ??'Dear'}} {{$data[0]['event']->user->name??'member'}}, {!! emailSetting('zoom_meeting_email')->first_part??'' !!} <span class="font-weight-bold" style="font-size: 14px">{{$data[0]['event_generater']->title}}</span></h5>
                        <p>{{$data[0]['join_url']}}</p>
                        <a href="{{$data[0]['join_url']}}" class="btn btn-success">Join Meeting</a>
                        <h5>{!! emailSetting('zoom_meeting_email')->second_part??'' !!} </h5>
                    @endif
                </h2>

            </td>
        </tr>
                    @if(emailSetting('zoom_meeting_email')->image??'')
                        <tr>
                           <td style="padding: 15px 24px 15px; color: #8492a6;">
                                <img src="{{asset($setting->image??'')}}" alt="No Sign" class="w-50">
                            </td>             
                        </tr>
                    @endif

        <tr>
            <td style="padding: 15px 24px 15px; color: #8492a6;">
                {{emailSetting('zoom_meeting_email')->team ??'Team'}}
            </td>
        </tr>

        <tr>
            <td style="padding: 16px 8px; color: #8492a6; background-color: #f8f9fc; text-align: center;">
                © {{ now()->year }} {{ env('APP_NAME') }}.
</div>
<!-- Hero End -->
</body>
</html>
