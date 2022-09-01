<div class="demo-panel dp-right right-panel">
    <div class="demo-panel-trigger">
        <span class="dpt-icon"></span>
        <span class="dpt-close"></span>
</div>
    <div class="demo-panel-inner">
        <div class="demo-panel-header">Donate C$</div>
        <div class="demo-panel-content">
        
            <div id="custom_single_page">
                <div class="container2" onload="initialLook()">
                    <div class="form-content">
                        <div id="popupWait" ><b></b></div>
                        <div class="donate-form">
                            
                            <form action="{{ route('donate.amount') }}" method="post">
                                @csrf
                                <div class="content-inner-section pb-5">
                                    
                                    <div class="amount-section mb-3">
                                        <legend>How much C$ would you like to donate</legend>
                                        <div class="mb-2">
                                            <div class="row">
                                                <div class="col-sm-6 mb-2"><a class="btn btn-payment-append">10</a></div>
                                                <div class="col-sm-6 mb-2"><a class="btn btn-payment-append">15</a></div>
                                                <div class="col-sm-6 mb-2"><a class="btn btn-payment-append">20</a></div>
                                                <div class="col-sm-6 mb-2"><a class="btn btn-payment-append">25</a></div>
                                            </div>
                                        </div>
                                        <input type="number" min="5" required="" class="form-control donation-amount" name="price" placeholder="10">
                                    </div>
                                    <div class="wrapper-payemnt-choose">
                                        <input type="radio" name="payment_type" id="option-1" checked required="" value="one_time">
                                        <input type="radio" name="payment_type" id="option-2" class="form-control" value="monthly">
                                        <label for="option-1" class="option option-1">
                                            <div class="dot"></div>
                                            <span>One Time</span>
                                        </label>
                                        <label for="option-2" class="option option-2">
                                            <div class="dot"></div>
                                            <span>Monthly</span>
                                        </label>
                                    </div>
                                    
                                    <button type="submit" class="btn btn-dark pull-right">Donate us</button>
                                    
                                </div>
                            </form>

                        </div>
                    </div>
                

                </div>

            </div>
        </div>
    </div>
</div>