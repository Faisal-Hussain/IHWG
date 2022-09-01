@extends('layouts.admin')
@section('title','Shop - Options Management')
@section('heading','Shop - Options Management')

@section('content')
<div class="row">


    <!--CATEGORIES RECORD DATA-->
    <div class="col-sm-6 mb-4">
        <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Categories</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-category btn-sm" data-action="{{ route('admin.shop.category.create') }}">+ New Category</button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Title</th>
                                        <th>Slug</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach(shopOptions()['shop_categories'] as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th>{{ $item->title }}</th>
                                            <td>{{ $item->slug ?? 'N/A' }}</td>
                                            <td class="text-right">
                                                <button 
                                                    data-action="{{ route('admin.shop.category.update') }}"
                                                    data-id="{{ $item->id }}"
                                                    data-title="{{ $item->title }}"
                                                    class="btn btn-sm btn-info btn-update-category" 
                                                    title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a 
                                                    href="{{ route('admin.shop.option.remove', ['model' => 'ShopCategory', 'id' => $item->id, 'column' => 'shop_category_id']) }}" 
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


    <!--CATEGORIES RECORD DATA-->
    <div class="col-sm-6 mb-4">
        <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Product Brands</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-brand btn-sm" data-action="{{ route('admin.shop.brand.create') }}">+ New Brand</button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Title</th>
                                        <th>Slug</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach(shopOptions()['shop_brands'] as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th>{{ $item->title }}</th>
                                            <td>{{ $item->slug ?? 'N/A' }}</td>
                                            <td class="text-right">
                                                <button 
                                                    data-action="{{ route('admin.shop.brand.update') }}"
                                                    data-id="{{ $item->id }}"
                                                    data-title="{{ $item->title }}"
                                                    class="btn btn-sm btn-info btn-update-brand" 
                                                    title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a 
                                                    href="{{ route('admin.shop.option.remove', ['model' => 'ShopBrand', 'id' => $item->id, 'column' => 'shop_brand_id']) }}" 
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



    <!--VARIANTS RECORD DATA-->
    <div class="col-sm-6 mb-4">
        <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Product Variants</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-variant btn-sm" data-action="{{ route('admin.shop.variant.create') }}">+ New Variant</button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Title</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach(shopOptions()['shop_variants'] as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th>{{ $item->title }}</th>
                                            <td class="text-right">
                                                <button 
                                                    data-action="{{ route('admin.shop.variant.update') }}"
                                                    data-id="{{ $item->id }}"
                                                    data-title="{{ $item->title }}"
                                                    class="btn btn-sm btn-info btn-update-variant" 
                                                    title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a 
                                                    href="{{ route('admin.shop.option.remove', ['model' => 'ShopVariant', 'id' => $item->id, 'column' => 'shop_variant_id']) }}" 
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


    <!--VARIANTS RECORD DATA-->
    <div class="col-sm-6 mb-4">
        <div class="card">
                <div class="p-1">
                    <div class="row w-100">
                        <div class="col-md-6 pl-2"><h4>Product Colors</h4></div>
                        <div class="col-md-6 pr-0 text-right">
                            <button class="btn btn-primary btn-add-color btn-sm" data-action="{{ route('admin.shop.color.create') }}">+ New color</button>
                        </div>
                    </div>
                </div>
                <div class="card-content">
                    <div class="card-body pt-0">
                        <div class="table-responsive">
                            <table class="table datatable p-0">
                                <thead>
                                    <tr>
                                        <th>Sr #</th>
                                        <th>Title</th>
                                        <th>Color</th>
                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   @foreach(shopOptions()['shop_colors'] as $item)
                                        <tr>
                                            <th>{{ $loop->iteration }}</th>
                                            <th>{{ $item->title }}</th>
                                            <td><div class="color_code" style="background-color: {{ $item->color_code }};"></div></td>
                                            <td class="text-right">
                                                <button 
                                                    data-action="{{ route('admin.shop.color.update') }}"
                                                    data-id="{{ $item->id }}"
                                                    data-title="{{ $item->title }}"
                                                    data-code="{{ $item->color_code }}"
                                                    class="btn btn-sm btn-info btn-update-color" 
                                                    title="Edit">
                                                    <i class="fa fa-edit"></i>
                                                </button>
                                                <a 
                                                    href="{{ route('admin.shop.option.remove', ['model' => 'ShopColor', 'id' => $item->id, 'column' => 'shop_color_id']) }}" 
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
                        <input type="text" class="form-control rounded-0" id="category_title" name="title" placeholder="e.g. hair" required="">
                        <div class="input-group-prepend">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal for ADD/UPDATE brand -->
<div class="modal fade" id="modalAddBrand" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Brand</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    @csrf
                    <label>Brand Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="hidden" name="id" id="brand_id">
                        <input type="text" class="form-control rounded-0" id="brand_title" name="title" placeholder="e.g. Reckeweg" required="">
                        <div class="input-group-prepend">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal for ADD/UPDATE variant -->
<div class="modal fade" id="modalAddVariant" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Variant</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    @csrf
                    <label>Variant Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="hidden" name="id" id="variant_id">
                        <input type="text" class="form-control rounded-0" id="variant_title" name="title" placeholder="e.g. 2mg" required="">
                        <div class="input-group-prepend">
                            <button type="submit" class="btn btn-dark">Save</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Modal for ADD/UPDATE color -->
<div class="modal fade" id="modalAddColor" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Color</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="">
                    @csrf
                    <label>Color Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="hidden" name="id" id="color_id">
                        <input type="text" class="form-control rounded-0" id="color_title" name="title" placeholder="e.g. blue" required="">
                    </div>
                    <label>Pick Color</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="color" class="w-100 rounded-0" id="color_code" name="color_code" required="">
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





    $(document).on('click', '.btn-add-brand', function(){
        $modal = $('#modalAddBrand');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#brand_title').val('');
        $('#brand_id').val('');

        $modal.modal('show');
    })

    $(document).on('click', '.btn-update-brand', function(){
        $modal = $('#modalAddBrand');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#brand_title').val($(this).data('title'));
        $('#brand_id').val($(this).data('id'));

        $modal.modal('show');
    })



    $(document).on('click', '.btn-add-variant', function(){
        $modal = $('#modalAddVariant');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#variant_title').val('');
        $('#variant_id').val('');

        $modal.modal('show');
    })

    $(document).on('click', '.btn-update-variant', function(){
        $modal = $('#modalAddVariant');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#variant_title').val($(this).data('title'));
        $('#variant_id').val($(this).data('id'));

        $modal.modal('show');
    })



    $(document).on('click', '.btn-add-color', function(){
        $modal = $('#modalAddColor');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#color_title').val('');
        $('#vcolor_id').val('');

        $modal.modal('show');
    })

    $(document).on('click', '.btn-update-color', function(){
        $modal = $('#modalAddColor');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#color_title').val($(this).data('title'));
        $('#color_id').val($(this).data('id'));
        $('#color_code').val($(this).data('code'));

        $modal.modal('show');
    })




    
</script>
@endsection