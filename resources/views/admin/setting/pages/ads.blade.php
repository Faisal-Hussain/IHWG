@extends('layouts.admin')
@section('title','Ads Setting')
@section('heading','Ads Setting')

@section('content')
<div class="row">

    <div class="col-sm-12">
        <div class="card">
            <div class="card">
                <div class="card-header ml-auto">
                    <a href="#" class="btn btn-primary btn-add-ads">+ Add new Ads</a>
                </div>
                <div class="card-content">
                    <div class="card-body card-dashboard">
                        <div class="table-responsive">
                            <table class="table datatable p-0 table-hover-animation">
                                <thead>
                                    <tr>
                                        <th>Heading</th>
                                        <th>URL</th>
                                        <th>Image</th>
                                        {{-- <th>Status</th> --}}

                                        <th class="text-right">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($ads as $item)

                                        <tr>
                                            <th>{{$item->heading}}</th>
                                            <th><a href="{{$item->url}}" data-target="tooltip" title="{{$item->url}}" target="_blank" class="btn btn-success">Visit link</a></th>
                                            <td>
                                                <img src="{{asset($item->image)}}" class="w-50">
                                            </td>
                                            {{-- <th>
                                                <select class="select2 form-control select-status">
                                                    <option @if($item->status=='1') selected @endif value="{{$item->id}}">Active</option>

                                                    <option @if($item->status=='0') selected @endif value="{{$item->id}}">Pause</option>

                                                </select>
                                            </th> --}}
                                            <td class="text-right">
                                                <div class="btn-group">
                                                    <a href="#" class="btn btn-primary btn-block  edit_ads_btn" data-title="Update Record" data-id="{{$item->id}}" data-heading="{{$item->heading}}" data-url="{{$item->url}}" data-image="{{asset($item->image)}}" data-homeopath="{{$item->homeopath}}"
                                                    data-advocate="{{$item->advocate}}" data-user="{{$item->user}}">Edit</a>
                                                    <a href="{{route('admin.setting.ads.delete',$item->id)}}" class="btn btn-danger" onclick="return confirm('Do you confirm to remove this? Yes! Press OK...')"><i class="fa fa-trash"></i></a>
                                                </div>
                                            </td>
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
</div>
@endsection


<!-- Modal for ADD/UPDATE Ads -->

<div class="modal fade" id="modalAddData" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Ads Save</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

        <form id="adsForm" method="post" action="{{route('admin.setting.ads.save')}}" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="id" value="" id="ads_id">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Heading:</label>
            <input type="text" name="heading" class="form-control" required="" id="heading" value="{{ old('heading') }}">
            <label for="recipient-name" class="col-form-label">URl:</label>
            <input type="text" name="url" class="form-control" required id="url" value="{{ old('title') }}">
            <label for="message-text" class="col-form-label">Image:</label>
            <input type="file" name="image" required class="dropify" id="image" data-default-file="{{asset('uploads/users/default.png')}}">
          </div>
            <h4>Ads For:</h4>
                <div class="col-md-4 mt-2">
                    <div class="form-check-inline">
                        <input type="checkbox" class="form-check-input"  name="homeopath" id="homeopath" value="homeopath">
                      <label class="form-check-label" for="homeopath">
                        Homeopath
                      </label>
                    </div>
                </div>

            <div class="col-md-4 mt-2">
                <div class="form-check-inline">
                    <input type="checkbox" name="advocate" class="form-check-input shopist-iCheck" id="advocate" value="advocate">
                  <label class="form-check-label" for="advocate">
                    Advocate
                  </label>
                </div>
            </div>
            <div class="col-md-4 mt-2">
                <div class="form-check-inline">
                    <input type="checkbox" name="user" class="form-check-input" id="user" value="user">
                  <label class="form-check-label" for="user">
                    User
                  </label>
                </div>
            </div>

        </form>
      </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary save-ads-btn">Save</button>
      </div>
    </div>
  </div>
</div>

@section('js')
<script type="text/javascript">

    $(document).on('click', '.btn-add-ads', function(){
        $modal = $('#modalAddData');
        $modal.find('form').attr('action', $(this).data('action'));
        $('#brand_title').val('');
        $('#brand_id').val('');

        $modal.modal('show');
    })

     $(document).on('change', '.select-status', function(){
        var value=$(this).val();
        var url="{{route('admin.setting.ads.status',":id")}}"
        url=url.replace(":id",value);

        window.location.href=url

    })
     $(document).on('click', '.save-ads-btn', function(){
        $('#adsForm').submit();
    })

    $(document).on('click', '.edit_ads_btn', function(){
        $modal = $('#modalAddData');
        $modal.find('form').attr('action', $(this).data('action'));

        $('#ads_id').val($(this).data('id'));
        $('#heading').val($(this).data('heading'));
        $('#url').val($(this).data('url'));

         $modal.find('.dropify-render img').attr('src', $(this).data('image'));

        if($(this).data('homeopath')=="homeopath")
        {
            $("#homeopath").attr('checked','checked')
        }
        if($(this).data('advocate')=="advocate")
        {
            $("#advocate").attr('checked','checked')
        }
        if($(this).data('user')=="user")
        {
            $("#user").attr('checked','checked')
        }



        $modal.modal('show');
    })
</script>
@endsection
