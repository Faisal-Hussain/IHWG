<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ServiceTheme;


class ServicesController extends Controller
{
    public function index()
    {   
        return view('admin.services.index', get_defined_vars());
    }

    public function create(Request $req)
    {


if (isset(($req->id))) 
{
    $data=ServiceTheme::find($req->id);
        if($req->cover)
        {
           $value=uploadImage($req->cover, 'uploads/services'); 
        }else{
           $value= $data->cover;
        }
        $data->update([
            'title'   => $req->title,
            'color'   => $req->color,
            'cover'   => $value,
        ]);
        return redirect()->route('admin.services.index')->withMessage('Theme has been Updated.');
}
else
{
        ServiceTheme::create([
            'title'   => $req->title,
            'color'   => $req->color,
            'cover'   => uploadImage($req->cover, 'uploads/services')
        ]);

        return back()->withMessage('Theme has been added.');
}
        

    }

    public function edit($id)
    {
        $data=ServiceTheme::find($id);
        return view('admin.services.edit', get_defined_vars());
    }

    public function delete($id)
    {
        ServiceTheme::find($id)->delete();

        return back()->withMessage('Theme has been Deleted.');
    }

}
