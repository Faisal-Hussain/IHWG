<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;
use Carbon\Carbon;
use App\Models\ServiceBooking;

class Kernel extends ConsoleKernel
{
    /**
     * The Artisan commands provided by your application.
     *
     * @var array
     */
    protected $commands = [
        //
    ];

    /**
     * Define the application's command schedule.
     *
     * @param  \Illuminate\Console\Scheduling\Schedule  $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
        // $schedule->command('inspire')->hourly();
        
        $schedule->call(function(){

                 $service_bookings=ServiceBooking::all();
        $arr = array( );
        
        foreach ($service_bookings as $key => $value) {
            
            $today=Carbon::now();
            $start_date =Carbon::parse($today);
            $end_date =Carbon::parse($value->date.' '.$value->time_slot);
            $different_hours = $start_date->diffInHours($end_date);
            $arr[$key] =$different_hours;

            
            if ($different_hours<='24' && $value->email_alert=='0') {
               
                
                    sendMail([
                        'view' => 'email.service_booking_alert',
                        'to' => $value->user->email,
                        'name' => $value->user->name,
                        'subject' =>'Alert',
                        'data' => [
                        'service'=>$value->HomeopathService->title,
                        'user'=>$value->user->name,

                        ]
                    ]);
                $value->email_alert=1;
                $value->save();
            }
        
        }

            })->dailyAt('01:00');
    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}