<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HomeopathCategory;
use App\Models\HomeopathLibrary;
use Str;

class ExploreHomeopathController extends Controller
{
    public function __construct()
    {
        $this->middleware(['permission:homeopath_library']);
    }

    public function index()
    {

        $categories = HomeopathCategory::with('homeopathLibraries')->get();
        $libraries  = HomeopathLibrary::latest()->get();

        return view('admin.homeopath.index', get_defined_vars());
    }


    public function categoryCreate(Request $req)
    {
        request()->validate([
            'title' => 'required',
        ]);


        $category = HomeopathCategory::whereTitle($req->title)->count();

        if($category > 0)
        {
            return back()->withError('Whoops! '.$req->title.' category already exist.');
        }

        HomeopathCategory::create([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Category has been added.');

    }    


    public function categoryUpdate(Request $req)
    {

        request()->validate([
            'title' => 'required',
            'id'   => 'required'
        ]);


        $category = HomeopathCategory::whereTitle($req->title)->count();

        if($category > 0)
        {
            return back()->withMessage($req->title.' category already exist. No need to update.');
        }

        HomeopathCategory::find($req->id)->update([
            'title' => $req->title,
            'slug'    => Str::Slug($req->title)
        ]);

        return back()->withMessage('Category has been updated.');

    }


    public function libraryCreate(Request $req)
    {

        request()->validate([
            'homeopath_category_id' => 'required',
            'title'       => 'required',
            'description' => 'required'
        ]);

        HomeopathLibrary::create($req->except('files', 'lib_id'));
        return back()->withMessage('Libraray has been added.');
    }

    public function libraryUpdate(Request $req)
    {

        request()->validate([
            'homeopath_category_id' => 'required',
            'title'       => 'required',
        ]);


        $lib = HomeopathLibrary::find($req->lib_id);
        $lib->title =  $req->title;
        $lib->homeopath_category_id =  $req->homeopath_category_id;
        $lib->description =  $req->description ?? $lib->description;
        $lib->save();

        return back()->withMessage('Libraray has been updated.');
    }

    



    public function categoryRemove($id)
    {
        HomeopathCategory::find($id)->delete();
        return back()->withMessage('Category has been removed.');
    }

    public function libraryRemove ($id)
    {
        HomeopathLibrary::find($id)->delete();
        return back()->withMessage('Libraray has been removed.');
    }
    





}
