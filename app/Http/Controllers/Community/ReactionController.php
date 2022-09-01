<?php

namespace App\Http\Controllers\Community;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forum;
use App\Models\ForumReaction;
use Auth;
use Str;



class ReactionController extends Controller
{
    public function forumReactUpdate(Request $req)
    {






        $reaction = ForumReaction::whereUserId(Auth::id())->whereForumId(base64_decode($req->forum_id))->first();


        if($reaction)
        {
            $reaction->delete();
        }   
        else
        {
            ForumReaction::create(['user_id' => Auth::Id(), 'forum_id' => base64_decode($req->forum_id)]);
        }

        $forum = Forum::withCount('forumReactions')->whereId(base64_decode($req->forum_id))->pluck('forum_reactions_count');
        return response()->json(['likes' => $forum]);


    }

}