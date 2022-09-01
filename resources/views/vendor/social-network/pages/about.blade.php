<form id="about-form">
    @csrf
    <div class="row">
    <div class="col-lg-12">
        @include('vendor.social-network.components.social_network_navbar')
        <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">About Information</h4>
                                </div>
                                <hr>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form class="form form-horizontal">
                                            <div class="form-body">
                                                <div class="row">

                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <strong>Location</strong>
                                                            </div>
                                                            <div class="col-md-10">
                                                                <input type="text" id="point" class="form-control" name="location" placeholder="Location" 
                                                                value="{{ Auth::user()->userSocialProfile->location ?? '' }}">

                                                                <input type="hidden" id="latitude" name="latitude" value="{{ Auth::user()->userSocialProfile->latitude ?? '' }}">
                                                                <input type="hidden" id="longitude" name="longitude" value="{{ Auth::user()->userSocialProfile->longitude ?? '' }}">

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <strong>Caption</strong>
                                                            </div>
                                                            <div class="col-md-10">
                                                                <input type="text" class="form-control" name="caption" max="150" placeholder="Caption" value="{{ Auth::user()->userSocialProfile->caption ?? '' }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <strong>About</strong>
                                                            </div>
                                                            <div class="col-md-10">
                                                                <textarea type="text" rows="7" class="form-control" max="250" name="about" placeholder="About">{{ Auth::user()->userSocialProfile->about ?? '' }}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-12">
                                                        <div class="form-group row">
                                                            <div class="col-md-2">
                                                                <strong>Website</strong>
                                                            </div>
                                                            <div class="col-md-10">
                                                                <input type="text" class="form-control" name="website" placeholder="Website" value="{{ Auth::user()->userSocialProfile->website ?? '' }}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    


                                                    <div class="col-12 text-right">
                                                        <button type="submit" class="btn btn-primary mb-1 btn-update-about">Update Information</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>

    </div>
</div>
</form>



<script src="{{ asset('admin/js/map_autocomplete.js') }}"></script>
<script>
    $(document).ready(function(){
        $('#about-form').on('submit', function(event){
            event.preventDefault();
            $.ajax({
                url:'{{route('social.about.update')}}',
                method:"POST",
                data:new FormData(this),
                dataType:'JSON',
                contentType: false,
                cache: false,
                processData: false,
                success:function(response){
                    $('.location').text($('#point').val());
                    toastr.success(response);
                },
                error: function (errorThrown) {

                    if (errorThrown.status==500) {
                        toastr.error('Interval Server Error');
                        
                    }
                  
                }
           })
       })
    })
</script>

