<?php

namespace App\Http\Controllers\Advocate;

use App\Http\Controllers\Controller;
use App\Models\SocialPostComment;
use App\Models\SocialPostLike;
use App\Models\SocialPost;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class SocialNetworkController extends Controller
{

    public function socialNetwork(Request $request)
    {

        $posts=SocialPost::with('likes','user','comments')->orderBy('id','desc')->paginate(5);
        $comment_id=null;
        $connects=null;
        if ($request->ajax()) {
            return view('advocate.ajax.loadpost', get_defined_vars());
        }
        return view('advocate.social-network.index', get_defined_vars());


    }
    public function jqueryLoadMore(Request $request)
    {
        $posts=SocialPost::with('likes','user','comments')->orderBy('id','desc')->paginate(5);

        if ($request->ajax()) {
            return view('advocate.ajax.loadpost', get_defined_vars());
        }
        return view('advocate.social-network.index', get_defined_vars());
    }

    public function save_post(Request $request)
    {
        if ($request->hasFile('file'))
        {
           $value=uploadImage($request->file,'social_posts/file');
        }

        SocialPost::create([
            'caption'=>$request->caption,
            'file'=>$value ?? NULL,
            'user_id'=>Auth::id(),
            'media_type'=>$request->media_type,
        ]);
        return redirect()->back()->with('message','Post is created successfully');
    }
    public function reaction($id)
    {

        $reaction = SocialPostLike::where('user_id',Auth::id())->where('social_post_id',$id)->first();


        if($reaction)
        {
            $reaction->delete();
        }
        else
        {

            SocialPostLike::create(['user_id' => Auth::Id(),'social_post_id' =>$id]);
        }

        $total_likes = SocialPostLike::where('social_post_id',$id)->get();
        $total_likes=count($total_likes);
        return response()->json(['likes' => $total_likes]);

    }
}
