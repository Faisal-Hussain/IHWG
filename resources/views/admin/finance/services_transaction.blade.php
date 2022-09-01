@extends('layouts.admin')
@section('title','Services Transaction')
@section('heading','Services Transaction')

@section('content')
<div class="row">
    
    <div class="col-sm-4">
        <div class="card">
            <div class="card-body">
                <ul class="list-group">
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>This Month Revenue</strong>
                    <h3 class="text-primary font-weight-bold">${{ $this_month_revenue ?? 0 }}</h3>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Last Month Revenue</strong>
                    <h3 class="text-primary font-weight-bold">${{ $last_month_revenue ?? 0 }}</h3>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center">
                    <strong>Overall Revenue</strong>
                    <h3 class="text-primary font-weight-bold">${{ $total ?? 0 }}</h3>
                  </li>
                  
                </ul>
            </div>
        </div>
    </div>

    <div class="col-sm-8">
        <div class="card">
            <div class="card-body">
                <canvas id="myChart" style="width:100%;"></canvas>
            </div>
        </div>
    </div>



    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0 table-hover-animation">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Price</th>
                                        <th>Payment via</th>
                                        <th>Transaction ID</th>
                                        <th>Dated</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($services as $item)
                                        <tr>
                                            <th><span class="badge badge-dark">{{ $item->uuid }}</span></th>
                                            <td><h3 class="text-success font-weight-bold">${{ $item->price }}</h3></td>
                                            <td><span class="badge badge-info font-weight-bold">{{ $item->payment_method }}</span></td>
                                            <td>{{ $item->transaction_id ?? 'N/A' }}</td>

                                            <td>{{ $item->created_at->format('M-d, Y') }}</td>
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

<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [
            @foreach($revenue as $data)
                '{{ $data->month }}',
            @endforeach
        ],
        datasets: [{
            label: 'Monthly Services Revenue Analytics',
            data: [
                @foreach($revenue as $data)
                    {{ $data->price }},
                @endforeach
            ],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 2
        }]
    },
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        }
    }
});
</script>

@endsection