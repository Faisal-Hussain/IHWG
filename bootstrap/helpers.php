<?php

use App\Models\Follower;
use Carbon\Carbon;
use Illuminate\Support\Facades\Mail;
use Image as Image;
use App\Models\Setting;
use Illuminate\Http\Request;
use App\Models\ForumCategory;
use App\Models\ShopBrand;
use App\Models\ShopCategory;
use App\Models\ShopColor;
use App\Models\ShopVariant;
use App\Models\ShopProduct;
use App\Models\ServiceTheme;
use App\Models\ServiceBooking;
use App\Models\UserSocialGroup;
use App\Models\SocialPostTag;
use App\Models\Following;
use App\Models\User;
use App\Models\Event;
use App\Models\EventTiming;
use App\Models\ShopOrder;
use App\Models\Donation;
use App\Models\Badge;
use App\Models\BadgeRequest;
use App\Models\HomeopathProfile;
use App\Models\LocationTex;
use App\Models\Timetable;
use App\Models\AdsSetting;
use App\Models\UserSocialAlbums;
use App\Models\HomeopathBadgesSetting;



    function setting()
    {
        return Setting::pluck('value', 'key')->toArray();
    }

    function emailSetting($key)
    {
         $setting=Setting::where('key',$key)->first()->value??'';
         return $setting=json_decode($setting);
    }
        function sendMail($data)
        {
            Mail::send($data['view'], ['data' => $data['data']], function ($message) use ($data) {
                $message->to($data['to'], $data['name'])->subject($data['subject']);
            });
        }

	function forumCategories()
	{
		return ForumCategory::latest()->get();
	}

    function uploadImage($file, $path){
        $name = time().'-'.str_replace(' ', '-', $file->getClientOriginalName());
        $file->move($path,$name);
        return $path.'/'.$name;
    }


    function shopOptions()
    {

    	return $data = [
            'shop_brands'      	=> ShopBrand::latest()->get(),
            'shop_categories'   => ShopCategory::latest()->get(),
            'shop_colors'       => ShopColor::latest()->get(),
            'shop_variants'     => ShopVariant::latest()->get(),
        ];
    }

    function checkOptionExistence($column, $id)
    {
        return ShopProduct::where($column, $id)->count();
    }

    function commaSeparatedString($string)
    {
        return explode(',', $string);
    }

    function serviceThemes()
    {
        return ServiceTheme::get();
    }

    function illness()
    {
        return $data = [
            'Strep throat',
            'Chicken pocks',
            'Urinary Tract Disease',
            'Anxiety',
            'Panic attacks',
            'Chlamydia'
        ];
    }


    function checkBookingTimeSlot($time, $req)
    {

        return $data = ServiceBooking::whereHomeopathServiceId($req->service_id)
                ->whereTimeSlot('0'.$time.':30')
                ->where('date', $req->date)
                ->count();

    }



    function serviceAmount($amount,$location)
    {
        $loc_tax=LocationTex::where('location',$location)->first();
        if ($loc_tax) {
            $tax = ($loc_tax->service_tax / 100) * $amount;
            $discount = ($loc_tax->service_discount / 100) * $amount;
        }else{

            $tax = (setting()['services_tax'] / 100) * $amount;
            $discount = (setting()['services_discount']  / 100) * $amount;
        }
        return round(($amount + $tax) - $discount, 2);
    }

    function serviceTax($amount,$location)
    {
        $loc_tax=LocationTex::where('location',$location)->first();
        if($loc_tax){
            return $tax = ($loc_tax->service_tax / 100) * $amount;
        }else{
            return $tax = (setting()['services_tax'] / 100) * $amount;
        }

    }

    function serviceDiscount($amount,$location)
    {


        $loc_tax=LocationTex::where('location',$location)->first();
        if($loc_tax){
            return $tax = ($loc_tax->service_discount / 100) * $amount;
        }else{
            return $discount = (setting()['services_discount']  / 100) * $amount;
        }
    }





    function checkFollower($auth_id,$connect_id)
    {
        $follower=\App\Models\Following::where('user_id',$auth_id)->where('following_id',$connect_id)->where('following_type','App\Models\Following')->get();

        return $follower;
    }




    function getLatestSocialGroups()
    {
        return UserSocialGroup::inRandomOrder()->orderBy('id', 'DESC')->take(12)->get();
    }


    function getLatestSocialTags()
    {
        return SocialPostTag::inRandomOrder()->orderBy('id', 'DESC')->take(12)->get();
    }


    function getSocialHomeopathCompanies()
    {
        return User::whereRole('homeopath')
                    ->whereIsSociallyCompleted(true)
                    ->inRandomOrder()
                    ->orderBy('id', 'DESC')
                    ->take(12)
                    ->get();
    }


    function getSocialFriends()
    {
        return User::whereIsSociallyCompleted(true)
                    ->inRandomOrder()
                    ->orderBy('id', 'DESC')
                    ->take(12)
                    ->get();
    }



    function checkUserFollowing($auth_id, $following_id)
    {

        return Following::whereUserId($auth_id)
                        ->whereFollowingType('App\Models\User')
                        ->whereFollowingId($following_id)
                        ->count();
    }

    function checkGroupFollowing($auth_id, $following_id)
    {

        return Following::whereUserId($auth_id)
                        ->whereFollowingType('App\Models\UserSocialGroup')
                        ->whereFollowingId($following_id)
                        ->count();
    }

    function checkUserFollowingTag($user_id, $following_id)
    {
                return Following::whereUserId($user_id)
                        ->whereFollowingType('App\Models\SocialPostTag')
                        ->whereFollowingId($following_id)
                        ->count();
    }


    function getHomeopathBookings($id)
    {

        return $data = ServiceBooking::whereHas('HomeopathService', function($q) use ($id) {
            $q->where('user_id', $id);
        })->get();

    }


    function upcomingEvents()
    {
        return Event::whereStatus('active')->whereHas('eventTimings', function($q) {
            $q->where('date', '>=', now()->format('Y-m-d'));
        })->orderBy('id', 'DESC')->get();
    }

    function upcomingEventTimings()
    {
        return EventTiming::with('event')->where('date', '>=', now()->format('Y-m-d'))->whereHas('event', function($q) {
            $q->where('status', 'active');
        })->get();
    }

    function checkMonthlyDonation($user_id)
    {
        return Donation::whereUserId($user_id)
            ->wherePaymentType('monthly')
            ->whereStatus('active')
            ->whereMonth('created_at', '!=', Carbon::now()->month)
            ->latest()
            ->first();
    }

    function shopPendingOrders()
    {
        return ShopOrder::whereStatus('pending')->count();
    }

    function badges()
    {
        return Badge::all();
    }

    function badge($id)
    {
        return Badge::findOrFail($id);
    }

    function badgeRequests()
    {
        return BadgeRequest::where('status', 'pending')->count();
    }

    function getAllLocations()
    {
        return HomeopathProfile::get()->unique('location');
    }


    function weekDays()
    {
        return $data = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    }



    function getAvailableStatus($day)
    {

        $timetable = Timetable::where("day", $day)->where('user_id', auth()->user()->id)->first();


        if(is_null($timetable))
        {
            return false;
        }
        else
        {
            if($timetable->is_closed)
            {
               return false;
            }
            else
            {
                return true;
            }

        }

    }


    function getWeekDayTimetable($day)
    {

        return Timetable::with('daySlots')->where("day", $day)->where('user_id', auth()->user()->id)->first();

    }




    function createOrUpdateWeekday($day_name, $day_closed = false, $delete_slots = false)
    {




        $day  = Timetable::with('daySlots')->where('user_id', auth()->user()->id)->where('day', $day_name)->first();

        if(!$day)
        {
            $day = Timetable::create([
                'user_id'   => auth()->user()->id,
                'day'       => $day_name,
                'is_closed' => $day_closed
            ]);

        }

        $day->is_closed = $day_closed;
        $day->save();


        if($delete_slots == true)
        {
            $day->daySlots()->delete();
        }


        return $day;



    }

    function followingGroups()
    {
        return Following::where('following_id',Auth::user()->id)->where('following_type','App\Models\UserSocialGroup')->get();
    }


    function badgesInformation($id)
    {

        $user=User::findOrFail($id);
        $articals=$user->socialPosts()->where('post_type','Articals')->get()->count();
        $events=$user->events()->get()->count();
        $attend_events=$user->eventRequests()->where('status','closed')->get()->count();

        $arr = array(   'articals' =>$articals ,
                        'attend_events' =>$attend_events ,
                        'events' =>$events ,
                    );
       return $arr;
    }


    function convertToTime($str)
    {
        return date("H:i", $str);
    } 
    function convertToMinutes($str)
    {
        return date("i", $str);
    }


    function getAllTimeSlots($time_slot,$duration)
    {
        $all_booked_slots = [];
        array_push($all_booked_slots, $time_slot);
       
        

            for ($i=1; $i <=$duration; $i++) { 
                 $slot = Carbon::parse($time_slot)
                        ->addMinutes($i)
                        ->format('H:i');
                        array_push($all_booked_slots, $slot);
                       


            }


            return $all_booked_slots;


    }

    function checkSlotPassed($i, $date)
    {
        $now = now()->format('Y-m-d');

        if($now == $date && $i <= time())
        {
            return true;
        }
        return false;
    }

    function adsSponsorship()
    {
        return AdsSetting::latest()->take(3)->get();
    }

    function orderCount()
    {
        return $orders_count = ShopOrder::where('user_id',Auth::id())->groupBy('status')
                        ->selectRaw('count(*) as total, status')
                        ->get();
    }
    function orders()
    {
        return  $orders = ShopOrder::where('user_id',Auth::id())->orderBy('id', 'DESC')->get();
    }
    function userSocialAlbums()
    {
        return  UserSocialAlbums::where('user_id',Auth::id())->orderBy('id', 'DESC')->get();
    }
    function setHomeopathBadge($homeopath_id,$badge_name,$status)
    {
        $homeopath=  HomeopathBadgesSetting::where('homeopath_id',$homeopath_id)->where('badge_name',$badge_name)->first();

        if ($homeopath) {
            $homeopath->update([
                'status'=>$status,
            ]);
        }else{

            $homeopath=HomeopathBadgesSetting::create([
                'homeopath_id'=>$homeopath_id,
                'badge_name'=>$badge_name,
                'status'=>$status,
            ]);
        }

        return $homeopath;
    }

    function homaopathBadgeStatus($homeopath_id,$badge_name)
    {
        $homeo=  HomeopathBadgesSetting::where('homeopath_id',$homeopath_id)->where('badge_name',$badge_name)->first();
        
        if ($homeo) {
            return $homeo->status;
        }else{
            return true;
        }

    }


?>
