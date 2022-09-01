<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EventTiming extends Model
{
    use HasFactory;
    protected $guarded = [];


    public function event()
    {
        return $this->belongsTo('App\Models\Event');
    }

    public function eventRequests()
    {
        return $this->hasMany('App\Models\EventRequest');
    }

    public function zoomMeeting()
    {
        return $this->hasOne('App\Models\ZoomMeeting');
    }
}
