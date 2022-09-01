<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeopathLibrary extends Model
{
    use HasFactory;

    protected $guarded = [];
    


     public function setTitleAttribute($value)
    {
        $this->attributes['title'] = strtoupper($value);
    }



    public function homeopathCategory()
    {
        return $this->belongsTo('App\Models\HomeopathCategory');
    }
}
