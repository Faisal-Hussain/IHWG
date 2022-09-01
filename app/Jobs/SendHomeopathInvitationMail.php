<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use App\Jobs\SendHomeopathInvitationMail;
use Mail;
use App\Models\Setting;

class SendHomeopathInvitationMail implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;



    protected $data;
    public $tries = 5;


    public function __construct($data)
    {
        $this->data = $data;
    }


    public function handle()
    {

        $data = $this->data;
        

        \Log::info('Invitation Mail job processing');

        Mail::send('email.user.send_invitation', get_defined_vars(), function ($message) use($data) {
            $message->to($this->data['email'], $this->data['app_name']);
            $message->subject($this->data['subject']);
        });

        \Log::info('Invitation Mail job processed');


    }

}
