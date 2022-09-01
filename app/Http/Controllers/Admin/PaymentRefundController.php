<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceBooking;
use GuzzleHttp\Exception\GuzzleException;
use GuzzleHttp\Exception\ClientException;
use GuzzleHttp\Pool;
use GuzzleHttp\Client;
use App\Traits\PaymentMethod;
use Crypt;



class PaymentRefundController extends Controller
{

	 public function __construct()
    {
        $this->key = 'QVlFNjctOEo5andZakFSbzBBM2hVY2JoNFJ1X2drU3BfbDB2cVNnRFJtVmgteWxIbnJyNWJQR3pDTnB2SU9PX0NQOU1vRXBxM2U3TzEzaVo6RU12LW13WGdoRFVPNHJZZEhqRFVVQldIMlFFMUpkcDh5VEZxM2RWa0pMMzZFUzM2Vlo0cUZmQmo4SVA3VkhBOTFJN2ZhdlpaRmRoUjg3R08=';
       

        $this->header = [
            'Authorization' => 'Basic '.$this->key,
        ];
    }
    public function index()
	{
            
		$data=ServiceBooking::with('HomeopathService','user')->orderBy('created_at','desc')->get();
		return view('admin.payment_refund.index',get_defined_vars());
	}
    public function refund(Request $req)
    {
    	$service_booking=ServiceBooking::where('id',decrypt($req->id))->first();

    	if ($req->payment_method=='stripe') {
    		$response=$this->stripRefund($req->transaction_id,$req->amount);
    		
    	}elseif ($req->payment_method=='paypal') {
    		$response=$this->PaypalRefund($req->transaction_id,$req->amount);
    	}else{
			return redirect()->back()->with('error','Some thing went wrong. we think that you have choose pay-later method');
    	}

    	if ($response->status=='succeeded' || $response->status=='COMPLETED') {
    		$service_booking=ServiceBooking::where('id',decrypt($req->id))->first();
    		$service_booking->status='refund';
    		$service_booking->save();

    		 sendMail([
               
                'view' => 'email.admin.payment_refund_email',
                'to' => $service_booking->user->email,
                'name' => $service_booking->user->name,
                'subject' =>'Refund Payment',
                'data' => [
                    'name'=> '',
                    'email'=> '',
                    'subject'=>'Refund Payment',
                    'message'=>'',
                ]
            ]);

    	}

    	return redirect()->back()->with('message','Payment has been refunded');

    	
    }


    public function PaypalRefund($t_id,$amount)
    {
    	
    	try {
    		$url = "https://api-m.sandbox.paypal.com/v2/payments/captures/".$t_id."/refund";

		        $client = new Client();
		        
		        $response = $client->request('POST', $url, [
		            'headers' => [
		                'Accept' => 'application/json',
		                'Content-Type' => 'application/json',
		                'Authorization' => 'Basic '.$this->key
		            ],
		            'json' => [
		                "amount"=> [
		                       "value"=>$amount-1,
					   			"currency_code"=> "USD",

		                    ]

		                ]

		            ]
		        );
		        return json_decode($response->getBody()->getContents());
    		
    	} catch (Exception $e) {
    		return	$e->getMessage();
    		
    	}
    }
    public function stripRefund($t_id,$amount)
    {
    	try {
    		\Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

	    	$res = \Stripe\Refund::create(['payment_intent' =>$t_id, 'amount' => ($amount-1)*100]);

	    	return $res;
    		
    	} catch (Exception $e) {
    		return	$e->getMessage();
    		
    	}

    }
}




 
