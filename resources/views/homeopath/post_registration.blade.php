<!-- <div class="card mt-2">
    <h6 class="m-0"><span class="text-white bg-dark p-1">Add Registration</span></h6>

    <div class="card-body post-registration">
        <div class="row">
            <div class="col-sm-12">
                
                            <form class="form-horizontal" method="POST" action="{{ route('homeopath.complete.profile') }}">
                                    @csrf
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add your Homeopathy registration number in order to verify your profile</label>
                                                            <input type="text" name="registration_number" class="form-control text-uppercase" placeholder="Registration number e.g. (STH1345R)" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add Designation</label>
                                                            <input type="text" name="designation" class="form-control" placeholder="Designation" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>
                                                
                                                
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add Caption</label>
                                                            <input type="text" name="caption" class="form-control" placeholder="Caption" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-12 mb-2">
                                                            <label class="mb-1">Add Specialization tags</label>
                                                            <input type="text" name="specializations" id="form-tags-1" required="">
                                                </div>
                                                
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add Location</label>
                                                            <input type="text" name="location" id="point" class="form-control" placeholder="Location" required="">
                                                            <div class="help-block"></div></div>
                                                            <input type="hidden" id="latitude" name="latitude">
                                                            <input type="hidden" id="longitude" name="longitude">
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add Certifications</label>
                                                            <input type="text" name="certifications" class="form-control" placeholder="Certifications" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Add Affiliations</label>
                                                            <input type="text" name="affiliations" class="form-control" placeholder="Affiliations" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label>Started</label>
                                                            
                                                            <select class="form-control" name="estabilished_at">
                                                                <option value="1">1 year ago</option>
                                                                <option value="2">2 years ago</option>
                                                                <option value="3">3 years ago</option>
                                                                <option value="4">4 years ago</option>
                                                                <option value="5">5 years ago</option>
                                                                <option value="6">6 years ago</option>
                                                                <option value="7">7 years ago</option>
                                                                <option value="8">8 years ago</option>
                                                                <option value="9">9 years ago</option>
                                                                <option value="10">10 years ago</option>
                                                            </select>

                                                            <div class="help-block"></div></div>
                                                    </div>
                                                </div>

                                                
                                                
                                            </div>
                                            <button type="submit" class="btn btn-primary confirm-button">Add Registration</button>
                                        </form>

            </div>
        </div>
    </div>
</div> -->




