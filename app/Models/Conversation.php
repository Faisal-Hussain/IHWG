<?php

namespace App\Models;

use App\Traits\SyncsWithFirebase;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Conversation extends Model
{
    use HasFactory,SyncsWithFirebase;
    protected $guarded=[];

    public function messages()
    {
        return $this->hasMany(Message::class,'conversation_id');
    }
    public function sender()
    {
        return $this->belongsTo(User::class, 'sender_id','id');
    }

    public function receiver()
    {
        return $this->belongsTo(User::class, 'receiver_id','id');
    }
}

