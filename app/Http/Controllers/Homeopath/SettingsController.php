<?php

namespace App\Http\Controllers\homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HomeopathService;
use App\Models\HomeopathProfile;
use App\Models\HomeopathDocument;
use App\Models\HomeopathImage;
use App\Models\Setting;
use Auth;
use File;

class SettingsController extends Controller
{
    public function index()
    {
        return view('homeopath.settings.index', get_defined_vars());
    }

    public function updateImages(Request $req)
    {

        if($req->action == 'images')
        {


            if(isset($req->image))
                {
                    if ($req->id==null) {
                        foreach($req->image as $image)
                        {

                            $_images = new HomeopathImage();
                            $_images->user_id = Auth::id();
                            $_images->image = uploadImage($image, 'uploads/homeopath/');
                            $_images->save();
                        }
                    }
                }

                if($req->removeimage)
                {
                    $myArray = explode(',', rtrim($req->removeimage, ','));
                    foreach($myArray as $item)
                    {
                        HomeopathImage::whereId($item)->delete();
                    }
                }

                if ($req->id) {
                    foreach($req->image as $image)
                    {
                        $_images =  HomeopathImage::find($req->id);
                        $_images->user_id = Auth::id();
                        $_images->image = uploadImage($image, 'uploads/homeopath/');
                        $_images->save();

                    }
                }


                return back()->withMessage('Images has been updated.');



        }
        else
        {

            if(isset($req->image))
            {

                foreach($req->image as $image)
                {

                    $_images = new HomeopathDocument();
                    $_images->user_id = Auth::id();
                    $_images->file = uploadImage($image, 'uploads/homeopath/documents/');
                    $_images->save();
                }
            }

            if($req->removeFiles)
            {
                $myArray = explode(',', rtrim($req->removeFiles, ','));
                foreach($myArray as $item)
                {
                    HomeopathDocument::whereId($item)->delete();
                }
            }

                if ($req->pdf)
                {

                    $pdf = uploadImage($req->pdf, 'uploads/documents/users/');

                    if($req->age_type == 'inner_doc')
                    {
                        HomeopathService::findOrfail($req->service_id)->update(['child_service_document' => $pdf ]);
                    }
                    else
                    {
                         HomeopathService::findOrfail($req->service_id)->update(['adult_service_document' => $pdf ]);
                    }



                    return back()->withMessage('Document has been Saved.');
                }


            return back()->withMessage('Documents has been updated.');

        }






    }


    public function setHomeopathServiceTime(Request $request)
    {

        $homeopath=HomeopathProfile::where('user_id',$request->id)->first();
        $homeopath->service_time_interval =$request->set_time;
        $homeopath->save();
        return back()->with('message','Time has been set');
    }

}
