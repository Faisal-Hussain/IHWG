<?php

namespace App\Http\Controllers;

use App\Models\Follower;
use App\Models\SocialPosts;
use App\Models\User;
use App\Models\ShopOrder;
use Illuminate\Http\Request;
use Auth;
use Session;


class HomeController extends Controller
{

    public function __construct()
    {
        $this->middleware(['auth', 'verified']);
    }
    public function redirectDashboard()
    {


      if(Auth::User()->role == 'admin')
      {
        return redirect()->route('admin.dashboard');
      }

      if(Auth::User()->role == 'advocate')
      {
        return redirect()->route('advocate.dashboard');
      }

      if(Auth::User()->role == 'homeopath')
      {
        return redirect()->route('homeopath.dashboard');
      }

      if(Auth::User()->role == 'user')
      {
        return redirect()->route('user.dashboard');
      }

      return redirect()->route('index');

    }
    public function orderDetail($id)
    {
        $order = ShopOrder::where('user_id',Auth::id())->with(['orderProducts', 'user'])->findOrFail($id);

        return view('front.shop.order.detail', get_defined_vars());
    }

    public function searchUser(Request $request)
    {
        $connects=User::with('followings')->Where('name', 'like', '%' . $request->saerch_element. '%')->where('id','!=',\Illuminate\Support\Facades\Auth::id())->get();
        $followers=Follower::where('follower_id',\Illuminate\Support\Facades\Auth::id())->get();
        $comment_id=null;
        $search_name=$request->saerch_element;
        return view('vendor.social-network.index',get_defined_vars());
    }

    public function followUser(int $profileId)
    {

        $user = User::find($profileId);
        if(! $user) {

            return redirect()->back()->with('error', 'User does not exist.');
        }

        $auth_user =  User::find(auth()->id());

        $auth_user->userSocialfollowers()->attach($user);
//        $user->followers()->attach(auth()->user()->id);
        return response()->json($user);
    }

    public function unFollowUser(int $profileId)
    {

        $user = User::find($profileId);
        if(! $user) {

            return redirect()->back()->with('error', 'User does not exist.');
        }
        $auth_user =  User::find(auth()->id());
        $auth_user->userSocialfollowers()->detach($user->id);
        return response()->json($user);
    }

}
