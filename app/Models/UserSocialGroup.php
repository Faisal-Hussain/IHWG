<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserSocialGroup extends Model
{
    use HasFactory;

    protected $guarded=[];


    public function userFollowers()
    {
        return $this->morphToMany(User::class, 'following')->wherePivot('status', 'active');
    }

    public function pendingUserFollowers()
    {
        return $this->morphToMany(User::class, 'following')->wherePivot('status', 'pending');
    }



    public function userGroupPosts()
    {
        return $this->hasMany('App\Models\SocialPost', 'user_social_group_id');
    }


}
