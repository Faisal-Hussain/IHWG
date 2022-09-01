<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialPost extends Model
{
    use HasFactory;
    protected $table='social_posts';
    protected $guarded=[];

    public function likes()
    {
        return $this->hasMany(SocialPostLike::class,'social_post_id','id');
    }
    public function comments()
    {
        return $this->hasMany(SocialPostComment::class,'social_post_id','id')->whereNull('parent_id');

    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id','id');
    }

    public function socialGroup()
    {
        return $this->belongsTo(UserSocialGroup::class,'user_social_group_id');
    }
    

    public function socialPostTags()
    {    
        return $this->hasMany(SocialPostTag::class,'social_post_id');
    }


}
