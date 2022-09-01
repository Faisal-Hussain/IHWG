 
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
                                        <th>Order</th>
                                        <th>Ordered By</th>
                                        <th>Status</th>
                                        <th>Ordered</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach(orders() as $item)
                                        <tr>
                                            <th class="text-primary">#{{ $item->id }}</th>
                                            <td>
                                                <h6>{{ $item->user->name ?? 'N/A' }}</h6>
                                                <a href="#">{{ $item->user->email ?? 'N/A' }}</a>
                                            </td>
                                            <td>
                                                @if($item->status == 'completed')
                                                    <span class="status-badge-order-green">{{ $item->status }}</span>
                                                @elseif($item->status == 'shipped')
                                                    <span class="status-badge-order-cyan">{{ $item->status }}</span>
                                                @elseif($item->status == 'pending')
                                                    <span class="status-badge-order-blue">{{ $item->status }}</span>
                                                @elseif($item->status == 'cancelled')
                                                    <span class="status-badge-order-red">{{ $item->status }}</span>
                                                @endif
                                            </td>
                                            <td>{{ $item->created_at->diffForHumans() }}</td>
                                            <td class="text-right"><a href="{{ route('shop.order.detail', $item->id) }}" class="text-primary detail_order_btn" title="Order detail"><i class="feather icon-eye"></i></a></td>
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



