<?php

namespace App\Http\Controllers\Advocate;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\EventTiming;
use App\Models\EventRequest;
use Auth;
use Crypt;

class EventController extends Controller
{
    public function index()
    {
        return view('advocate.events.index', get_defined_vars());
    }


    public function create()
    {
        return view('advocate.events.add', get_defined_vars());
    }


    public function store(Request $req)
    {


        $req->validate([
            'title' => 'required|string|max:255',
            'date' => 'required',
            'time' => 'required',
            'category' => 'required',
            'description' => 'required',
            'type' => 'required',
            'thumbnail' => 'image|mimes:jpeg,png,jpg',
        ]);


        $event = Event::create([
            'user_id'       => Auth::id(),
            'title'      => $req->title,
            'category'      => $req->category,
            'description'   => $req->description,
            'thumbnail'     => uploadImage($req->thumbnail, 'uploads/events/'),
            'type'          => $req->type,
            'venue'          => $req->venue,
            'location'      => $req->location ?? NULL,
            'latitude'      => $req->latitude ?? NULL,
            'longitude'     => $req->longitude ?? NULL,
            'hosts'         => $req->hosts ?? NULL,
            'vendors'       => $req->vendors ?? NULL,
        ]);


        foreach($req->date as $key => $item)
        {
            EventTiming::create([
                'event_id'   => $event->id,
                'date'       => $req->date[$key],
                'time'       => $req->time[$key]
            ]);
        }

        return redirect()->route('advocate.events.index')->withMessage('Congrats! Your event has been registered.');

    }
    

    public function show($id)
    {

        $item = Event::findOrFail(Crypt::decrypt($id));

        return view('advocate.events.show', get_defined_vars());
    }


    public function edit($id)
    {

        $item = Event::findOrFail(Crypt::decrypt($id));
        return view('advocate.events.edit', get_defined_vars());
    }




    public function update(Request $req, $id)
    {

        $req->validate([
            'title' => 'required|string|max:255',
            'date' => 'required',
            'time' => 'required',
            'category' => 'required',
            'description' => 'required',
            'type' => 'required',
            'venue' => 'required',
        ]);


        if ($req->hasFile('thumbnail'))
        {
           $thumbnail = uploadImage($req->thumbnail, 'uploads/events/');
        }

        $event = Event::findOrFail(Crypt::decrypt($id));

        $event->update([
            'title'         => $req->title,
            'category'      => $req->category,
            'description'   => $req->description,
            'thumbnail'     => $thumbnail ?? $event->thumbnail,
            'type'          => $req->type,
            'venue'          => $req->venue,
            'location'      => $req->location ?? NULL,
            'latitude'      => $req->latitude ?? NULL,
            'longitude'     => $req->longitude ?? NULL,
            'hosts'         => $req->hosts ?? NULL,
            'vendors'       => $req->vendors ?? NULL,
            'status'        => 'active'
        ]);



        $event->eventTimings()->delete();

        foreach($req->date as $key => $item)
        {
            EventTiming::create([
                'event_id'   => $event->id,
                'date'       => $req->date[$key],
                'time'       => $req->time[$key]
            ]);
        }

        return redirect()->route('advocate.events.index')->withMessage('Your event has been updated.');

    }



    public function remove($id)
    {
        Event::findOrFail(Crypt::decrypt($id))->delete();
        return redirect()->route('advocate.events.index')->withMessage('Your event has been removed.');
    }

    public function close($id)
    {
        Event::findOrFail(Crypt::decrypt($id))->update(['status' => 'closed']);
        return back()->withMessage('Event has been closed.');
    }


    public function requestStatus(Request $req)
    {

        EventRequest::findOrFail(Crypt::decrypt($req->id))->update(['status' => $req->status]);

        return response()->json($req->status, 200);


    }
    
    
    

    

}
