<div class="p-0 m-0" style="border:2px solid #ccc;">
    <div class="row mb-4 mt-5">
             <div class="col-md-12 text-center">
                 <img src="{{ asset($homeopath->avatar??'') }}"  style="border-radius: 100px; width: 70px;height: 70px;border: 2px solid red;">

                 <h6>{{ $homeopath->name??'' }}</h3>
                 <p class="text-primary">{{ $homeopath->HomeopathProfile->designation??'' }}</p>
             </div>
         </div>

         <div class="row px-3">
             <div class="col-md-4 col-4 text-center">
                 <p class="font-weight-bold mb-1">{{$homeopath->socialPosts()->count()}}</p>
                 <p style="font-size: 9px; font-weight:bold">Posts</p>
             </div>
             <div class="col-md-4 col-4 text-center">
                 <p class="font-weight-bold mb-1">{{$homeopath->userFollowings()->count()}}</p>
                 <p style="font-size: 9px; font-weight:bold;text-align: center;">Connections</p>
             </div>
             <div class="col-md-4 col-4 text-center">
                 <p class="font-weight-bold mb-1">{{$homeopath->userSocialGroups()->count()}}</p>
                 <p style="font-size: 9px; font-weight:bold">Group</p>
             </div>
         </div>
     <br><br>
         <div class="row text-center mt-5">
             <div class="col-md-12">
                 <!-- <button class="btn btn-sm text-center btn-primary">connect</button> -->
             </div>
         </div>
</div>
