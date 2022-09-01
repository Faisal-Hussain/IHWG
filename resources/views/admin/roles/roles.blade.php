@extends('layouts.admin')
@section('title','Roles')
@section('heading','Roles & Permissions')

@section('content')

<div class="row">
    <div class="col-sm-7">
        <div class="card collapse-icon accordion-icon-rotate min-height-500">
            <div class="card-header">
                <h4 class="card-title">Roles & Permission</h4>
            </div>
            <div class="card-body">

                <div class="accordion" id="accordionExample" data-toggle-hover="true">

                    @foreach($roles as $role)

                    <div class="collapse-margin">
                        <div class="card-header" data-toggle="collapse" role="button" data-target="#collapse{{ $role->id }}" aria-expanded="false" aria-controls="collapse{{ $role->id }}">
                            <span class="lead collapse-title font-weight-bold">
                                {{ $role->name }}
                            </span>
                        </div>
                        <div id="collapse{{ $role->id }}" class="collapse" data-parent="#accordionExample">
                            <div class="card-body">
                                @foreach($role->permissions as $permission)
                                <span class="badge badge-dark text-capitalize">{{ str_replace('_', ' ', $permission->name) }}</span>
                                @endforeach
                                <hr>
                                <div class="text-right">
                                    <a href="{{ route('admin.roles.delete', $role->id) }}" class="btn btn-danger font-weight-bold" 
                                        onclick="return confirm('Do you realy want to delete this role? The user connected with this role will be exempted when you delete it.')">Delete {{ $role->name }}</a>
                                    <a href="{{ route('admin.roles.edit', $role->id) }}" class="btn btn-relief-dark">Update {{ $role->name }} role</a>
                                </div>

                            </div>
                        </div>
                    </div>

                    @endforeach

                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-5">
        <div class="card min-height-500">
            <div class="card-body">
                <h4 class="pb-1">Add new Role</h4>

                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form class="form form-horizontal roles-form" action="{{ route('admin.roles.store') }}" method="POST">
                    @csrf
                    <div class="form-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="position-relative has-icon-left">
                                            <input type="text" id="fname-icon" class="form-control" name="name" placeholder="Role Name" autocomplete="off" required>
                                            <div class="form-control-position">
                                                <i class="feather icon-zap"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div class="col-12">
                                <div class="table-responsive border rounded px-1 ">
                                    <h6 class="border-bottom py-1 mx-1 mb-0 font-medium-2"><i class="feather icon-lock mr-50"></i>Permission</h6>
                                    <ul class="list-group list-group-flush">

                                        @foreach($permissions as $permission)
                                        <li class="list-group-item">
                                            <input class="form-check-input" type="checkbox" id="{{ $permission->id }}" value="{{ $permission->id }}" name="permissions[]" checked>
                                            <label class="form-check-label text-capitalize float-right font-weight-bold" for="{{ $permission->id }}">{{ str_replace('_', ' ', $permission->name) }}</label>
                                        </li>
                                        @endforeach

                                    </ul>
                                </div>
                            </div>

                            <div class="col-md-12 text-right mt-2">

                                <div class="btn-group">
                                    <button type="submit" class="btn btn-relief-primary">Submit</button>
                                    <a class="btn btn-relief-danger" href="{{ url()->previous() }}">Cancel</a>
                                </div>


                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@endsection

