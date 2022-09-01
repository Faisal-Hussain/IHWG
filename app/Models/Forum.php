<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Forum extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function forumCategory()
    {
        return $this->belongsTo('App\Models\ForumCategory', 'forum_category_id');
    }

    public function forumReactions()
    {
        return $this->hasMany('App\Models\ForumReaction');
    }

    public function forumComments()
    {
        return $this->hasMany('App\Models\ForumComment');
    }
    
    
    

}
