<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Models\Images;
use App\Models\Posts;
use Illuminate\Http\Request;
use URL;
use Session;
use Redirect;
use Input;
use PayPal\Rest\ApiContext;
use PayPal\Auth\OAuthTokenCredential;
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


class PaypalController extends Controller
{


    private $_api_context;

    public function __construct()
    {

        $paypal_configuration = \Config::get('paypal');
        $this->_api_context = new ApiContext(new OAuthTokenCredential($paypal_configuration['client_id'], $paypal_configuration['secret']));
        $this->_api_context->setConfig($paypal_configuration['settings']);
    }


    public function store(Request $request)
    {
        $amount=settings();
        $paypal_amount=$amount['add_price'] ?? 0;

        $request->validate([
            'part_condition'=>'required',
            'title'=>'required',
            'oem'=>'required',
            'car_id'=>'required',
            'model_id'=>'required',
            'year'=>'required',
            'modification_id'=>'required',
            'category_id'=>'required',
            'subcategory_id'=>'required',
            'other_spare_part_number'=>'required',
            'color'=>'required',
//            'sale_price'=>'required',
            'description'=>'required',
            'terms_conditions'=>'required',
            'photos' => 'required',
            'photos.*' => 'mimes:jpeg,jpg,png,gif|max:2048',
            'location'=>'required',
            'phone'=>'required',
            'website'=>'required',
            'email'=>'required',
        ]);

        $payer = new Payer();
        $payer->setPaymentMethod('paypal');

        $item_1 = new Item();

        $item_1->setName(auth()->user()->email)
            ->setCurrency('USD')
            ->setQuantity(1)
            ->setPrice($paypal_amount);

        $item_list = new ItemList();
        $item_list->setItems(array($item_1));

        $amount = new Amount();
        $amount->setCurrency('USD')
            ->setTotal($paypal_amount);

        $transaction = new Transaction();
        $transaction->setAmount($amount)
            ->setItemList($item_list)
            ->setDescription('Enter Your transaction description');

        $redirect_urls = new RedirectUrls();
        $redirect_urls->setReturnUrl(URL::route('user.payment.success'))
            ->setCancelUrl(URL::route('user.payment.success'));

        $payment = new Payment();
        $payment->setIntent('Sale')
            ->setPayer($payer)
            ->setRedirectUrls($redirect_urls)
            ->setTransactions(array($transaction));
        try {
            $payment->create($this->_api_context);
        } catch (\PayPal\Exception\PPConnectionException $ex) {
            if (\Config::get('app.debug')) {
                return Redirect::route('user.parts.add')->with('error','Connection timeout');

            } else {

                return Redirect::route('user.parts.add')->with('error','Some error occur, sorry for inconvenient');
            }
        }

        foreach($payment->getLinks() as $link) {
            if($link->getRel() == 'approval_url') {
                $redirect_url = $link->getHref();
                break;
            }
        }

        Session::put('paypal_payment_id', $payment->getId());

        if(isset($redirect_url)) {
            return Redirect::away($redirect_url);
        }


        return Redirect::route('user.parts.add')->with('message','Unknown error occurred');


    }


    public function paypalPaymentSuccess(Request $request)
    {

        $payment_id = Session::get('paypal_payment_id');

        Session::forget('paypal_payment_id');
        if (empty($request->input('PayerID')) || empty($request->input('token'))) {
            return Redirect::route('user.parts.add')->with('error','Payment Failed');
        }
        $payment = Payment::get($payment_id, $this->_api_context);
        $execution = new PaymentExecution();
        $execution->setPayerId($request->input('PayerID'));
        $result = $payment->execute($execution, $this->_api_context);

        if ($result->getState() == 'approved') {
            $post_id=Session::get('post_id');
            Session::forget('post_id');
            Posts::where('id',$post_id)->update(['status'=>'active','payment'=>true]);
            return redirect()->route('user.parts.list')->with('message','Post has been added successfully');
        }

        return Redirect::route('user.parts.add')->with('error','Payment failed !!');



    }
}
