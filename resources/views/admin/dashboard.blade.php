@extends('layouts.admin')
@section('title','Dashboard')
@section('heading','Dashboard')


@section('content')

<div class="card">
    <div class="card-body">
        <div class="row">
            <div class="col-sm-12">
                <canvas id="myChart" style="width:100%;"></canvas>
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
            @foreach($logs as $data)
                '{{ $data->date }}',
            @endforeach
        ],
        datasets: [{
            label: 'Site Analytics',
            data: [
                @foreach($logs as $data)
                    {{ $data->views }},
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