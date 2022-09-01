@extends('layouts.admin')
@section('title','Roles')
@section('heading','Update Role')

@section('content')

<div class="row">

    <div class="col-sm-12">
        <div class="card min-height-500">
            <div class="card-body">
                <h4 class="pb-1">Update Role</h4>

                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form class="form form-horizontal roles-form" action="{{ route('admin.roles.update', $role->id) }}" method="POST">
                    @csrf
                    @method('patch')
                    <div class="form-body">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group row">
                                    <div class="col-md-12">
                                        <div class="position-relative has-icon-left">
                                            <input type="text" id="fname-icon" class="form-control" name="name" value="{{ $role->name }}" placeholder="Role Name" autocomplete="off" required>
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
                                            <input class="form-check-input" type="checkbox" id="{{ $permission->id }}" value="{{ $permission->id }}" name="permissions[]" @if(in_array($permission->id, $role->permissions->pluck('id')->toArray())) checked @endif>
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

