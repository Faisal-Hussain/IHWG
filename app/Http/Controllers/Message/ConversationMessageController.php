<?php

namespace App\Http\Controllers\Message;

use App\Http\Controllers\Controller;
use App\Models\Conversation;
use App\Models\Message;
use App\Models\Notification;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Mockery\Matcher\Not;

class ConversationMessageController extends Controller
{


    public function saveMessage(Request $req)
    {


        if($req->con_id == 0)
        {
            if(Auth::check())
            {

                $conversation_id = Conversation::where('sender_id', Auth::Id())->where('receiver_id', $req->receiver_id)->pluck('id')->first();
                if(is_null($conversation_id))
                {
                    $conversation_id = Conversation::where('receiver_id', Auth::Id())->where('sender_id', $req->receiver_id)->pluck('id')->first();
                }

                if(is_null($conversation_id))
                {
                    $conversation_id = Conversation::create([
                        'sender_id' => auth()->user()->id,
                        'receiver_id' => $req->receiver_id
                    ]);

                    $conversation_id = $conversation_id->id;

                }
            }

        }
        else{
            $conversation_id=$req->con_id;
        }

        $m = new Message();
        $m->conversation_id = $conversation_id;
        $m->user_id = Auth::Id();
        $m->message = $req->message;
        $m->ip = $req->ip();
        $m->save();

        Conversation::where('id',$conversation_id)->update([
            'updated_at'=>now(),
        ]);
        $conv=Conversation::where('id',$conversation_id)->first();

        $notification_send=$this->notification($req);
        $nofication=Notification::where('user_id',Auth::id())->where('is_read',0)->get()->count();

        $conv->notification_id=$notification_send->id;
        $conv->total_notification=$nofication;

        return response()->json($conv);

    }


    public function getchat(Request $req)
    {

        if($req->id != '0')
        {
            $conversations = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->orderBy('updated_at','DESC')->get();




            $con = Conversation::where('id',$req->id)->with('messages')->first();

            Message::where('conversation_id',$con->id)->where('user_id','!=',auth()->user()->id)->update([
                'is_read'=>true
            ]);
        }
        else{
            $conversations = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->with('messages')->orderBy('updated_at','Asc')->get();
        }

//        return response()->json($conversations);
//
        return view('ajax.message', get_defined_vars());
    }

    public function getMessage($id)
    {
        $data=Conversation::with('messages')->where('sender_id',auth()->user()->id)->Where('receiver_id',$id)->orderBy('updated_at','Asc')->get();

        return response()->json($data);
    }


    public function notification($req){
        $notification=Notification::where('user_id',$req->receiver_id)->where('notification_from',User::find(Auth::id())->name)->where('notification_to',User::find($req->receiver_id)->name)->where('type','message')->where('is_read',0)->first();

        if ($notification)
        {
            $notification->count=$notification->count+1;
            $notification->save();
        }else{
            $notification=new Notification();
            $notification->user_id=$req->receiver_id ??'';
            $notification->sender_id=Auth::id() ??'';
            $notification->notification_from=User::find(Auth::id())->name??'';
            $notification->notification_to=User::find($req->receiver_id)->name;
            $notification->notification_text='New Message from '.User::find(Auth::id())->name;
            $notification->type='message';
            $notification->save();
        }

        return $notification;
    }
}
