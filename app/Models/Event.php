<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    protected $guarded = [];


    public function eventTimings()
    {
        return $this->hasMany('App\Models\EventTiming');
    }
    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }


}
