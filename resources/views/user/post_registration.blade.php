<div class="card">
    <h6 class="m-0"><span class="text-white bg-dark p-1">Hello, {{ Auth::User()->name }}: Complete your profile to continue</span></h6>

    <div class="card-body post-registration">
        <div class="row">
            <div class="col-sm-12">
                
                            <form class="form-horizontal" method="POST" action="{{ route('homeopath.complete.profile') }}">
                                    @csrf
                                            <div class="row">
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
                                            <button type="submit" class="btn btn-primary confirm-button">Complete my profile</button>
                                        </form>

            </div>
        </div>
    </div>
</div>

