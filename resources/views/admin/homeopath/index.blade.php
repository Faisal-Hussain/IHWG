@extends('layouts.admin')
@section('title','Homeopath Library')
@section('heading','Homeopath Library')


@section('css')
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
@endsection



@section('content')
<div class="row">

    
        <div class="col-sm-5 mb-4">
            <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Categories</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-category btn-sm" data-action="{{ route('admin.homeopath.category.create') }}">+ New Category</button>
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
                                        <th>Title</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach($categories as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th class="text-success">{{ $item->title }}</th>
                                            <td class="text-right">
                                                <button 
                                                    data-action="{{ route('admin.homeopath.category.update') }}"
                                                    data-id="{{ $item->id }}"
                                                    data-title="{{ $item->title }}"
                                                    class="btn btn-sm btn-info btn-update-category" 
                                                    title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a 
                                                    href="{{ route('admin.homeopath.category.remove', $item->id) }}" 
                                                    class="btn btn-sm btn-danger" 
                                                    title="Trash" 
                                                    onclick="return confirm('Do you confirm to remove this? Yes! Press OK...')">
                                                    <i class="fa fa-trash"></i>
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

        <div class="col-sm-7 mb-4">

              <div id="accordion">
                              <div class="card">

                                <div class="p-1">
                                <div class="row w-100">
                                    <div class="col-md-6 pl-2"><h4>Libraries</h4></div>
                                    <div class="col-md-6 pr-0 text-right">
                                        <button class="btn btn-primary btn-add-library btn-sm" data-action="{{ route('admin.homeopath.library.create') }}">+ New Library Resource</button>
                                    </div>
                                </div>
                            </div>


                                @foreach($categories as $category)

                                <div class="card-header p-0" id="headingOne">
                                    <button class="btn btn-link font-weight-bold btn-success btn-block mb-1" data-toggle="collapse" data-target="#collapseOne-{{ $category->id }}" aria-expanded="true" aria-controls="collapseOne">
                                          {{ $loop->iteration }}: {{ $category->title }}
                                        </button>
                                    </div>

                                    <div id="collapseOne-{{ $category->id }}" class="collapse @if($loop->first) show @endif" aria-labelledby="headingOne" data-parent="#accordion">
                                      <div class="card-body">
                                            <table class="table p-0">
                                                    <tbody>
                                                       @forelse($category->homeopathLibraries as $item)
                                                            <tr>
                                                                <th class="text-warning">{{ $item->title }}</th>
                                                                <td class="text-right">
                                                                    <button 
                                                                        data-id="{{ $item->id }}"
                                                                        data-action="{{ route('admin.homeopath.library.update') }}"
                                                                        data-description="{{ $item->description }}"
                                                                        data-title="{{ $item->title }}"
                                                                        data-cat-id="{{ $item->homeopath_category_id }}"
                                                                        class="btn btn-sm btn-info btn-update-library" 
                                                                        title="Edit">
                                                                        <i class="fa fa-edit"></i>
                                                                    </button>
                                                                    <a 
                                                                        href="{{ route('admin.homeopath.library.remove', $item->id) }}" 
                                                                        class="btn btn-sm btn-danger" 
                                                                        title="Trash" 
                                                                        onclick="return confirm('Do you confirm to remove this? Yes! Press OK...')">
                                                                        <i class="fa fa-trash"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        @empty
                                                        <div class="text-center">
                                                            <h5 class="alert alert-warning p-1">No records were found for this category right now!</h5>
                                                        </div>
                                                       @endforelse
                                                </table>
                                      </div>
                                    </div>
                                @endforeach



                              </div>
                            </div>

        </div>

    

</div>


<!--==================================================================-->
                        <!--MODAL SECTIONS-->
<!--==================================================================-->
<!-- Button trigger modal -->

<!-- Modal for ADD/UPDATE category -->
<div class="modal fade" id="modalAddCategory" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Category</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    @csrf
                    <label>Category Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="hidden" name="id" id="category_id">
                        <input type="text" class="form-control rounded-0" id="category_title" name="title" placeholder="e.g. origins of homeo" required="">
                        <div class="input-group-prepend">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Modal for ADD/UPDATE library -->
<div class="modal fade" id="modalAddLlibrary" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Library</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    @csrf
                    <input type="hidden" name="lib_id" id="lib_id">
                    <label>Category</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="homeopath_category_id" id="lib_cat_id">

                            @foreach($categories as $item)
                                <option value="{{ $item->id }}">{{ $item->title }}</option>
                            @endforeach
                        </select>
                    </div>

                        <label>Resource Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="text" class="form-control rounded-0" id="library_title" name="title" placeholder="e.g. origins of homeo" required="">
                    </div>

                        <label>Resource Detail</label>
                    
                        <textarea id="summernote" name="description" class="form-control"></textarea>
                    

                        <div class="text-right">
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
    $(document).on('click', '.btn-add-category', function(){
        $modal = $('#modalAddCategory');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#category_title').val('');
        $('#category_id').val('');
        $modal.modal('show');
    })

    $(document).on('click', '.btn-update-category', function(){
        $modal = $('#modalAddCategory');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#category_title').val($(this).data('title'));
        $('#category_id').val($(this).data('id'));
        $modal.modal('show');
    })


    $(document).on('click', '.btn-add-library', function(){
        $modal = $('#modalAddLlibrary');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#library_title').val('');
        $('#lib_id').val('');
        $('.note-editable').html('');
        $modal.modal('show');
    })

    $(document).on('click', '.btn-update-library', function(){
        $modal = $('#modalAddLlibrary');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#library_title').val($(this).data('title'));
        $('.note-editable').html($(this).data('description'));
        $('#lib_id').val($(this).data('id'));
        $('#lib_cat_id').val($(this).data('cat-id'));

        $modal.modal('show');
    })


    
</script>

    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
      $('#summernote').summernote({
        placeholder: '',
        tabsize: 2,
        height: 350
      });
    </script>



@endsection
