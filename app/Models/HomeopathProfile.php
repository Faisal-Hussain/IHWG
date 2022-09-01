<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\HomeopathBadgesSetting;

class HomeopathProfile extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function badgeSetting()
    {
    	return $this->hasMany(HomeopathBadgesSetting::class,'homeopath_id','id');
    }
}
