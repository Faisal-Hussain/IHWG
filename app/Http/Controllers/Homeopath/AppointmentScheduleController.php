<?php

namespace App\Http\Controllers\Homeopath;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Timetable;
use Auth;
use App\Models\User;
use App\Models\DaySlot;
use App\Models\HomeopathHoliday;
use Carbon\Carbon;
use Hash;
use Crypt;

class AppointmentScheduleController extends Controller
{


    public function closeDay(Request $req)
    {

        #First parameter day, 2nd for day closed or not, 3rd for delete child slots or not
        createOrUpdateWeekday($req->day, true, true);
        return back()->withMessage('Timetable has been updated.');
    }



    public function setSpecificDay(Request $req)
    {

        $req->validate([
            'day'   => 'required',
            'date'   => 'required',
        ]);

        $day = createOrUpdateWeekday($req->day, false, true);

        if(isset($req->from) && isset($req->to))
        {
            foreach($req->from as $key => $value)
            {   
                DaySlot::create([
                    'timetable_id'   => $day->id,
                    'user_id'        => Auth::id(),
                    'specific_day'   => $req->date,
                    'from'           => $req->from[$key] ?? NULL,
                    'to'             => $req->to[$key] ?? NULL,
                    'slot_type'     => '1'
                ]);
            }

        } 

        return back()->withMessage($req->day.' Timetable has been updated.');

    }


    public function setAllDay(Request $req)
    {

        $req->validate([
            'day'   => 'required',
        ]);

        $day = createOrUpdateWeekday($req->day, false, true);

        if(isset($req->from) && isset($req->to))
        {
            foreach($req->from as $key => $value)
            {   
                DaySlot::create([
                    'timetable_id'   => $day->id,
                    'user_id'        => Auth::id(),
                    'from'           => $req->from[$key] ?? NULL,
                    'to'             => $req->to[$key] ?? NULL,
                    'slot_type'     => '0'
                ]);
            }

        } 

        return back()->withMessage($req->day.' Timetable has been updated.');

    }





    public function saveTimeTable(Request $req)
    {


        $tutor = auth()->user();

        $time_table = TimeTable::where('tutor_id', $tutor->id)
            ->where('day', $req->day)
            ->first();

        if(!is_null($time_table))
        {
            if(isset($req->off_day))
            {
                $off_day_count = $time_table->day_slots->where('is_closed', true)->count();
                if($off_day_count > 0)
                {
                    $time_table->day_slots()->where('is_closed', true)->delete();
                }
            }

            if(isset($req->specific_day))
            {
                $specific_day_count = $time_table->day_slots->where('single_day', Carbon::parse($req->single_day)->format('Y-m-d'))
                    ->count();
                if($specific_day_count > 0)
                {
                    $time_table->day_slots()->where('single_day', Carbon::parse($req->single_day)->format('Y-m-d'))->delete();
                }
            }

            if(isset($req->all_day))
            {
                $all_day_count = $time_table->day_slots->where('is_closed', false)->where('single_day', null)->count();
                if($all_day_count > 0)
                {
                    $time_table->day_slots()->where('is_closed', false)->where('single_day', null)->delete();
                }
            }

        }


        if(!is_null($time_table))
        {
            $tt = $time_table;
        }else
        {
            $tt = new TimeTable();
            $tt->tutor_id = $tutor->id;
            $tt->day = $req->day;
            $tt->save();
        }

        if(isset($req->off_day))
        {
            if(is_null($req->is_closed))
            {
                if(isset($req->single_day))
                {
                    foreach($req->single_day as $item)
                    {
                        if(!is_null($item))
                        {
                            $day_slot = new DaySlot();
                            $day_slot->time_table_id = $tt->id;
                            $day_slot->tutor_id = $tutor->id;
                            $day_slot->single_day = Carbon::parse($item)->format('Y-m-d');
                            $day_slot->is_closed = true;
                            $day_slot->slot_type = '2';
                            $day_slot->save();
                        }
                        
                    }
                }
            }
            else
            {
                $tt->is_closed = true;
                $tt->save();
                if($tt->day_slots->count() > 0)
                {
                    $tt->day_slots()->delete();  
                }
            }
            
        }

        if(isset($req->specific_day))
        {
            if(isset($req->from) && isset($req->to))
            {
                foreach($req->from as $key => $from)
                {
                    $day_slot = new DaySlot();
                    $day_slot->time_table_id = $tt->id;
                    $day_slot->tutor_id = $tutor->id;
                    $day_slot->from = $from;
                    $day_slot->to = $req->to[$key];
                    $day_slot->single_day = Carbon::parse($req->single_day)->format('Y-m-d');
                    $day_slot->slot_type = '1';
                    $day_slot->save();
                }
                $tt->is_closed = false;
                $tt->save();
            }  
        }

        if(isset($req->all_day))
        {
            if(isset($req->from) && isset($req->to))
            {
                foreach($req->from as $key => $from)
                {
                    $day_slot = new DaySlot();
                    $day_slot->time_table_id = $tt->id;
                    $day_slot->tutor_id = $tutor->id;
                    $day_slot->from = $from;
                    $day_slot->to = $req->to[$key];
                    $day_slot->slot_type = '0';
                    $day_slot->save();
                }
                $tt->is_closed = false;
                $tt->save();
            }  
        }
        

        return redirect()->back()->with('success', 'Timetable Updated Successfully');
    }




    public function updateHoliday(Request $req)
    {

        $req->validate([
            'holiday_from'  => 'required',
            'holiday_to'    => 'required'
        ]);

        if($req->holiday_from > $req->holiday_to)
        {
            return back()->withError('Whoops! Start date cannot be smaller than ending date!');
        }

        Auth::user()->homeopathHoliday()->updateOrCreate([
            'holiday_from'   => $req->holiday_from,
            'holiday_to'     => $req->holiday_to
        ]);

        return back()->withMessage('Holiday schedule has been updated.');
    
    }

    public function removeHoliday($id)
    {
        HomeopathHoliday::findOrFail(Crypt::decrypt($id))->delete();
        return back()->withMessage('Holiday has been removed from your schedule.');
    }





}
