<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Jobs\UserServiceBookingCompleted;
use Mail;
use App\Models\Setting;


class UserServiceBookingCompleted implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;


    protected $data;
    public $tries = 5;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct($data)
    {
        $this->data = $data;
    }

    /**
     * Execute the job.
     *
     * @return void
     */

    public function handle()
    {

        $data = $this->data;
        

        \Log::info('User Completed Mail job processing');

        Mail::send('email.user.booking_completed', get_defined_vars(), function ($message) use($data) {
            $message->to($this->data['email'], $this->data['app_name']);
            $message->subject($this->data['subject']);
        });

        \Log::info('User Completed Mail job processed');


    }
}
