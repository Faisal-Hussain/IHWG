@extends('layouts.homeopath')
@section('title','Documents Management')
@section('heading','Documents Management')

@section('content')
<div class="row mt-1">


    <!--Documents RECORD DATA-->
    <div class="col-sm-12 mb-4">
        <div class="card">
        <h6 class="m-0"><span class="text-white bg-dark p-1">Documents Management</span></h6>
                <div class="p-1">
                    <div class="row w-100 m-auto">
                        <div class="col-md-12 pr-0 text-right m-auto">
                            <button class="border-0 bg-white btn-add-doc" data-action="add" title="Upload Document"><i class="fas fa-upload fa-2x text-secondary"></i></button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>File</th>
                                        <th>Date Posted</th>
                                        <th>Last Edited</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach($documents as $item)
                                        <tr>
                                            <th>{{ $item->title }}</th>
                                            <td>
                                                <a href="{{ asset($item->file) }}" class="btn" download><i class="feather icon-download fa-2x text-primary"></i></a>
                                            </td>
                                            <th>{{ $item->created_at->format('F d, Y') }}</th>
                                            <th>{{ $item->updated_at->format('F d, Y') }}</th>
                                            <td class="text-right">
                                                <a href="#" 
                                                class="btn-update-doc" 
                                                data-id="{{ Crypt::encrypt($item->id) }}"
                                                data-title="{{ $item->title }}"
                                                >
                                                    <i class="fas fa-edit fa-2x text-secondary"></i>
                                                </a>
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

















<!--==================================================================-->
                        <!--MODAL SECTIONS-->
<!--==================================================================-->
<!-- Button trigger modal -->

<!-- Modal for ADD  -->
<div class="modal fade" id="modalAddCategory" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Upload Document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="{{ route('homeopath.documents.create') }}" enctype="multipart/form-data">
                    @csrf

                    <div class="input-group mb-2 mr-sm-2">
                        <label>Document Title</label>
                        <input type="text" class="form-control w-100" name="title" placeholder="Document title" required="">
                    </div>

                    <div class="input-group mb-2 mr-sm-2">
                        <label>Documrnt File</label>
                        <input type="file" name="file" class="form-control dropify" data-default-file="" required="">
                    </div>

                    <div class=" text-right">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>

                </form>
            </div>
        </div>
    </div>
</div>
<!-- Modal for UPDATE  -->
<div class="modal fade" id="modalUpdate" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Upload Document</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="{{ route('homeopath.documents.edit') }}" enctype="multipart/form-data">
                    @csrf
                    <input type="hidden" name="id" id="doc_id" required="">

                    <div class="input-group mb-2 mr-sm-2">
                        <label>Document Title</label>
                        <input type="text" class="form-control w-100" id="title" name="title" placeholder="Document title" required="">
                    </div>

                    <div class="input-group mb-2 mr-sm-2">
                        <label>Documrnt File (Leave empty if dont need update)</label>
                        <input type="file" name="file" class="form-control dropify" data-default-file="">
                    </div>

                    <div class=" text-right">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>

                </form>
            </div>
        </div>
    </div>
</div>











@endsection

@section('js')
<script>
    $(document).on('click', '.btn-add-doc', function(){
        $('#modalAddCategory').modal('show');
    })

    $(document).on('click', '.btn-update-doc', function(){
        $modal = $('#modalUpdate');
        $('#doc_id').val($(this).data('id'));
        $('#title').val($(this).data('title'));

        $modal.modal('show');
    })



    
</script>
@endsection