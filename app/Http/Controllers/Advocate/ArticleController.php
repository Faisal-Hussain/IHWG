<?php

namespace App\Http\Controllers\Advocate;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Article;
use Str;
use Auth;
class ArticleController extends Controller
{


    public function index()
    {
        $articles = Article::whereUserId(Auth::id())->orderBy('updated_at', 'ASC')->get();
        return view('advocate.articles.index', get_defined_vars());
    }

    public function create()
    {
        return view('advocate.articles.add-edit', get_defined_vars());
    }


    public function store(Request $request)
    {

        $request->validate([
            'title'     =>'required',
            'slug'      =>'required',
            'category'  =>'required',
            'summary'   =>'required',
            'body'      =>'required',
            'keywords'  =>'required',
            'featured_image'=>'required|mimes:jpg,jpeg,png |max:4096',
          ]);


        $post           = new Article();
        $post->user_id  = Auth::Id();
        $post->title    = $request->title;
        $post->slug     = $request->slug;
        $post->uuid     = date('dmyhis');
        $post->category = $request->category;
        $post->summary  = $request->summary;
        $post->body     = $request->body;
        $post->keywords = $request->keywords;

        if(isset($request->featured_image))
        {
            $post->featured_image = uploadImage($request->featured_image, 'uploads/articles');
        }
        else
        {
            $post->featured_image ='uploads/articles/default-article.png';
        }

        $post->save();
        return redirect()->route('advocate.articles.index')->with('message', 'Article has been created!');
    }


    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        $article = Article::findOrFail(base64_decode($id));
        return view('advocate.articles.add-edit', get_defined_vars());
    }

    public function update(Request $request, $id)
    {


   $request->validate([
            'title'     =>'required',
            'slug'      =>'required',
            'category'  =>'required',
            'summary'   =>'required',
            'body'      =>'required',
            'keywords'  =>'required',
          ]);


        $post = Article::findOrFail($id);
        $post->title    = $request->title;
        $post->slug     = $request->slug;
        $post->category = $request->category;
        $post->summary  = $request->summary;
        $post->body     = $request->body;
        $post->keywords = $request->keywords;

        if(isset($request->featured_image))
        {

        $request->validate([
            'featured_image'=>'required|mimes:jpg,jpeg,png |max:4096'
        ]);

            $post->featured_image = uploadImage($request->featured_image, 'uploads/blogs');
        }
        else
        {
            $post->featured_image = $post->featured_image;
        }


        $post->save();
        return redirect()->route('advocate.articles.index')->with('message', 'article has been updated!');
    }


    public function destroy($id)
    {
        Article::find(base64_decode($id))->delete();
        return redirect()->back()->with('message', 'article has been deleted.');
    }
}
