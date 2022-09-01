<?php

namespace App\Jobs;

use App\Mail\ZoomMeetingMail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;
use App\Models\Setting;

class SendZoomMeetingLinkJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;
    protected $data;
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
        

        \Log::info(' Start Zoom meeting link send Mail job processing');

        Mail::send('email.advocate.zoom_meeting', get_defined_vars(), function ($message) use($data) {
            $message->to($data[0]['event']->user->email,$data[0]['event']->user->name);
            $message->subject($data[0]['subject']??'Zoom Meeting Link Email');
        });

        \Log::info(' End Zoom meeting link send Mail job processed');
    }
}
