<?php

namespace App\Traits;
use Session;
use Redirect;
use PayPal\Api\Amount;
use PayPal\Api\Details;
use PayPal\Api\Item;
use PayPal\Api\ItemList;
use PayPal\Api\Payer;
use PayPal\Api\Payment;
use PayPal\Api\RedirectUrls;
use PayPal\Api\ExecutePayment;
use PayPal\Api\PaymentExecution;
use PayPal\Api\Transaction;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;




trait PaymentMethod{
   
    protected $stripe;
    private $_api_context;

    public function __construct()
    {

        $this->stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));

        $paypal_configuration = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential($paypal_configuration['client_id'], $paypal_configuration['secret']));
        $this->_api_context->setConfig($paypal_configuration['settings']);
    
    }




    public function makePaypalCheckout($data)
    {


            $price       =  $data['price'];
            $email       =  $data['payer_email'];
            $success_url = $data['success_url'];
            $cancel_url  = $data['cancel_url'];
            $currency    = $data['currency'];
            $quantity    = $data['quantity'];
            $description = $data['description'];


            $payer = new Payer();
            $payer->setPaymentMethod('paypal');

            $item_1 = new Item();


            $item_1->setName($email)
                ->setCurrency($currency)
                ->setQuantity($quantity)
                ->setPrice($price);


            $item_list = new ItemList();
            $item_list->setItems(array($item_1));

            $amount = new Amount();
            $amount->setCurrency($currency)
                ->setTotal($price);

            $transaction = new Transaction();
            $transaction->setAmount($amount)
                ->setItemList($item_list)
                ->setDescription($description);


            $redirect_urls = new RedirectUrls();
            $redirect_urls->setReturnUrl($success_url)->setCancelUrl($cancel_url);


            $payment = new Payment();
            $payment->setIntent('Sale')
                ->setPayer($payer)
                ->setRedirectUrls($redirect_urls)
                ->setTransactions(array($transaction));
            try 
            {
                $payment->create($this->_api_context);
            } 
            catch (\PayPal\Exception\PPConnectionException $ex) 
            {
                if (\Config::get('app.debug')) {
                    return back()->with('error','Connection timeout');

                } else {

                    return back()->with('error','Some error occur, sorry for inconvenient');
                }
            }


               foreach($payment->getLinks() as $link) {
                    if($link->getRel() == 'approval_url') {
                        $redirect_url = $link->getHref();
                        break;
                    }
                }
                Session::put('paypal_payment_id', $payment->getId());
                Session::put('input_time_slot', $data['time_slot']??'');
                Session::put('meeting_handled_via', $data['meeting_handled_via']??'');

                if(isset($redirect_url)) 
                {
                    return Redirect::away($redirect_url);
                }
                return back()->with('error','Unknown error occurred');


    }



    public function paypalPaymentSuceess($request)
    {

        $payment_id = Session::get('paypal_payment_id');

        if ($request['PayerID'] == "" || $request['token'] == "" )  
        {
            return redirect()->route('index')->with('error','Payment Failed. Try again later.');
        }
        
        $payment = Payment::get($payment_id, $this->_api_context);
        $execution = new PaymentExecution();
        $execution->setPayerId($request['PayerID']);

        Session::forget('paypal_payment_id');

        return $result = $payment->execute($execution, $this->_api_context);
    }



    public function makeStripeCheckout($data)
    {

        try
        {
            $stripe = new \Stripe\StripeClient(env('STRIPE_SECRET'));
            return $response = $stripe->paymentIntents->capture($data['intent_id'], ['amount' => $data['price'] * 100]);    
        }

        catch (\Exception $e)
        {
            return $e;

        }

    }
   





}
