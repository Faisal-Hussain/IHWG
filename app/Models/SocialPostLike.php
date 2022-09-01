<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialPostLike extends Model
{
    use HasFactory;
    protected $guarded=[];
    protected $table='social_post_likes';

    public function likes(){
        return $this->hasMany(SocialPostLike::class,'social_post_id','id');
    }
}
