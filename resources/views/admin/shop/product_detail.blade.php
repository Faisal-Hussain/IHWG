@extends('layouts.admin')
@section('title','Product Detail')
@section('heading','Product Detail')

@section('content')

<div class="row">
                        <!-- account start -->
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title">{{ $product->title }}</div>
                                </div>
                                <hr>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="users-view-image">
                                            <img src="{{ asset($product->thumbnail) }}" class="users-avatar-shadow w-100 rounded mb-2 pr-2 ml-1">
                                        </div>
                                        <div class="col-lg-5">
                                            <table >
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Category: </td>
                                                    <td>{{ ucfirst($product->shopCategory->title) ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Brand: </td>
                                                    <td>{{ ucfirst($product->shopBrand->title) ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Variant: </td>
                                                    <td>{{ ucfirst($product->shopVariant->title) ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Color: </td>
                                                    <td class="text-center"><div class="color_code" style="background-color:{{ $product->shopColor->color_code }}">{{ ucfirst($product->shopColor->title) ?? 'N/A' }}</div></td>
                                                </tr>
                                                
                                            </table>
                                        </div>

                                        <div class="col-lg-5">
                                            <table >
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Product ID: </td>
                                                    <td class="text-center"><span class="badge badge-dark">{{ $product->uuid }}</span></td>
                                                </tr>
                                                <tr>
                                                    <td class="font-weight-bold pr-3"> Price: </td>
                                                    <td class="text-center"><h3 class="font-weight-bold text-success">{{ $product->amount }}</h3></td>
                                                </tr>

                                                <tr>
                                                    <td class="font-weight-bold pr-3"> Stock Quantity: </td>
                                                    <td class="text-center"><h4 class="font-weight-bold text-info">{{ $product->stock_quantity }}</h4></td>
                                                </tr>
                                                

                                                <tr>
                                                    <td colspan="2"><hr></td>
                                                </tr>

                                                <tr>
                                                    <td class="font-weight-bold pr-3">Type: </td>
                                                    <td>{{ ucfirst($product->type) ?? 'N/A' }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="font-weight-bold pr-3">Tags: </td>
                                                    <td>
                                                        @foreach(commaSeparatedString($product->tags) as $tag)
                                                            <span class="badge badge-info">{{ $tag }}</span>
                                                        @endforeach
                                                    </td>
                                                </tr>
                                                
                                            </table>
                                        </div>
                                        
                                        <div class="col-lg-2">
                                            <a href="{{ route('admin.shop.product.update', $product->id) }}" class="btn btn-primary btn-block"><i class="feather icon-edit-1"></i> Update</a>
                                            <a href="{{ route('admin.shop.product.remove', $product->id) }}" class="btn btn-danger btn-block alert-confirm"><i class="feather icon-trash-2"></i> Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- account end -->
                        <!-- information start -->
                        <div class="col-md-12 col-12 ">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title mb-2">Description</div>
                                </div>
                                <div class="card-body">
                                    {!! $product->description !!}
                                </div>
                            </div>
                        </div>
                        <!-- information start -->
                    </div>
@endsection
