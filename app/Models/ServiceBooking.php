<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ServiceBooking extends Model
{
    use HasFactory;
    
    protected $guarded = [];

    public function HomeopathService()
    {
        return $this->belongsTo('App\Models\HomeopathService');
    }

    public function user()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    public function prescription()
    {
        return $this->hasOne('App\Models\ServiceBookingPrescription', 'service_booking_id');
    }
    

}
