<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Article;

class ArticleController extends Controller
{
    public function articles()
    {
    	$articles = Article::latest()->paginate(12);
    	return view('front.articles.articles', get_defined_vars());
    }

    public function articleDetail($uuid, $slug)
    {
        
    	$article  = Article::whereUuid($uuid)->first();

    	if(!$article)
    	{
    		abort(404);
    	}

    	return view('front.articles.article', get_defined_vars());
    }

}
