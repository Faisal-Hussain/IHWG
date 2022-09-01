@extends('layouts.admin')
@section('title','News Letter Email')
@section('heading','News Letter Email')

@section('content')
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
                                        <th>Email</th>
                                        
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    @foreach($data as $item)

                                    <tr>
                                        <td>{{$item->email??''}}</td>
                                        
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')

@endsection
