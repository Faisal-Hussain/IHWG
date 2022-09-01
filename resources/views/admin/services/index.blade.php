@extends('layouts.admin')
@section('title','Services Theme')
@section('heading','Services Theme')


@section('content')
<div class="row">

    
        <div class="col-sm-12 mb-4">
            <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Services Theme(s)</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-color btn-sm" data-action="{{ route('admin.services.create') }}">+ New Service Theme</button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table p-0">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Theme Title</th>
                                        <th>Color</th>
                                        <th class="text-right">Cover Photo</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach(serviceThemes() as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th>{{ $item->title }}</th>
                                            <td><div class="color_code" style="background-color: {{ $item->color }};"></div></td>
                                            <th class="text-right"><img src="{{ asset($item->cover) }}" style="width:200px;"></th>
                                            <th>
                                                <a href="{{route('admin.services.edit',$item->id)}}" class="btn btn-primary">Edit</a>
                                                <a href="{{route('admin.services.delete',$item->id)}}" class="btn btn-danger">Delete</a>
                                            </th>
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


<!-- Modal for ADD/UPDATE color -->
<div class="modal fade" id="modalAddColor" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Theme</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    @csrf
                    <label>Theme Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="text" class="form-control rounded-0" id="title" name="title" placeholder="e.g. Gray Theme" required="">
                    </div>
                    <label>Pick Color</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="color" class="w-100 rounded-0" id="color" name="color" required="">
                    </div>
                    <label>Cover</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="file" class=" dropify" id="fileChooser" name="cover" required="">
                    </div>
                    
                    
                    <div class="text-right">
                        <button class="btn btn-dark" type="submit">Save</button>
                    </div>

                </form>
            </div>
        </div>
    </div>
</div>




@endsection


@section('js')
<script>
        $(document).on('click', '.btn-add-color', function(){
            $modal = $('#modalAddColor');
            $modal.find('form').attr('action', $(this).data('action'));
            $('#title').val('');

            $modal.modal('show');
        })
</script>
@endsection
