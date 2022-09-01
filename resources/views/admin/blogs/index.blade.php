@extends('layouts.admin')
@section('title','Blog Management')
@section('heading','Blog Management')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-header ml-auto">
                    <a href="{{ route('admin.blogs.create') }}" class="btn btn-primary">+ Add blog</a>
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
                                    @foreach ($blogs as $blog)
                                    <tr>
                                        <td>{{ $blog->title ?? 'N/A' }}</td>
                                        <td><span class="badge badge-warning">{{ $blog->status ?? 'N/A' }}</span></td>
                                        <td>{{ $blog->updated_at->diffForHumans() ?? 'N/A' }}</td>
                                        <td>
                                            <div class="btn-group pull-right">
                                                <a href="{{ route('admin.blogs.edit',$blog->id) }}" class="btn btn-dark">View</a>

                                                <form action="{{ route('admin.blogs.destroy',$blog->id) }}" method="POST">
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
