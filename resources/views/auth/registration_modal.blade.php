
<style type="text/css">



</style>





<div class="modal fade" id="modalRegistration" tabindex="-1" role="dialog">
                              <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title mt-1" id="exampleModalLongTitle">Subscription</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="px-1">
                                                <x-auth-validation-errors class="mb-4 text-left text-danger" :errors="$errors" />
                                                <form action="{{ route('user.register') }}" method="POST">
                                                    @csrf
                                                    <div class="card-body p-0" >
                                                        

                                                        <h6 class="information">Sign-up to start booking</h6>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <input class="form-control" type="text" name="name" placeholder="Name*" required=""> </div>
                                                                </div>
                                                            </div>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group"> <input class="form-control" name="email" type="email" placeholder="Email ID*" required=""> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group"> <input class="form-control" name="password" type="password" placeholder="Password*" required=""> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group"> <input class="form-control" name="phone" type="text" placeholder="phone*" required=""> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-sm-12">
                                                                <div class="form-group">
                                                                    <div class="input-group"> <input class="form-control" name="zip_code" type="text" placeholder="zip code*" required=""> </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class=" d-flex flex-column text-center px-5 mt-3 mb-3"> <small class="agree-text">On clicking the "Confirm" button you agree to the</small> <a href="{{ route('terms') }}" target="_blank" class="terms">Terms & Conditions</a> </div>
                                                        <button class="btn btn-primary btn-block confirm-button" type="submit">Sign Up</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="col-md-5" style="border-left:1px solid #b7b5b5;">
                                                        <h6 class="card-title mb-3">Subscribe to the following packages:</h6>

                                                        <div class="d-flex flex-row text-center">
                                                            <label class="radio mr-1 radioSelectRole" id="homeopath-register-btn">
                                                                <input type="radio" name="role" value="homeopath" checked required="">
                                                                <span class="homeopath_checkbox"> Homeopath </span>
                                                                <a href="{{ route('find.homeopath') }}">Learn More</a>
                                                            </label>

                                                            <label class="radio radioSelectRole">
                                                                <input type="radio" name="role" value="advocate">
                                                                <span class="advocate_checkbox"> Advocate </span>
                                                                <a href="{{ route('advocates') }}">Learn More</a>
                                                            </label>
                                                        </div>
                                            
                                        </div>
                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>




