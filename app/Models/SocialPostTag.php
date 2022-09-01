<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialPostTag extends Model
{
    use HasFactory;

    
    protected $guarded = [];
    
    public function userTags()
    {
        return $this->morphToMany(User::class, 'following');
    }

    public function socialPost()
    {
        return $this->belongsTo(socialPost::class);
    }
    


}
