@extends('layouts.front')
@section('title', 'Consultant')

@section('content')

<header>
    <div class="wrapper">
        <div id="header_content" style="background:#dcf2fa 50% center;background-size: cover;">
            @include('front.components.navbar')
            <!--PAGE BANNER-->
        </div>
    </div>
</header>
<!--END HEADER-->

<!--MAIN CONTENT SECTION-->


<script>
      function initMap() {
      var position = { lat: -25.363, lng: 131.044 };
      var map = new google.maps.Map(document.getElementById('location_map'), {
        zoom: 7,
        center: position
      });

      var marker = new google.maps.Marker({
        position: position,
        map: map
      });
    }
  </script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=&callback=initMap"></script>

<div class="container">
  <div id="store_details">
    <div class="row">
      <div class="col-12">
        <div class="store-banner">
                    <img class="img-fluid" src="{{ asset('front/assets') }}/images/login-bgs/30.jpg">
                    
          <div class="profile-overlay">
            <div class="profile-details-content">
                <div class="profile-image">
                                    <img src="{{ asset('front/assets') }}/uploads/selfie.jpg">
                                  </div>
                <div class="profile-details">
                  <div class="vendor-name"><h3>Neil Kwon</h3></div>
                  <table>
                      <tr class="vendor-address"><td><i class="fa fa-map-marker" aria-hidden="true"></i></td><td>Homeopath, MeD, BAeD</td></tr>
                      <tr class="vendor-phone"><td><i class="fa fa-mobile-phone" aria-hidden="true"></i></td><td>12345</td></tr>
                      <tr class="vendor-email"><td><i class="fa fa-envelope-open" aria-hidden="true"></i></td><td>neilkwon@gmail.com</td></tr>
                  </table>
                  <div class="vendor-created"><strong><i class="fa fa-calendar" aria-hidden="true"></i> Since:</strong> &nbsp;June 08, 2021</div>
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
     
    <div class="row">
      <div class="col-12">
        <div class="small-profile-details-content">
          <div class="profile-details-content">
            <div class="profile-image">
                            <img src="../public/uploads/selfie.jpg">
                          </div>
            <div class="profile-details">
              <div class="vendor-name"><h3>Neil Kwon</h3></div>
              <table class="text-left">
                  <tr class="vendor-address"><td><i class="fa fa-map-marker" aria-hidden="true"></i></td><td>Homeopath, MeD, BAeD</td></tr>
                  <tr class="vendor-phone"><td><i class="fa fa-mobile-phone" aria-hidden="true"></i></td><td>12345</td></tr>
                  <tr class="vendor-email"><td><i class="fa fa-envelope-open" aria-hidden="true"></i></td><td>neilkwon@gmail.com</td></tr>
                  <tr class="vendor-email"><td><i class="fa fa-calendar" aria-hidden="true"></i></td><td>Since: &nbsp;June 08, 2021</td></tr>
              </table>
            </div>
          </div>
        </div>  
      </div>    
    </div>      
    
      
    <div class="row"> 
      <div class="col-xs-12 col-md-12 col-lg-6">
        <div class="vendor-social-media">
          <ul class="social-media">
            <li><a class="facebook" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Facebook"><i class="fa fa-facebook"></i></a></li>
            <li><a class="twitter" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Twitter"><i class="fa fa-twitter"></i></a></li>
            <li><a class="linkedin" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Linkedin"><i class="fa fa-linkedin"></i></a></li>
            <li><a class="dribbble" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Dribbble"><i class="fa fa-dribbble"></i></a></li>
            <li><a class="google-plus" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Google Plus"><i class="fa fa-google-plus"></i></a></li>
            <li><a class="instagram" href="//" data-toggle="tooltip" data-placement="top" title="" data-original-title="Follow on Instagram"><i class="fa fa-instagram"></i></a></li>
          </ul>
        </div>
      </div>
      <div class="col-xs-12 col-md-12 col-lg-6">
        <div class="vendor-review"><div class="review-stars"><div class="star-rating"><span style="width:0%"></span></div></div>
        </div>
      </div>  
    </div> 
        
    <div class="row">
      <div class="col-xs-12 col-md-12 col-lg-3">
        <div class="vendor-details-left-panel">
                                  <div class="vendor-location">
              <div class="vendor-location-content">
                <h2><span>Store Location</span></h2>
                <div id="location_map"></div>
              </div>    
            </div>  
            <br><br>
                        
                        <div class="contact-vendor">
              <div class="contact-vendor-content clearfix">
                <h2><span>Contact Advocate</span></h2>
                <div class="form-group">
                  <input class="form-control" name="contact_name" id="contact_name" placeholder="Enter your name" type="text">
                </div>
                <div class="form-group">
                  <input class="form-control" name="contact_email_id" id="contact_email_id" placeholder="Enter your email" type="text">
                </div>
                <div class="form-group">
                  <textarea class="form-control" name="contact_message" id="contact_message" placeholder="Enter your message"></textarea>
                </div>  
                <button class="pull-right btn btn-default btn-style" type="button" id="sendVendorContactMessage" name="sendVendorContactMessage">Send <i class="fa fa-arrow-circle-right"></i></button>  
              </div>
            </div> 
                              </div>
      </div>
      <div class="col-xs-12 col-md-12 col-lg-9">
        <div class="row">
            <div class="col-xs-12 col-md-12 col-lg-7">
              <div class="vendor-page-menu">
                <ul>
                  <li>
                      
                      <a class="btn btn-arrow btn-arrow-bottom btn-default vendor-menu-hover" href="#">Home</a>
                                      </li>
                  <li>
                                          <a class="btn btn-default btn-style" href="#">Shop</a>
                      
                  </li>  
                  <li>
                                          <a class="btn btn-default btn-style" href="#">Reviews</a>
                     
                  </li>
                </ul>
              </div>
            </div> 
            

             
        </div>
        <hr>     
        <div class="row">
          <div class="col-12">
            <div class="vendor-menu-content">
                                              <style type="text/css">
