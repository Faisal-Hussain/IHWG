<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use URL;
use Session;
use Redirect;
use Input;
use Crypt;
use App\Models\HomeopathService;
use App\Models\HomeopathProfile;
use App\Models\ServiceBooking;
use Auth;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
use App\Jobs\UserServiceBookedMailJob;
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
use App\Traits\PaymentMethod;

class PaymentController extends Controller
{
    use PaymentMethod;


        public function makeCheckout(Request $req)
        {
            $req['service_id'] = Crypt::encryptString($req->service_id);

            Session::put('booking_form', $req->all());


            $service = HomeopathService::findOrFail(Crypt::decryptString($req->service_id));


            if($req->payment_method == 'pay-later')
            {

               
               $homeopath=HomeopathProfile::where('user_id',$service->user_id)->first();

               $data=getAllTimeSlots($req->time_slot,$service->duration??30);
               $data=json_encode($data);

                $booking = ServiceBooking::create([
                                'user_id'                 => Auth::id(),
                                'homeopath_id'             => $req->homeopath_id,
                                'uuid'                    => date('dmyhis'),
                                'homeopath_service_id'    => $service->id,
                                'date'                    => $req->date,
                                'time_slot'               => $data,
                                'illness'                 => $req->illness ?? NULL,
                                'allergies'               => $req->allergies ?? NULL,
                                'concern'                 => $req->concern ?? NULL,
                                'price'                   => $service->price,
                                'payment_method'          => 'pay-later',
                                'later_pay_method'          => $req->later_pay_method??'',
                                'meeting_handel_via'      => $req->meeting_handled_via??'',

                            ]);
                        $payment_status = true;


                        $data = [
                            'name'     => env('APP_NAME'),
                            'email'    => Auth::user()->email,
                            'app_name' => env('APP_NAME'),
                            'subject'  => 'Your booking has been done for service appointment',
                        ];

                        dispatch(new UserServiceBookedMailJob($data))->delay(now()->addSeconds(2));

                        return view('front.services.book_receipt', get_defined_vars());
            }







            if($req->payment_method == 'paypal')
            {

                $data = [
                    'time_slot'         =>$req->time_slot,
                    'meeting_handled_via'         =>$req->meeting_handled_via,
                    'price'             => serviceAmount($service->price,$service->homeopath->HomeopathProfile->location),
                    'payer_email'       => Auth::user()->email,
                    'currency'          => 'CAD',
                    'quantity'          => 1,
                    'description'       => 'Appointment Booking at IHWG',
                    'success_url'       => route('paypal.payment.success'),
                    'cancel_url'        => route('paypal.payment.success')
                ];

                return $this->makePaypalCheckout($data);
            }

            else
            {

                $response = $this->makeStripeCheckout([
                    'price'     => serviceAmount($service->price,$service->homeopath->HomeopathProfile->location),
                    'intent_id' => Session::get('intent_id')
                ]);

                    if(isset($response->status) && $response->status == 'succeeded')
                    {
                        $data=getAllTimeSlots($req->time_slot,$service->duration??30);
                        $data=json_encode($data);


                        $booking = ServiceBooking::create([
                                'user_id'                 => Auth::id(),
                                'homeopath_id'            => $req->homeopath_id,
                                'uuid'                    => date('dmyhis'),
                                'homeopath_service_id'    => $service->id,
                                'date'                    => $req->date,
                                'time_slot'               => $data,
                                'illness'                 => $req->illness ?? NULL,
                                'allergies'               => $req->allergies ?? NULL,
                                'concern'                 => $req->concern ?? NULL,
                                'price'                   => $service->price,
                                'transaction_id'          => $response->id,
                                'payment_method'          => 'stripe',
                                'meeting_handel_via'          => $req->meeting_handled_via??''

                            ]);
                        $payment_status = true;


                        $data = [
                            'name'     => env('APP_NAME'),
                            'email'    => Auth::user()->email,
                            'app_name' => env('APP_NAME'),
                            'subject'  => 'Your booking has been confirmed for service appointment',
                        ];

                        dispatch(new UserServiceBookedMailJob($data))->delay(now()->addSeconds(2));

                        return view('front.services.book_receipt', get_defined_vars());

                    }
                    else
                    {
                        $error = $response->getMessage();
                        return view('errors.payments_error', get_defined_vars());
                    }

            }

        }


    public function paypalPaymentSuccess(Request $request)
    {

         $response = $this->paypalPaymentSuceess($request->all());


        if ($response->getState() == 'approved')
        {

            $service = HomeopathService::findOrFail(Crypt::decryptString(Session::get('booking_form')['service_id']));

                $data=getAllTimeSlots(Session::get('input_time_slot'),$service->duration??30);
               $data=json_encode($data);

            $booking = ServiceBooking::create([
                'user_id'                 => Auth::id(),
                'homeopath_id'            => $service->user_id??'',
                'uuid'                    => date('dmyhis'),
                'homeopath_service_id'    => $service->id,
                'date'                    => Session::get('booking_form')['date'],
                'time_slot'               => $data,
                'illness'                 => Session::get('booking_form')['illness'] ?? NULL,
                'allergies'               => Session::get('booking_form')['allergies'] ?? NULL,
                'concern'                 => Session::get('booking_form')['concern'] ?? NULL,
                'price'                   => $service->price,
                'transaction_id'          => $response->transactions[0]->related_resources[0]->sale->id,
                'payment_method'          => 'paypal',
                'meeting_handel_via'          => Session::get('meeting_handled_via')??'online',

                ]);

            $payment_status = true;


            $data = [
                    'name'     => env('APP_NAME'),
                    'email'    => Auth::user()->email,
                    'app_name' => env('APP_NAME'),
                    'subject'  => 'Your booking has been confirmed for service appointment',
            ];

            dispatch(new UserServiceBookedMailJob($data))->delay(now()->addSeconds(2));

            return view('front.services.book_receipt', get_defined_vars());

        }

        return redirect()->route('index')->with('error','Payment failed! Try again later.');



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
                if (isset($json_obj->location)){
                        $location = $json_obj->location;
                        $amount = serviceAmount($json_obj->amount,$location) *100;
                    }else{

                        $amount = $json_obj->amount *100;
                    }



                    \Stripe\Stripe::setApiKey(env('STRIPE_SECRET'));
                $intent = \Stripe\PaymentIntent::create([
                    'payment_method' => $json_obj->payment_method_id,
                    'amount' => $amount,
                    'currency' => 'CAD',
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







}
