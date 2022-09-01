
                        <div class="tab-content " id="pills-tabContent">
<!--================================-->
                            <!-- 1 of 4 STEP -->
                    <!--================================-->
                    <form id="payment-form" method="POST" action="{{ route('make.checkout') }}">
                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                            @include('front.services.appointment-booking.slide_1')
                        </div>
                        <!--================================-->
                                <!-- 2 of 4 STEP -->
                        <!--================================-->
                        <div class="tab-pane d-none" id="nav-detail" role="tabpanel" aria-labelledby="nav-detail-tab">
                            @include('front.services.appointment-booking.slide_2')
                        </div>
                        <!--================================-->
                                <!-- 3 of 4 STEP -->
                        <!--================================-->
                        <div class="tab-pane d-none" id="nav-payment" role="tabpanel" aria-labelledby="nav-payment-tab">
                            @include('front.services.appointment-booking.slide_3')
                        </div>
                    </form>
                </div>




