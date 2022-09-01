<?php

namespace App\Http\Controllers\Front\shop;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\PaymentMethod;
use Session;
use Cart;
use App\Models\ShopOrder;
use Auth;
use App\Models\ShopOrderProduct;
use App\Models\ShopProduct;

class CheckoutController extends Controller
{
    

    use PaymentMethod;


        public function makeCheckout(Request $req)
        {

            Session::put('shop_form', $req->all());

            if($req->payment_method == 'paypal')
            {

                $data = [
                    'price'             => Cart::instance('shopping')->total(),
                    'payer_email'       => Auth::user()->email,
                    'currency'          => 'USD',
                    'quantity'          => 1,
                    'description'       => 'Buy Products at IHWG',
                    'success_url'       => route('shop.payment.success'),
                    'cancel_url'        => route('shop.payment.success')
                ];
                

                return $this->makePaypalCheckout($data);
            }

            else
            {

                $response = $this->makeStripeCheckout([
                    'price'     => Cart::instance('shopping')->total(),
                    'intent_id' => Session::get('intent_id')
                ]);

                    if(isset($response->status) && $response->status == 'succeeded')
                    {
                        $this->completeOrderTransaction();
                        return redirect()->route('index')->withMessage('Your order has been received. Go to your dashboard for order status/info.');
                    }
                    else
                    {                    
                        $error = $response->getMessage();
                        return view('errors.payments_error', get_defined_vars());
                    }
                
            }
            
        }




    public function shopPaymentSuccess(Request $request)
    {   

        $response = $this->paypalPaymentSuceess($request->all());

        if ($response->getState() == 'approved') 
        {
            $this->completeOrderTransaction();
            return redirect()->route('index')->withMessage('Your order has been received. Go to your dashboard for order status/info.');
        }

        return redirect()->route('index')->withError('Payment failed! Try again later.');
    }








    public function intent(Request $request)
    {
        \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));

        header('Content-Type: application/json');

        # retrieve json from POST body
        $json_str = file_get_contents('php://input');
        $json_obj = json_decode($json_str);



        $intent = null;
        try {
            if (isset($json_obj->payment_method_id)) {
                # Create the PaymentIntent
                $amount = Cart::instance('shopping')->total() *100;
                
                    \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
                $intent = \Stripe\PaymentIntent::create([
                    'payment_method' => $json_obj->payment_method_id,
                    'amount' => $amount,
                    'currency' => 'USD',
                    'confirmation_method' => 'manual',
                    'capture_method' => 'manual',
                    'confirm' => true,
                    'description' => auth()->user()->email.' booked Service via Stripe',
                ]);
                

            }


            if (isset($json_obj->payment_intent_id)) {
                $intent = \Stripe\PaymentIntent::retrieve(
                    $json_obj->payment_intent_id
                );
                $intent->confirm();
            }
            $this->generateResponse($intent);
        } catch (\Stripe\Exception\ApiErrorException $e) {
            # Display error on client
            echo json_encode([
                'error' => $e->getMessage()
            ]);
        }


    }

    public function generateResponse($intent) 
    {


        if ($intent->status == 'requires_source_action' && $intent->next_action->type == 'use_stripe_sdk') 
        {   
            echo json_encode([
                'requires_source_action' => true,
                'payment_intent_client_secret' => $intent->client_secret
            ]);
        } 
        else if ($intent->status == 'requires_capture') 
        {
            # The payment didn’t need any additional actions and completed!
            # Handle post-payment fulfillment
            Session::put('intent_id',$intent->id);
            
            echo json_encode([
                "success" => true
            ]);
        } 
        else 
        {
            # Invalid status
            http_response_code(500);
            echo json_encode(['error' => 'Invalid PaymentIntent status']);
        }

    }






    public function completeOrderTransaction()
    {

        $order = ShopOrder::create([
            'user_id'     => Auth::id(),
            'name'        => Session::get('shop_form')['name'],  
            'email'       => Session::get('shop_form')['email'],  
            'address_1'   => Session::get('shop_form')['address_1'],  
            'address_2'   => Session::get('shop_form')['address_2'],  
            'country'     => Session::get('shop_form')['country'],  
            'state'       => Session::get('shop_form')['state'],  
            'city'        => Session::get('shop_form')['city'],  
            'zip'         => Session::get('shop_form')['zip'],  
            'phone'       => Session::get('shop_form')['phone']
        ]);


        foreach(Cart::instance('shopping')->content() as $item)
        {

            $product = ShopProduct::whereUuid($item->id)->first();

            ShopOrderProduct::create([
                'shop_order_id'     => $order->id,
                'shop_product_id'   => $product->id,
                'quantity'          => $item->qty,
                'price'             => $item->price
            ]);

        }

        Cart::instance('shopping')->destroy();


    }







}
