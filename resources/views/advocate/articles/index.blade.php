@extends('layouts.advocate')
@section('title','Article Management')
@section('heading','Article Management')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-header ml-auto">
                    <a href="{{ route('advocate.articles.create') }}" class="btn btn-primary">+ Add article</a>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Status</th>
                                        <th>Created</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($articles as $article)
                                    <tr>
                                        <td>{{ $article->title ?? 'N/A' }}</td>
                                        <td><span class="badge badge-warning">{{ $article->status ?? 'N/A' }}</span></td>
                                        <td>{{ $article->updated_at->diffForHumans() ?? 'N/A' }}</td>
                                        <td>
                                            <div class="btn-group pull-right">
                                                <a href="{{ route('advocate.articles.edit',base64_encode($article->id)) }}" class="btn btn-dark">View</a>

                                                <form action="{{ route('advocate.articles.destroy',base64_encode($article->id)) }}" method="POST">
                                                    @csrf
                                                    @method('DELETE')
                                                    <button class="btn btn-danger" onclick="return confirm('Are you sure you want to delete?')" type="submit">Trash</button>
                                                </form>

                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
