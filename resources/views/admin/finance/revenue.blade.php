@extends('layouts.admin')
@section('title','Revenue Report')
@section('heading','Revenue Report')


@section('content')



<section>
    <div class="row">
        <div class="col-sm-12">

            <div class="card">
                <div class="card">

                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="table-responsive">

                                <table class="table datatable p-0 table-hover-animation">
                                    <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Service Name</th>
                                        <th>Total Revenue</th>
                                        
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(count($data)>0)
                                    @foreach($data as $item)
                                        <tr class="tr">

                                            <td class="font-weight-bold">{{$item->homeopath->name??''}}</td>
                                            <td>{{$item->title??''}}</td>
                                            <td class="font-weight-bold">$ {{$item->ServiceBookings->sum('price')??''}}</td>
                                        
                                        </tr>
                                    @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
</section>








@endsection

@section('js')

@endsection