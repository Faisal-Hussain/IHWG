<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\AlbumPhoto;


class UserSocialAlbums extends Model
{
    use HasFactory;
    Protected $guarded=[];

     public function albumPhotos()
    {
        return $this->hasMany(AlbumPhoto::class, 'album_id');
    }
}
