      <div class="container container-book-appointment mb-4">


        <div class="appointment-banner  pt-3 pb-1" style="background-image:url('{{ asset($service->ServiceTheme->cover) }}')">

          <strong class="float-right pr-4">3 of 4</strong>
          <div class="col-lg-11 offset-lg-1 pt-1">
            <h2 class="pt-4">Payment</h2>
            <p>Please provide the following payment information.<br>information. You can always pay later if you wish.</p>
            <p class="pt-3">Thank you!</p>
          </div>

        </div>


        <div class="row mb-4">


        <div class="col-lg-10 offset-lg-1">
          <div class="row px-4">


        <div class="col-lg-12">
          <strong>Would you like to pay now? Or pay later?</strong>
        </div>


          <div class="col-lg-3 mb-3">
            <div class="inputGroup">
              <input id="pay_now" class="input__paying__type" name="input_pay" value="pay_now" type="radio" checked="" />
              <label for="pay_now">
                <span>Now</span>
              </label>
            </div>
          </div>

          <div class="col-lg-3 mb-3">
            <div class="inputGroup">
              <input id="pay_later" class="input__paying__type" name="input_pay" value="pay_later" type="radio" />
              <label for="pay_later">
                <span>Later</span>
              </label>
            </div>
          </div>




          <div class="col-lg-12 payments-tab mt-2">

            <div class="payment-methods-btns">
              <strong>Provide the method you will be paying with:</strong>
              <ul class="nav nav-pills mb-3 text-center" id="pills-tab" role="tablist">
                <li class="nav-item pr-2">
                  <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" data-method="stripe" role="tab" aria-controls="pills-home" aria-selected="true"><i class="fas fa-credit-card"></i> Visa/Debit</a>
                </li>
                <li class="nav-item pl-2">
                  <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" data-method="paypal" role="tab" aria-controls="pills-profile" aria-selected="false"><i class="fab fa-paypal"></i> Paypal</a>
                </li>
                <li class="nav-item pl-2 d-none">
                  <a class="nav-link" id="pills-later-tab" data-toggle="pill" href="#pills-later" data-method="pay-later" role="tab" aria-controls="pills-later" aria-selected="false"><i class="fas fa-hands-helping"></i> Pay Later</a>
                </li>

            </div>
            </ul>
            <hr>

            <div class="tab-content" id="pills-tabContent">
              <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                <div class="col-lg-12 col-sm-12">
                  <h6>Provide your card information:</h6>
                  <div class="row card-body  card-payment">
                    <div class="m-auto">
                      <div class="credit-cards pb-3" style="text-align: center; width: 100%">
                        <img class="p-3"style="width: 40%;" src="https://lh4.googleusercontent.com/CSUg6331rRxvvdxMJXTPTHpiXZljpp4P_X64UZowSTCFds3s53P1Q0eMLQx-8hOHpjLtxg0dEge3bnaXJe79eAvbi5OWUEhurzUDqRo8T7VoiEhhkNUvGj4cK-87u-kmwih5e1ne"><br>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_visa.png"/>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_master.png"/>
                        <img height="40" src="https://shoplineimg.com/assets/footer/card_amex.png"/>
                      </div>
                      <div class="group">
                        <label>Name on card</span></label>
                        <input id="name" class="field required-entry" name="name" placeholder="John Doe" autocomplete="off" />
                        <label>Card Information</label>
                        <div id="card-element" class="field"></div>
                      </div>
                      <div id="card-errors" class="error text-danger"></div>
                      <div class="text-center">
                        <small class="note-alert">Click the "Checkout" button below to confirm your payments and book an appointment</small>
                      </div>

                    </div>
                  </div>
                </div>
              </div>
              <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                <div class="col-md-8 offset-md-2 offset-sm-0 m-auto text-center">
                  <img src="https://www.paypalobjects.com/webstatic/mktg/logo/AM_mc_vs_dc_ae.jpg">
                  <h6 class="alert alert-warning text-left">
                  PayPal is an online payment system that makes paying for things online and sending and receiving money safe and secure. When you link your bank account, credit card or debit card to your PayPal account, you can use PayPal to make purchases online with participating stores.</h6>
                  <small class="note-alert">Click the "Checkout" button below to confirm your payments and book an appointment</small>
                </div>
              </div>

              <div class="tab-pane fade" id="pills-later" role="tabpanel" aria-labelledby="pills-later-tab">
                <div class="row mb-4">
                  <div class="col-md-12 col-12">
                    <h6>Is there a method of payment you prefer to pay with?</h6>
                  </div>
                  <div class="col-md-4">
                      <div class="inputGroup">
                        <input id="Visa" class="" name="later_pay_method" value="Visa" type="radio" checked="" />
                        <label for="Visa">
                          <span>Visa</span>
                        </label>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="inputGroup">
                        <input id="Mastercard" class="" name="later_pay_method" value="Mastercard" type="radio" />
                        <label for="Mastercard">
                          <span>Mastercard</span>
                        </label>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="inputGroup">
                        <input id="E-Transfer" class="" name="later_pay_method" value="E-Transfer" type="radio" />
                        <label for="E-Transfer">
                          <span>E-Transfer</span>
                        </label>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="inputGroup">
                        <input id="Cheques" class="" name="later_pay_method" value="Cheques" type="radio" />
                        <label for="Cheques">
                          <span>Cheques</span>
                        </label>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <div class="inputGroup">
                        <input id="Cash" class="" name="later_pay_method" value="Cash" type="radio" />
                        <label for="Cash">
                          <span>Cash</span>
                        </label>
                      </div>
                  </div>
                </div>
                <div class="m-auto">

                   <p>
                      You may discuss payments with the practitioner. Payment plans may be available.<br><br>

                      The following insurance companies often cover homeopathic treatments depending on your plan:<br><br>
                      -Blue Cross<br>
                      -Sunlife<br>
                      -Manulife<br><br>

                      Speak with your insurance company to find out whether they cover homeopathic treatments
                   </p>
                  <small class="note-alert">Click the "Checkout" button below to confirm your bookings</small>
                </div>
              </div>



            </div>

          </div>
          <div class="col-lg-12 text-right">
            <input type="hidden" name="payment_method" id="payment_method" value="stripe">
            <button type="submit" class="btn btn-checkout text-dark" id="card-button" >Checkout</button>
          </div>
        </div>
    </div>
  </div></div></div>

