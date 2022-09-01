<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SocialPostComment extends Model
{
    use HasFactory;
    protected $guarded=[];

    public function child()
    {
        return $this->hasMany(SocialPostComment::class, 'parent_id');
    }
    public function parent()
    {
        return $this->belongsTo(SocialPostComment::class, 'parent_id');
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    


}
