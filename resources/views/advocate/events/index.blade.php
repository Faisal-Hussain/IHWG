@extends('layouts.advocate')
@section('title','Event Management')
@section('heading','Event Management')

@section('content')
<div class="row">

    <div class="col-sm-12 events-management">

                <div class="card pl-2 py-1">
                    <h2 class=" mb-0 font-weight-bold">My Event(s) List</h2>
                </div>


            <div class="masonry">
                
                <div class="item p-0">
                    <div class="card text-center mb-0" style="min-height:200px;">
                        <div class="card-body mt-2">
                            <h3>Want to add/organize new event in upcoming days?</h3>
                            <a href="{{ route('advocate.events.create') }}" class="mt-1 btn btn-primary font-weight-bold">Clik Here</a>
                        </div>
                    </div>
                </div>


            @forelse(Auth::user()->events->sortByDesc('id') as $item)          
                <div class="item p-0">
                    <div class="img-container">
                        <img src="{{ asset($item->thumbnail) }}" style="min-height:200px; object-fit: cover;">
                        <div class="bottom-left-text">
                            <h2>{{ $item->title }}</h2>
                            <span>
                                    {{ $item->eventTimings[0]->date ?? '' }}&nbsp;
                                    {{ $item->eventTimings[0]->time ?? '' }}
                                     &nbsp; <i class="fas fa-arrows-alt-h"></i> &nbsp; 
                                    {{ $item->type }}
                             </span>

                             
                        </div>
                        <div class="top-right-text">
                                <a href="{{ route('advocate.events.show', Crypt::encrypt($item->id)) }}">View detail</a>
                        </div>
                    </div>
                </div>
                
                @empty
                    <div class="text-center">
                        <h3 class="alert alert-warning">You have not organized any events yet</h3>
                    </div>
                @endforelse
            </div>

                



    </div>
</div>
@endsection
