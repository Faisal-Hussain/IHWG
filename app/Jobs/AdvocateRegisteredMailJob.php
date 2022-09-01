<?php

namespace App\Jobs;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use App\Jobs\AdvocateRegisteredMailJob;
use Illuminate\Queue\SerializesModels;
use Mail;
use App\Models\Setting;


class AdvocateRegisteredMailJob implements ShouldQueue
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


        \Log::info('Mail job processing');

        Mail::send('email.advocate.registered_advocate', get_defined_vars(), function ($message) use($data) {
            $message->to($this->data['email'], $this->data['app_name']);
            $message->subject($this->data['subject']);
        });

        \Log::info('Mail job processed');


    }
}