.slick-dots li.slick-active button::before, .slick-dots li button::before{
  color:#1FC0A0;
}
</style>

<div id="vendor_home_content">
  <h2 class="cat-box-top">Collections <span class="responsive-accordian"></span></h2>
    <p style="text-align:center;padding-top:25px;">No data found!</p>
    
  <div class="row">
    <div class="col-12">
      <div class="vendor-special-products">
        <div id="latest_items">
          <h2 class="cat-box-top">Latest <span class="responsive-accordian"></span></h2>   
                    <p style="text-align:center;">No data found!</p>
                  </div>
      </div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-12">
      <div class="vendor-special-products">
        <div id="best_sales_items">
          <h2 class="cat-box-top">Best Sales <span class="responsive-accordian"></span></h2>   
                    <br>
          <p style="text-align:center;">No data found!</p>
                  </div>
      </div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-12">
      <div class="vendor-special-products">
        <div id="featured_items">
          <h2 class="cat-box-top">Featured Products <span class="responsive-accordian"></span></h2>
                      <p style="text-align:center;">No data found!</p>
                    </div>
      </div>
    </div>
  </div>
  
  <div class="row">
    <div class="col-12">
      <div class="vendor-special-products">
        <div id="recommended_items">
          <h2 class="cat-box-top">Recommended Products <span class="responsive-accordian"></span></h2>
                      <p style="text-align:center;">No data found!</p>
                    </div>
      </div>
    </div>
  </div>
</div>
              
                            
              
                          </div>  
          </div>      
        </div>
      </div>
    </div>
    
    <input type="hidden" name="product_title" id="product_title" value="Store Details">
        <input type="hidden" name="product_img" id="product_img" value="../public/images/vendor-cover-placeholder.jpg">
      </div>
</div>    
<input type="hidden" name="vendor_email" id="vendor_email" value="neilkwon@gmail.com">

    </section>

@endsection



@section('js')
    
@endsection