<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Hash;
use App\Models\User;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use DB;
use Str;
use App\Jobs\AdminTeamRegisteredMailJob;

class TeamController extends Controller
{

    public function __construct()
    {
        $this->middleware(['permission:browse_teams']);
    }

    public function index()
    {
        $roles = Role::all();
        $users = User::whereHas('roles')->with('roles')->get();
        return view('admin.teams.teams', get_defined_vars());
    }

    public function create()
    {
        //
    }

    public function store(Request $request)
    {

        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'role' => 'required'
        ]);


        $random_password = Str::random(10);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'role' => 'admin',
            'password' => Hash::make($random_password)
        ]);
        $user->assignRole($request->role);


        $data = [
            'name'     => $user->name,
            'email'    => $user->email,
            'password' => $random_password,
            'app_name' => env('APP_NAME'),
            'subject'  => strip_tags(emailSetting('sub_admin_email')->subject) ??'You have been assigned sub admin at '.env('APP_NAME'),
        ];

        dispatch(new AdminTeamRegisteredMailJob($data))->delay(now()->addSeconds(2));

        return redirect()->route('admin.teams.index')->with('message','Team Member has been created.');

    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function remove($id)
    {
        User::find($id)->delete();
        return back()->with('message','Team Member has been deleted.');
    }

}
