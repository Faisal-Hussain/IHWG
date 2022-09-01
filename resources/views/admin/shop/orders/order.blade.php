@extends('layouts.admin')
@section('title','Order #'.$order->id.' details')
@section('heading','Order #'.$order->id.' details')

@section('content')

<div class="row">
                        <!-- account start -->
                        <div class="col-12">
                            <div class="card">
      
                                <div class="card-body">
                                    <div class="row">


                                        <div class="col-lg-6">
                                            <ul class="list-group">
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Order #</strong>
                                                <span>#{{ $order->id }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Customer Name</strong>
                                                <span>{{ $order->name ?? $order->user->name }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Email address</strong>
                                                <span>{{ $order->email }}</span>
                                              </li>
                                              </ul>
                                        </div>
                                        <div class="col-lg-6">
                                            <ul class="list-group">
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Shipping address</strong>
                                                <span>{{ $order->address_1 }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Shipping address 2</strong>
                                                <span>{{ $order->address_2 }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Country</strong>
                                                <span>{{ $order->country }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">State</strong>
                                                <span>{{ $order->state }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">City</strong>
                                                <span>{{ $order->city }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Zip</strong>
                                                <span>{{ $order->zip }}</span>
                                              </li>
                                              <li class="list-group-item d-flex justify-content-between align-items-center">
                                                <strong class="text-success">Phone</strong>
                                                <span>{{ $order->phone }}</span>
                                              </li>
                                              </ul>
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
                                    <div class="card-title mb-2">Products</div>
                                </div>
                                <div class="card-body">
                                    <table class="table table-hover">
                                      <thead>
                                        <tr>
                                          <th scope="col">Item</th>
                                          <th scope="col">Cost</th>
                                          <th scope="col">Order Qty</th>
                                          <th scope="col">Total</th>
                                        </tr>
                                      </thead>
                                      <tbody>

                                        @foreach($order->orderProducts as $product)
                                            <tr>
                                              <th>
                                                <a href="{{ route('admin.shop.product.detail', $product->shopOrderProduct->id) }}" target="_blank">
                                                    {{ $product->shopOrderProduct->title }}
                                                </a>
                                                <h6 class="text-danger">Stock Quantity: {{ $product->shopOrderProduct->stock_quantity }}</h6>
                                            </th>
                                              <td>${{ $product->price }}</td>
                                              <td>x {{ $product->quantity }}</td>
                                              <td class="font-weight-bold">${{ $product->price * $product->quantity }}</td>
                                            </tr>
                                        @endforeach
                                        
                                      </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- information start -->

                        <div class="col-md-12 col-12 ">
                            <div class="card">
                                <div class="card-header">
                                    <div class="card-title mb-2">Update Order Status (click status button to update oder)</div>
                                </div>
                                <div class="card-body text-center m-auto">

                                    <div class="order-status-btns">


                                        @if($order->status == 'pending')

                                            <a href="" class="btn btn-info disabled"><i class="feather icon-check"></i>Pending</a> <i class="feather icon-arrow-right"></i>
                                            <a href="{{ route('admin.shop.order.update.status', $order->id) }}?status=shipped" class="btn btn-dark">Shipped</a> <i class="feather icon-arrow-right"></i>
                                            <a href="{{ route('admin.shop.order.update.status', $order->id) }}?status=cancelled" class="btn btn-danger">Cancelled</a> <i class="feather icon-arrow-right"></i>
                                            <a href="{{ route('admin.shop.order.update.status', $order->id) }}?status=completed" class="btn btn-success">Completed</a>

                                        @elseif($order->status == 'shipped')
                                            
                                            <a href="" class="btn btn-info disabled">Pending</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-dark disabled"><i class="feather icon-check"></i>Shipped</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-danger disabled">Cancelled</a> <i class="feather icon-arrow-right"></i>
                                            <a href="{{ route('admin.shop.order.update.status', $order->id) }}?status=completed" class="btn btn-success">Completed</a>

                                        @elseif($order->status == 'cancelled')

                                            <a href="" class="btn btn-info disabled">Pending</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-dark disabled">Shipped</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-danger disabled"><i class="feather icon-check"></i>Cancelled</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-success disabled">Completed</a>

                                        @elseif($order->status == 'completed')

                                            <a href="" class="btn btn-info disabled">Pending</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-dark disabled">Shipped</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-danger disabled">Cancelled</a> <i class="feather icon-arrow-right"></i>
                                            <a href="" class="btn btn-success disabled"><i class="feather icon-check"></i>Completed</a>

                                        @endif

                                    </div>

                                    
                                </div>
                            </div>
                        </div>


                    </div>
@endsection
