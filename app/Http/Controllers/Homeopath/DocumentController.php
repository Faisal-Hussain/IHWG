<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\HomeopathDocument;
use Auth;
use Crypt;

class DocumentController extends Controller
{
    public function index()
    {
        $documents = HomeopathDocument::whereUserId(Auth::id())->orderBy('updated_at', 'DESC')->get();
        return view('homeopath.documents.index', get_defined_vars());
    }

    public function create(Request $req)
    {

        $req->validate([
            'title' => 'required|string|max:255',
        ]);


        $user = HomeopathDocument::create([
            'title'      => $req->title,
            'user_id'    => Auth::id(),
            'file'       => uploadImage($req->file, 'uploads/homeopath/documents/')
        ]);

        return back()->withMessage('Document has been uploaded.');

    }


    public function edit(Request $req)
    {


        $req->validate([
            'id' => 'required',
            'title' => 'required|string|max:255',
        ]);

        $document = HomeopathDocument::findOrFail(Crypt::decrypt($req->id));

        if($req->file)
        {
            $document->file = uploadImage($req->file, 'uploads/homeopath/documents/');
        }

            $document->title = $req->title;
            $document->save();

        return back()->withMessage('Document has been updated.');

    }


}
