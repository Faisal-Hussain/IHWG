<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeopathCategory extends Model
{
    use HasFactory;
        
    protected $guarded = [];

    public function homeopathLibraries()
    {
        return $this->hasMany('App\Models\HomeopathLibrary');
    }

}
