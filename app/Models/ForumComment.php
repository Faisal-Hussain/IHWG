<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ForumComment extends Model
{
    use HasFactory;

    protected $guarded = [];

        public function user()
        {
            return $this->belongsTo('App\Models\User', 'user_id');
        }
    

}
