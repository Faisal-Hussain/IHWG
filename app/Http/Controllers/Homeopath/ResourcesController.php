<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HomeopathResource;
use Auth;
use Crypt;

class ResourcesController extends Controller
{
    public function index()
    {
        return view('homeopath.resources.index', get_defined_vars());
    }


    public function create(Request $req)
    {

         $req->validate([
            'title' => 'required',
            'description' => 'required',
            'image' => 'mimes:jpg,jpeg,png,bmp,tiff|max:20000',
        ]);

         if ($req->image) 
         {
             $image = uploadImage($req->image, 'uploads/resources');
         }
        
          
        if($req->attachment)
        {
            
			$req->validate([
                "attachment" => 'required|mimes:pdf|max:10000'
            ]);
            $pdf = uploadImage($req->attachment, 'uploads/resources/pdf');
            
        }
		
        // HomeopathResource::create($req->except('image') + ['image' => $image, 'user_id' => Auth::id()]);
        HomeopathResource::create([
            'user_id'=>Auth::user()->id,
            'image'=>$image??'',
            'title'=>$req->title,
            'description'=>$req->description,
            'attachment'=> $pdf ?? NULL,
        ]);
        return back()->with('message', 'Resource has been added.');

    }


    public function update(Request $req)
    {


         $req->validate([
            'title' => 'required',
            'description' => 'required'
        ]);




        $resource = HomeopathResource::findOrFail(Crypt::decrypt($req->id));

        if($req->image)
        {

            $req->validate([
                'image' => 'mimes:jpg,jpeg,png,bmp,tiff|max:20000',
            ]);

            $file = uploadImage($req->image, 'uploads/resources');
        }

        if($req->attachment)
        {

			$req->validate([
                "attachment" => "required|mimes:pdf|max:10000",
            ]);
           $pdf = uploadImage($req->attachment, 'uploads/resources/pdf');
        }


        $resource->update($req->except(['image', 'id']));
        $resource->update(['image' => $file ?? $resource->image]);
        $resource->update(['attachment' => $pdf ?? $resource->attachment]);

        return back()->with('message', 'Resource has been updated.');

    }




    public function delete($id)
    {
        HomeopathResource::find(Crypt::decrypt($id))->delete();
        return back()->with('message', 'Resource has been deleted.');
    }


}
