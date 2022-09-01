<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Overtrue\LaravelFollow\Followable;
use Spatie\Permission\Traits\HasRoles;
use Laravel\Cashier\Billable;
use App\Models\UserSocialAlbums;
use App\Models\CartWishList;
use App\Models\Following;
use App\Models\User;
use App\Models\SocialPostTag;
use App\Models\UserSocialGroup;


class User extends Authenticatable implements MustVerifyEmail
{
    use HasFactory, Notifiable, HasRoles;

    protected $guarded = [];

    protected $hidden = [
        'password', 'remember_token',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
    ];


    public function profile()
    {
        return $this->hasOne('App\Models\Profile');
    }

    public function HomeopathProfile()
    {
        return $this->hasOne('App\Models\HomeopathProfile');
    }


    public function userSocialProfile()
    {
        return $this->hasOne('App\Models\UserSocialProfile');
    }




    public function HomeopathServices()
    {
        return $this->hasMany('App\Models\HomeopathService');
    }

    public function events()
    {
        return $this->hasMany('App\Models\Event');
    }

    public function eventRequests()
    {
        return $this->hasMany('App\Models\EventRequest')->with('eventTiming');
    }

    public function HomeopathResources()
    {
        return $this->hasMany('App\Models\HomeopathResource');
    }


    public function HomeopathImages()
    {
        return $this->hasMany('App\Models\HomeopathImage');
    }

    public function HomeopathDocuments()
    {
        return $this->hasMany('App\Models\HomeopathDocument');
    }

    public function serviceBookings()
    {
        return $this->hasMany('App\Models\ServiceBooking');
    }

    public function serviceReviews()
    {
        return $this->hasMany('App\Models\ServiceReview', 'homeopath_id');
    }



    public function followings()
    {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'leader_id')->withTimestamps();
    }




    public function socialPosts()
    {
        return $this->hasMany('App\Models\SocialPost', 'user_id');
    }


    public function userSocialGroups()
    {
        return $this->morphedByMany(UserSocialGroup::class, 'following');
    }


    public function userSocialTags()
    {
        return $this->morphedByMany(SocialPostTag::class, 'following');
    }


    public function userSocialfollowers()
    {
        return $this->morphedByMany(Following::class, 'following');
    }


    public function userFollowers()
    {
        return $this->morphedByMany(User::class, 'following');
    }

    public function userFollowings()
    {
        return $this->morphToMany(User::class, 'following');
    }


    public function userGroups()
    {
        return $this->hasMany('App\Models\UserSocialGroup');
    }

    public function donations()
    {
        return $this->hasMany('App\Models\Donation');
    }

    public function wishlists()
    {
        return $this->hasMany(CartWishList::class,'user_id');
    }


    public function timetables()
    {
        return $this->hasMany('App\Models\Timetable', 'user_id');
    }

    public function homeopathHoliday()
    {
        return $this->hasMany('App\Models\HomeopathHoliday', 'user_id');
    }

    public function userSocialAlbums()
    {
        return $this->hasMany(UserSocialAlbums::class, 'user_id');
    }
    

}
