<?php

namespace App\Http\Controllers\Community;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forum;
use App\Models\ForumComment;
use Auth;
use Str;



class CommentController extends Controller
{
    public function create(Request $req)
    {

        request()->validate([
            'forum_id' => 'required',
            'description' => 'required',
        ]);

        ForumComment::create($req->except(['files', 'forum_id']) + ['user_id' => Auth::Id(), 'forum_id' => base64_decode($req->forum_id)]);

        return back()->withMessage('Comment has been posted.');

    }


    public function remove($id)
    {
        ForumComment::find(base64_decode($id))->delete();
        return back()->withMessage('Comment has been trashed.');        
    }


}