<div class="row">
    <form class="form-horizontal" method="POST" action="{{ route('homeopath.complete.profile') }}" enctype="multipart/form-data">
        @csrf
                    <div class="col-12">
                        <div class="card card00 m-2 border-0">
                            <div class="row text-center justify-content-center px-3">
                                
                                <h3 class="mt-4">Registration Form</h3>
                            </div>
                            <div class="d-flex flex-md-row  mt-4 flex-column-reverse">
                                <div class="col-md-4">
                                    <div class="card1">
                                        <ul id="progressbar" class="text-center">
                                            <li class="active step0"></li>
                                            <li class="step0 second-div"></li>
                                            <li class="step0 third-div"></li>
                                            
                                        </ul>
                                        <h6 class="mb-5">Practitioner Information</h6>
                                        <h6 class="mb-5">User Profile</h6>
                                        <h6 class="mb-5">Submit</h6>
                                        
                                    </div>
                                </div>
                                <div class="col-md-8">
                                    <div class="card2 first-screen show ml-2">
                                        
                                        <div class="row">
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Add your Homeopathy registration number in order to verify your profile</label>
                                                            <input type="text" name="registration_number" class="form-control required text-uppercase" placeholder="Registration number e.g. (STH1345R)" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Provide your full medical designation</label>
                                                            <input type="text" name="designation" class="form-control required" placeholder="Designation" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Add Specialization tags</label>
                                                            <input type="text" name="specializations" class="form-control required" placeholder="Specializations" required="" id="form-tags-1">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Provide any other educational designations (optional)</label>
                                                            <input type="file" name="edu_designation[]" class="form-control " placeholder="" >
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            
                                            
                                            <div class="col-sm-12 append_designation_div">
                                                
                                            </div>
                                            
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="">
                                                           
                                                            <button type="button" class="form-control supporting_document_for_approval" data-input="get_appendable_designation" placeholder="" id="" required="">Add supporting documents for approval   +</button>
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>

                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Provide related certifications you posses as a practitioner</label>
                                                            <input type="file" name="certifications[]" class="form-control required" placeholder="" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>

                                           

                                            <div class="col-sm-12 append_certification_div">
                                                
                                            </div>

                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="">
                                                            
                                                            <button type="button" class="form-control supporting_document_for_approval2" data-input="get_appendable_certification" placeholder="" id="" required="">Add supporting documents for approval   +</button>

                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            
                                        </div>
                                        

                                        <div class="next-button text-center mt-1" data-current="first-screen" data-next="second-div"> <span class="fa fa-arrow-right"></span> </div>
                                    </div>
                                    <div class="card2 ml-2 second-div">
                                        <div class="row ">
                                           <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Location</label>
                                                            <input type="text" name="location" class="form-control required" id="point" placeholder="" required="">
                                                            <div class="help-block"></div></div>
                                                            <input type="hidden" id="latitude" name="latitude">
                                                            <input type="hidden" id="longitude" name="longitude">
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">ADDRESS of your clinic</label>
                                                            <input type="text" name="address" class="form-control required" placeholder="" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Add a CAPTION for your clinic</label>
                                                            <textarea class="form-control required" name="caption" rows="4" placeholder="Add Caption">
                                                                
                                                            </textarea>
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Add your FOCUSES (use a , to separate each focus):</label>
                                                            <input type="text" name="focuses" class="form-control required" placeholder="" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Add related AFFILIATIONS (e.g. Colleges you graduated from):</label>
                                                            <input type="text" name="affiliations" class="form-control required" placeholder="" required="">
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>
                                            <div class="col-sm-12">
                                                    <div class="form-group">
                                                        <div class="controls">
                                                            <label class="font-weight-bold mb-1">Started At:</label>
                                                            <select class="form-control" name="estabilished_at">
                                                                <option value="1">1 year ago</option>
                                                                <option value="2">2 years ago</option>
                                                                <option value="3">3 years ago</option>
                                                                <option value="4">4 years ago</option>
                                                                <option value="5">5 years ago</option>
                                                                <option value="6">6 years ago</option>
                                                                <option value="7">7 years ago</option>
                                                                <option value="8">8 years ago</option>
                                                                <option value="9">9 years ago</option>
                                                                <option value="10">10 years ago</option>
                                                            </select>
                                                            <div class="help-block"></div></div>
                                                    </div>
                                            </div>

                                            <div class="next-button text-center mt-1" data-current="second-div" data-next="third-div"> <span class="fa fa-arrow-right"></span> </div>
                                        </div>
                                        
                                    </div>
                                    <div class="card2 third-div ml-2">
                                        <div class="row mb-4">
                                            
                                            <p class="font-weight-bold text-dark">
                                                You've reached the end of the registration process.<br><br>
                                                Once submitted, your profile will be under review pending approval. The approval process may take up to 24 hours. Please be patient as we work hard to provide you with a quick and seamless experience.
                                                <br><br>
                                                You can check out the 'Find A Homeopath' directory to get a better idea of how other practitioners are building and displaying their profiles.
                                            </p>

                                            <h2 class="col-12 text-primary text-center"><strong>Success !</strong></h2>
                                            <div class="col-12 text-center"><img class="tick" src="https://i.imgur.com/WDI0da4.gif"></div>
                                            <h6 class="col-12 mt-2 float-right"><button type="submit" class="bt btn-primary btn-lg border-0 ">Save</button></h6>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                        
                    </div>
    </form>
</div>

