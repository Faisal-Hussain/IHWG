<?php

namespace App\Http\Controllers\Community;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Forum;
use App\Models\ForumReaction;
use Auth;
use Str;

class CommunityController extends Controller
{
    public function index()
    {

        $forums = Forum::withCount('forumReactions', 'forumComments')->latest()->paginate(20);       
        return view('vendor.community.index', get_defined_vars());
    }

    public function show($id, $slug)
    {

        $forum = Forum::with('forumReactions', 'forumComments')->whereUuid($id)->first();
        $forum->increment('views');


        if(Auth::check())
        {
            $check_reaction = ForumReaction::whereUserId(Auth::id())->whereForumId($forum->id)->count();
        }


        return view('vendor.community.show', get_defined_vars());
    }

    public function create(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'forum_category_id' => 'required',
            'description' => 'required',
        ]);


        Forum::create(
            $req->except('files')  
            + 
            [
                'user_id' => Auth::Id(),
                'uuid'    => date('dmyhis'),
                'slug'    => Str::Slug($req->title)
            ]);

        return back()->withMessage('Discussion has been added.');

    }


    public function update(Request $req)
    {
     


        request()->validate([
            'title' => 'required',
            'forum_id' => 'required',
            'forum_category_id' => 'required',
            'description' => 'required',
        ]);


        Forum::find(base64_decode($req->forum_id))->update($req->except(['files', 'forum_id' ])  + ['slug'    => Str::Slug($req->title)]);

        return back()->withMessage('Discussion has been updated.');

    }

    
    public function searchCategory($slug)
    {
        $forums = Forum::withCount('forumReactions', 'forumComments')->whereHas('forumCategory', function ($q) use ($slug) {
            $q->where('title', $slug);
        })->latest()->paginate(20); 
      
        return view('vendor.community.index', get_defined_vars());

    }





    public function remove($id)
    {
        Forum::find(base64_decode($id))->delete();
        return redirect()->route('community.index')->withMessage('Forum has been removed.');        
    }
    
    
}
