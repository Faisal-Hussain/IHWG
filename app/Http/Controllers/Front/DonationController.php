<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Traits\PaymentMethod;
use Session;
use Auth;
use Crypt;
use App\Models\Donation;

class DonationController extends Controller
{

    use PaymentMethod;


    public function index()
    {
        return view('front.donations', get_defined_vars());
    }


    public function donateAmount(Request $req)
    {

            Session::put('donation_form', $req->all());

                $data = [
                    'price'             => $req->price,
                    'payer_email'       => Auth::user()->email,
                    'currency'          => 'CAD',
                    'quantity'          => 1,
                    'description'       => 'Donation at IHWG',
                    'success_url'       => route('donation.payment.success'),
                    'cancel_url'        => route('donation.payment.success')
                ];
                return $this->makePaypalCheckout($data);

    }

    public function donationPaymentSuccess(Request $req)
    {


        $response = $this->paypalPaymentSuceess($req->all());
       

        if ($response->getState() == 'approved') 
        {
            // $response->getId()
            Auth::user()->donations()->update(['status' => 'closed']);

             Donation::create([
                'user_id'                 => Auth::Id(),
                'price'                   => Session::get('donation_form')['price'],
                'transaction_id'          => $response->transactions[0]->related_resources[0]->sale->id,
                'payment_type'            => Session::get('donation_form')['payment_type']
                ]);



            return redirect()->route('index')->withMessage('Your donation has been done thanks.');


        }

        return redirect()->route('index')->with('error','Payment failed! Try again later.');


    }


    public function donationCancel($id)
    {
        Donation::findOrFail(Crypt::decrypt($id))->update(['status' => 'closed']);
        return back()->withMessage('Your monthly donation has been cancelled.');
    }




}
