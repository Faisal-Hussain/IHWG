@extends('layouts.front')
@section('title', 'Submit Feedback')

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')
        </div>
    </div>
</header>
<!--END HEADER-->


<section class="border p-4 d-flex justify-content-center mb-4">
    
            <div class="container">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">

                    <!--rating form section-->
            @if(Auth::check())
            <div class="card card-help post-trip-review-section">


                <div class="card-body">
                    <form action="{{ route('submit.service.review') }}" method="POST">
                        <div class="text-center">
                            <h3>Service Feedback</h3>
                            <small>Feedback is for Homeopath that will help the future patients to look the profile of the homeopath and take a decision as per reviews and feedback.
                                Please take it seriouslt complete this form as it will not take too much time.</small>
                        </div>

                        @csrf
                        <input type="hidden" name="service_id" value="{{ Crypt::encrypt($service->id) }}">
                        <div class="form-group">
                            <table class="table table-sm table-bordered mt-3">
                                <tr class="btn-site">
                                    <th>Service Title</th>
                                    <td>
                                        <div class="starrating risingstar d-flex justify-content-right flex-row-reverse pb-2">
                                            {{ $service->title }}    
                                        </div>
                                     </td>
                                </tr>
                                <tr class="btn-site">
                                    <th>Duration</th>
                                    <td>
                                        <div class="starrating risingstar d-flex justify-content-right flex-row-reverse pb-2">
                                            {{ $service->duration }} Minutes    
                                        </div>
                                     </td>
                                </tr>
                                <tr class="btn-site">
                                    <th>Price</th>
                                    <td>
                                        <div class="starrating risingstar d-flex justify-content-right flex-row-reverse pb-2">
                                            ${{ $service->price }}     
                                        </div>
                                     </td>
                                </tr>
                                
                                <tr class="bg-animated">
                                    <th>Rate</th>
                                    <td>
                                        <div class="starrating risingstar d-flex justify-content-right flex-row-reverse">
                                            <input type="radio" id="rate5" name="rate" value="5" required /><label for="rate5" title="5 star"></label>
                                            <input type="radio" id="rate4" name="rate" value="4" /><label for="rate4" title="4 star"></label>
                                            <input type="radio" id="rate3" name="rate" value="3" /><label for="rate3" title="3 star"></label>
                                            <input type="radio" id="rate2" name="rate" value="2" /><label for="rate2" title="2 star"></label>
                                            <input type="radio" id="rate1" name="rate" value="1" /><label for="rate1" title="1 star"></label>
                                        </div>
                                    </td>
                                </tr>
                            </table>


                            <textarea class="form-control" name="feedback" placeholder="Your message here" rows="2" required></textarea>
                        </div>
                        <div class="form-group text-right">
                            <button type="submit" class="btn btn-dark btn-sm">Submit Feedback</button>
                            <a href="{{ route('index') }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to cancel feedback?')">Cancel</a>
                        </div>
                    </form>
                </div>
            </div>
            @endif
            <!--end rating form section-->

                </div>
            </div>
        </div>
              
</section>

@endsection



@section('js')
    
@endsection