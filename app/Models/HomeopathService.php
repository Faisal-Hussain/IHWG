<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeopathService extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function ServiceTheme()
    {
        return $this->belongsTo('App\Models\ServiceTheme', 'service_theme_id');
    }

    public function ServiceBookings()
    {
        return $this->hasMany('App\Models\ServiceBooking');
    }

    public function homeopath()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }



}
