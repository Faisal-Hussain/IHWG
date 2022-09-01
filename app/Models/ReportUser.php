<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReportUser extends Model
{
    use HasFactory;    
    protected $guarded = [];


    public function reportedBy()
    {
        return $this->belongsTo('App\Models\User', 'reported_by');
    }

    public function reportedUser()
    {
        return $this->belongsTo('App\Models\User', 'user_id');
    }

    

}
