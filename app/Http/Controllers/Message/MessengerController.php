<?php

namespace App\Http\Controllers\Message;

use App\Http\Controllers\Controller;
use App\Models\Conversation;
use App\Models\Message;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class MessengerController extends Controller
{

    public function messenger(Request $request)
    {
        if($request->id!==null)
        {
//            $conversations = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->orderBy('updated_at','DESC')->get();
            $con = Conversation::where('id',$request->id)->with('messages')->first();
        }
        else{
//            $conversations = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->orderBy('updated_at','DESC')->get();
            $con = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->orderBy('updated_at','DESC')->first();
            $con = null;
        }



        return view('user.chat.message',get_defined_vars());
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
            $conversations = Conversation::where('sender_id',auth()->user()->id)->orWhere('receiver_id',auth()->user()->id)->orderBy('updated_at','DESC')->get();
        }

        return view('ajax.message', get_defined_vars());
    }

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

        return response()->json('sent');

    }

    public function inquiryEmail(Request $request)
    {
        $user=auth()->user();
        $post=Posts::where('pid',$request->pid)->first();
        sendMail([
            'view' => 'email.inquiry',
            'to' => $post->email,
            'subject' => 'Mandet Email Inquiry',
            'name' => auth()->user()->name,
            'data' => [ 'user' => $user,'post'=>$post,'message'=>$request->message

            ]
        ]);
        return redirect()->back()->with('message','Email Sent successfully');
    }

}
