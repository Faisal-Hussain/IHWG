@extends('layouts.admin')
@section('title','Shop Management')
@section('heading','Shop Management')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-header ml-auto">
                    <a href="{{ route('admin.shop.create') }}" class="btn btn-primary">+ Add new product</a>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0 table-hover-animation">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Category</th>
                                        <th>Brand</th>
                                        <th>Variant</th>
                                        <th>Stock Quantity</th>
                                        <th>Created</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($products as $item)
                                        <tr>
                                            <th>{{ $item->title }}</th>
                                            <th>{{ ucfirst($item->shopCategory->title) ?? 'N/A' }}</th>
                                            <td>{{ ucfirst($item->shopBrand->title) ?? 'N/A' }}</td>
                                            <td>{{ ucfirst($item->shopVariant->title) ?? 'N/A' }}</td>
                                            <th><h3 class="text-success m-0">{{ $item->stock_quantity }}</h3></th>
                                            <td>{{ $item->created_at->diffForHumans() }}</td>
                                            <th class="text-right">
                                                <a href="{{ route('admin.shop.product.detail', $item->id) }}" class="btn btn-dark btn-block btn-sm"><i class="fa fa-eye"></i> Detail</a>
                                            </th>
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
