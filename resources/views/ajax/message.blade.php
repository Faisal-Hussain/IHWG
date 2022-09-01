<style>
    /*---------chat window---------------*/

    .inbox_people {
        background: #fff;
        float: left;
        overflow: hidden;
        width: 30%;
        border-right: 1px solid #ddd;
    }

    .inbox_msg {
        border: 1px solid #ddd;
        clear: both;
        overflow: hidden;

    }

    .top_spac {
        margin: 20px 0 0;
    }

    .recent_heading {
        float: left;
        width: 40%;
    }

    .srch_bar {
        display: inline-block;
        text-align: right;
        width: 60%;
    }

    .headind_srch {
        padding: 10px 29px 10px 20px;
        overflow: hidden;
        border-bottom: 1px solid #c4c4c4;
    }

    .recent_heading h4 {
        color: #0465ac;
        font-size: 16px;
        margin: auto;
        line-height: 29px;
    }

    .srch_bar input {
        outline: none;
        border: 1px solid #cdcdcd;
        border-width: 0 0 1px 0;
        width: 80%;
        padding: 2px 0 4px 6px;
        background: none;
    }

    .srch_bar .input-group-addon button {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        padding: 0;
        color: #707070;
        font-size: 18px;
    }

    .srch_bar .input-group-addon {
        margin: 0 0 0 -27px;
    }

    .chat_ib h5 {
        font-size: 15px;
        color: #464646;
        margin: 0 0 8px 0;
    }

    .chat_ib h5 span {
        font-size: 13px;
        float: right;
    }

    .chat_ib p {
        font-size: 12px;
        color: #989898;
        margin: auto;
        display: inline-block;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
    }

    .chat_img {
        float: left;
        width: 11%;
    }

    .chat_img img {
        width: 100%
    }

    .chat_ib {
        float: left;
        padding: 0 0 0 15px;
        width: 88%;
    }

    .chat_people {
        overflow: hidden;
        clear: both;
    }

    .chat_list {
        border-bottom: 1px solid #ddd;
        margin: 0;
        padding: 18px 16px 10px;
        cursor: pointer;
        border-radius: 5px;
    }

    .inbox_chat {
        height: 420px;
        overflow-y: scroll;

    }

    .active_chat {
        background: #e8f6ff;
    }

    .incoming_msg_img {
        display: inline-block;
        width: 6%;
    }

    .incoming_msg_img img {
        width: 100%;
    }

    .received_msg {
        display: inline-block;
        padding: 0 0 0 10px;
        vertical-align: top;
        width: 92%;

    }

    .received_withd_msg p {
        background: #ebebeb none repeat scroll 0 0;
        border-radius: 0 15px 15px 15px;
        color: #646464;
        font-size: 14px;
        margin: 0;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }

    .time_date {
        color: #747474;
        display: block;
        font-size: 12px;
        margin: 8px 0 0;
    }

    .received_withd_msg {
        width: 57%;
    }

    .mesgs{
        float: left;
        padding: 30px 15px 0 25px;
        width:70%;
    }

    .sent_msg p {
        background:#0465ac;
        border-radius: 12px 15px 15px 0;
        font-size: 14px;
        margin: 0;
        color: #fff;
        padding: 5px 10px 5px 12px;
        width: 100%;
    }

    .outgoing_msg {
        overflow: hidden;
        margin: 26px 0 26px;
    }

    .sent_msg {
        float: right;
        width: 46%;
    }

    .input_msg_write input {
        background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
        border: medium none;
        color: #4c4c4c;
        font-size: 15px;
        min-height: 48px;
        width: 100%;
        outline:none;

    }

    .type_msg {
        border-top: 1px solid #c4c4c4;
        position: relative;
        border-radius: 30px;
        font-size: 12px;
        background-color: #cac6c6;
    }

    .msg_send_btn {
        background: #05728f none repeat scroll 0 0;
        border:none;
        border-radius: 50%;
        color: #fff;
        cursor: pointer;
        font-size: 15px;
        height: 33px;
        position: absolute;
        right: 0;
        top: 5px;
        width: 33px;
        margin-right: 5px;
    }

    .messaging {
        padding: 0 0 50px 0;
    }

    .msg_history {
        height: 340px;
        overflow-y: auto;
    }
    .msg_history::-webkit-scrollbar {
        width: 5px;
    }
    .inbox_chat::-webkit-scrollbar {
        width: 5px;
    }
    .rounded-circle
    {
        width: 45px !important;
    }
    /* Track */
::-webkit-scrollbar-track {
        background: #f1f1f1;
    }

    /* Handle */
::-webkit-scrollbar-thumb {
        background: #888;
    }

    /* Handle on hover */
 ::-webkit-scrollbar-thumb:hover {
        background: #555;
    }
</style>

<div class="inbox_people">

    <div class="inbox_chat scroll">

        @if(count($conversations)>0)
            @foreach($conversations as $conversation)
                <div class="chat_list @if($req->id==$conversation->id) active_chat @endif">
                    @if($conversation->sender_id==auth()->user()->id)
                        @php $starter=$conversation->receiver;  @endphp
                    @else
                        @php $starter=$conversation->sender;  @endphp
                    @endif
                    <input type="hidden" class="conversation_id" value="{{$conversation->id}}">
                    <a class="change-chat" data-receiver-id="{{$starter->id}}"  data-id="{{$conversation->id}}" href="javascript:;">
                        <div class="chat_people">
                            <div class="chat_img"> <img src="{{asset($starter->avatar)}}" class="rounded-circle" alt=""> </div>
                            <div class="chat_ib">
                                <h5 class="m-1  title-color text-capitalize">{{$starter->name}} @if(count($conversation->messages->where('is_read',false)->where('user_id','!=',auth()->user()->id))>0)<span class="badge badge-theme chat_date">{{count($conversation->messages->where('is_read',false)->where('user_id','!=',auth()->user()->id))}}</span>@endif</h5>
                            </div>
                        </div>
                    </a>

                </div>
            @endforeach
        @else
            <h6 class="text-center mt-4"><i class="ion-ios-chatboxes"></i> 0 message </h6>
        @endif
    </div>
</div>

@if($req->id != 0)
    <div class="mesgs" >
        <div class="msg_history px-2" id="scroll">


            @foreach($con->messages as $message)

                @if($message->user_id == auth()->user()->id)
                    <div class="outgoing_msg">
                        <div class="sent_msg">
                            <p>{{$message->message}}</p>
                            <span class="time_date"> {{$message->created_at->format('H:i')}}    |    {{$message->created_at->format('d M')}}</span> </div>
                    </div>
                @else


                    <div class="incoming_msg mb-3">
                        <div class="incoming_msg_img"> <img src="{{asset($message->user->avatar)}}" class="rounded-circle" alt="sunil"> </div>
                        <div class="received_msg">
                            <div class="received_withd_msg">
                                <p class="bg-gray">{{$message->message}}</p>
                                <span class="time_date"> {{$message->created_at->format('H:i')}}    |    {{$message->created_at->format('d M')}}</span></div>
                        </div>
                    </div>

                @endif


            @endforeach

        </div>

        <div class="type_msg bg-white">
            <div class="input_msg_write">
                <input type="hidden" name="" value="{{ $con->id ?? '' }}" id="convo_id" name="convo_id">

                <input type="text" type="text"  autocomplete="off" placeholder="Type a message" id="message" name="message" aria-describedby="button-addon2" class="message-input write-message px-2" />
                <button class="msg_send_btn" id="btnSend" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
        </div>
    </div>
@else


@endif
