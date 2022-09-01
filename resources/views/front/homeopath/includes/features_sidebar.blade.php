<div class="sidebar-profile-homeo">
    <img src="{{ asset($homeopath->HomeopathProfile->service_profile_img ?? '') }}" class="rect-profile-img">
    <h5 class="mt-3 font-weight-bold">{{ $homeopath->name??'' }}</h5>
    <small class="text-primary">{{ $homeopath->HomeopathProfile->designation??'' }}</small>

    <p class="mt-3 caption__homeo__short d-block" style="text-align: justify;">
        <!-- {{  Str::limit($homeopath->HomeopathProfile->caption, 40)}} -->
        {{$homeopath->HomeopathProfile->caption}}
    </p>
    <p class="mt-3 caption__homeo__long d-none" style="text-align: justify;">
        {{  $homeopath->HomeopathProfile->caption }}
    </p>

    <!-- @if(strlen($homeopath->HomeopathProfile->caption) > 40)

    <div class="text-center mt-3 mb-0 pb-0">
        <a class="btn-toggle-badges cursor-pointer show-hide-caption">
            Read More <i class="fas fa-chevron-down" id="toggle-chevron-up-down"></i>
        </a>
    </div>

    @endif -->



    <div class="Badges-accolades mt-4">
        <h6 >Badges and accolades</h6>
        <div class="">
            <div class="v-box1 text-center mt-3">

                <div class="item1">
                    @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Badge")=='true')
                    <img src="{{ asset(badge($homeopath->badge ?? '' )['path'] ?? '') }}" title="{{ badge($homeopath->badge??'')['title']??'' }}" class="profile-bowl">
                    @else
                       
                    @endif
                </div>

                <div class="item2 ">
                    <div>
                        @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Booking Milestone")=='true')
                        <span class="txt20">
                            
                            {{ count(getHomeopathBookings($homeopath->id))??0 }}
                            

                        </span>   <br>
                        <span class="txt9">Booking Milestone </span>
                        @else
                            
                        @endif
                    </div>
                </div>
                <div class="item3">
                    <div>
                        @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Years")=='true')
                            {{ $homeopath->HomeopathProfile->estabilished_at ?? 0}}
                        <span class="txt20">
                            
                            
                        </span><br>
                        <span class="txt9">Years </span>
                        @else
                            
                        @endif
                    </div>
                </div>


            </div>
<!-- multi-collapse  collapse-->

            <div class="row">
                <div class="col">
                  <div class=" " id="multiCollapseExample1">
                    <div class="v-box1 text-center mt-3">

                        <div class="articals">
                            <div>
                                @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Articals")=='true')
                                <span class="txt20">
                                    
                                    {{ badgesInformation($homeopath->id)['articals']??0 }}
                                    
                                </span>   <br>
                                <span class="txt9">Articals</span>
                                @else
                                        
                                @endif
                            </div>
                        </div>
                        <div class="events">
                            <div>
                                @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Events Hosted")=='true')
                                <span class="txt20">
                                    
                                    {{ badgesInformation($homeopath->id)['events']??0 }}
                                    
                                </span>   <br>
                                <span class="txt9">Events Hosted</span>
                                @else
                                        
                                @endif
                            </div>
                        </div>
                        <div class="attend_events">
                            <div>
                                @if(homaopathBadgeStatus($homeopath->HomeopathProfile->id,"Events Attended")=='true')
                                <span class="txt20">
                                    
                                        {{ badgesInformation($homeopath->id)['attend_events']??0 }}
                                    
                                </span><br>
                                <span class="txt9">Events Attended </span>
                                @else
                                        
                                @endif
                            </div>

                        </div>

                    </div>
                  </div>
                </div>
              </div>
              


        </div>



    </div>


   <!--  <h6 class="mt-5">Focuses</h6>
    <p>{{ $homeopath->HomeopathProfile->focuses??'' }}</p> -->


    <h6 class="mt-5">Focuses</h6>
    <p style="width: 270px;word-wrap: break-word;">{{ $homeopath->HomeopathProfile->focuses }}</p>


    <h6 class="mt-5">Location</h6>
    <p>{{ $homeopath->HomeopathProfile->location }}</p>

    <h6 class="mt-5">Certifications</h6>
    <p>{{ $homeopath->HomeopathProfile->certifications }}</p>


    <h6 class="mt-5">Affiliations</h6>
    <p>{{ $homeopath->HomeopathProfile->affiliations }}</p>


    <h6 class="mt-5">Contact</h6>
    <p class="font-weight-bold">Tel: <a class="text-dark font-weight-normal" href="tel:{{ $homeopath->phone ?? 'N/A' }}">{{ $homeopath->phone ?? 'N/A' }}</a></p>
    <p class="font-weight-bold">Email: <a class="text-dark font-weight-normal" href="mailto:{{ $homeopath->email }}">{{ $homeopath->email }}</a></p>

</div>
