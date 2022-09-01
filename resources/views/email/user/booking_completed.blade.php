
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
                            {{emailSetting('booking_completed_email')->hello??''}}
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 15px 24px 15px; color: #8492a6;">
                            {!! emailSetting('booking_completed_email')->first_part??'' !!}
                        </td>
                    </tr>


                    <tr>
                        <td style="padding: 15px 24px 15px; color: #8492a6;">
                            {{emailSetting('booking_completed_email')->second_part??''}}
                        </td>
                    </tr>

                    <tr style="text-align:center;">
                        <td style="padding: 15px 24px;">
                            <a href="{{ route('service.review') }}?u={{ $data['user_id'] ??''}}&p={{ $data['service_id']??'' }}"
                                style="padding: 8px 20px; outline: none; text-decoration: none; font-size: 16px; letter-spacing: 0.5px; transition: all 0.3s; font-weight: 600; border-radius: 6px; background-color: #2f55d4; border: 1px solid #2f55d4; color: #ffffff;">Rate a Feedback</a>
                        </td>
                    </tr>
                    @if(emailSetting('booking_completed_email')->image ??'')
                    <tr>
                       <td style="padding: 15px 24px 15px; color: #8492a6;">
                            <img src="{{asset($setting->image??'')}}" alt="No Sign" class="w-50">
                        </td>
                    </tr>
                    @endif


                    <tr>
                        <td style="padding: 15px 24px 15px; color: #8492a6;">
                            {{emailSetting('booking_completed_email')->team??''}}
                        </td>
                    </tr>

                    <tr>
                        <td style="padding: 16px 8px; color: #8492a6; background-color: #f8f9fc; text-align: center;">
                            © {{ now()->year }} {{ env('APP_NAME') }}.
        </div>
        <!-- Hero End -->
    </body>
</html>
