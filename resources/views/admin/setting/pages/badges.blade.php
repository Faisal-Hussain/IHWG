@extends('layouts.admin')
@section('title','Badges')
@section('heading','Badges')


@section('content')

<section>
    <div class="row">
        <div class="col-sm-12">
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                            <table class="table p-0">
                                <thead>
                                    <tr>
                                        <th>Sr. </th>
                                        <th>Title</th>
                                        <th class="text-right">Badge</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach (badges() as $item)
                                    <tr>
                                        <th>{{ $loop->iteration }}</th>
                                        <th><h2 class="text-success">{{ $item->title }}</h2></th>
                                        <td class="text-right"><img src="{{ asset($item->path) }}" style="width:60px"></td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

