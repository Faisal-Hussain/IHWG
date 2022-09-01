<?php

namespace App\Http\Controllers\Advocate;

use App\Http\Controllers\Controller;
use App\Models\SocialPostComment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SocialPostCommentsController extends Controller
{

    public function save_comment(Request $request)
    {

        if ($request->comment==null)
        {
        }
        else
        {
            if ($request->parent_comment_id)
            {
                $social_post_comment=SocialPostComment::create([
                    'user_id'           => Auth::Id(),
                    'social_post_id'    =>$request->parent_post_id,
                    'parent_id'         =>$request->parent_comment_id,
                    'comment'           =>$request->comment,
                ]);

            }else{
                $social_post_comment=SocialPostComment::create([
                    'user_id'           => Auth::Id(),
                    'social_post_id'    =>$request->parent_post_id,
                    'parent_id'         =>null,
                    'comment'           =>$request->comment,
                ]);
            }

            $comment = SocialPostComment::find($social_post_comment->id);
            return response()->json(['comments' => $comment]);
        }

    }

    public function deleteComment($id)
    {

        SocialPostComment::find($id)->delete();
        return response()->json(200);
    }
}
