<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\ReportUser;
use App\Models\User;
use Crypt;

class ReportController extends Controller
{
    public function reports()
    {
        $reports = ReportUser::orderBy('id', 'DESC')->get();
        return view('admin.reports.reports', get_defined_vars());
    }


    public function reportsStatusUpdate(Request $req)
    {


        $report = ReportUser::findOrFail(Crypt::decrypt($req->id));
        $user = User::findOrFail($report->user_id);

        if($req->status  == 'block')
        {
            $user->update(['status' => 'disabled']);
            $report->update(['status' => 'closed']);
            return response()->json('User has been blocked');
        }
        else
        {
            $report->delete();
            return response()->json('Report has been trashed');
        }

        


    }

}
