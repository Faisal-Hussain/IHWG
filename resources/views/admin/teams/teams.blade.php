@extends('layouts.admin')
@section('title','Team Management')
@section('heading','Team Management')


@section('content')

<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card-body">


    <!-- BEGIN: Content-->
    <section id="data-list-view" class="data-list-view-header">


        <!-- DataTable starts -->
        <div class="table-responsive">
            <table class="table data-list-view">
                <thead>
                    <tr>
                        <th>Sr. #</th>
                        <th>NAME</th>
                        <th>EMAIL</th>
                        <th>CREATED</th>
                        <th>ROLE</th>
                        <th class="float-right pr-2">ACTION</th>
                    </tr>
                </thead>
                <tbody>

                    @forelse($users as $user)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $user->name ?? 'N/A' }}</td>
                        <td class="product-name">{{ $user->email ?? 'N/A' }}</td>
                        <td class="product-category">{{ $user->created_at->diffForHumans() ?? 'N/A' }}</td>

                        <td>
                            <div class="chip chip-success">
                                <div class="chip-body">
                                    <div class="chip-text">{{ $user->roles[0]->name }}</div>
                                </div>
                            </div>
                        </td>
                        <td class="product-action text-right">
                            <div class="btn-group">
                                <a href="" title="Edit" class="btn btn-primary"><i class="feather icon-edit"></i></a>
                                <a href="{{ route('admin.teams.remove', $user->id) }}" title="Trash" class="btn btn-danger alert-confirm"><i class="feather icon-trash"></i></a>
                            </div>
                        </td>
                    </tr>
                    @empty
                    @endforelse
                </tbody>
            </table>
        </div>
        <!-- DataTable ends -->

        <!-- add new sidebar starts -->
        <div class="add-new-data-sidebar">
            <div class="overlay-bg"></div>
            <div class="add-new-data">
                <div class="div mt-2 px-2 d-flex new-data-title justify-content-between">
                    <div>
                        <h4 class="text-uppercase">Add team member</h4>
                    </div>
                    <div class="hide-data-sidebar">
                        <i class="feather icon-x"></i>
                    </div>
                </div>
                <form action="{{ route('admin.teams.store') }}" method="POST">
                    @csrf
                <div class="data-items pb-3">
                    <div class="data-fields px-2 mt-3">
                        <div class="row">

                            @if (count($errors) > 0)
                                <div class="col-sm-12 data-field-col">
                                    <div class="alert alert-danger">
                                        <ul>
                                            @foreach ($errors->all() as $error)
                                                <li>{{ $error }}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                </div>
                            @endif


                            <div class="col-sm-12 data-field-col">
                                <label for="data-name">Name</label>
                                <input type="text" class="form-control" name="name" required>
                            </div>

                            <div class="col-sm-12 data-field-col">
                                <label for="data-name">Email</label>
                                <input type="email" class="form-control" name="email" required>
                            </div>

                            <div class="col-sm-12 data-field-col">
                                <label for="data-name">Select role</label>

                                <select class="form-control" name="role" required>
                                    <option value="" hidden>Select a role</option>
                                    @foreach($roles as $role)
                                        <option value="{{ $role->name }}">{{ $role->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-sm-12 data-field-col">
                                <h5 class="alert alert-warning"><i class="feather icon-alert-circle"></i> Assign the role to team member as per permissions attached to designated role in the roles panel.</h5>
                            </div>



                        </div>
                    </div>
                </div>
                <div class="add-data-footer d-flex justify-content-around px-3 mt-2">
                    <div class="btn-group">
                        <button class="btn btn-relief-primary">Add Data</button>
                        <a class="btn btn-relief-danger cancel-data-btn text-white">Cancel</a>
                    </div>
                </div>
            </form>
            </div>
        </div>
        <!-- add new sidebar ends -->
    </section>
    <!-- END: Content-->

            </div>
        </div>
    </div>
</div>

@endsection

