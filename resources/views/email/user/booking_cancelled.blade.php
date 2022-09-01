
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Nunito:400,600,700&display=swap" rel="stylesheet">
    </head>


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
                            <h1>Your booking has been cancelled</h1>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 24px 0; color: #161c2d; font-size: 18px; font-weight: 600;">
                            <b>Dear {{$data['name']??''}}</b>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 24px 15px; color: #8492a6;">
                            <p>Your booking for service <b>{{$data['booking_title']}}</b> on the directory for </p>
                        </td>
                    </tr>

                    <tr>
                        <td style="padding: 5px 24px 15px; color: #8492a6;">
                            <b>Date:</b> {{$data['date']??''}} <b>Time:</b> {{$data['time_slot']}}
                        </td>
                    </tr>


                    <tr>
                        <td style="padding: 5px 24px 15px; color: #8492a6;">
                            <p>has been cancelled. We extend an apology for any inconvenience. </p>
                        </td>
                    </tr>
                    @if($data['note'])
                        <tr>
                            <td style="padding: 5px 24px 15px; color: #8492a6;">
                                <p><b>Here is a note attached to your cancellation:</b></p>
                                <p>{{$data['note']??''}}</p>
                            </td>
                        </tr>
                    @endif

                    @if(emailSetting('booking_completed_email')->image ??'')
                    <tr>
                       <td style="padding: 15px 24px 15px; color: #8492a6;">
                            <img src="{{asset($setting->image??'')}}" alt="No Sign" class="w-50">
                        </td>
                    </tr>
                    @endif

                    <tr>
                        <td style="padding: 16px 8px; color: #8492a6; background-color: #f8f9fc; text-align: center;">
                            © {{ now()->year }} {{ env('APP_NAME') }}.
        </div>
        <!-- Hero End -->
    </body>
</html>
