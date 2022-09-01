@extends('layouts.admin')
@section('title','Finance Setting')
@section('heading','Finance Settings')


@section('content')


<section>
    <div class="row">
        <div class="col-sm-12">
            
            <div class="card">
                <div class="card">

                    <div class="card-content">
                        <div class="card-body card-dashboard">
                            <div class="text-right mb-4">
                                <button type="button" class="btn btn-primary pull-right" data-toggle="modal" data-target="#serviceTexModal">Create/Update Taxes</button>
                                <button type="button" class="btn btn-success pull-right" data-toggle="modal" data-target="#defaultServiceTexModal">Default Taxes</button>
                            </div>
                            <div class="table-responsive">

                                <table class="table datatable p-0 table-hover-animation">
                                    <thead>
                                    <tr>
                                        <th>Location</th>
                                        <th>Service Commission(%)</th>
                                        <th>Service Tax(%)</th>
                                        <th>Senior Discount(%)</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @if(count($data)>0)
                                    @foreach($data as $item)
                                        <tr class="tr">

                                            <td class="font-weight-bold">{{$item->location??''}}</td>
                                            <td>{{$item->service_commission??''}}</td>
                                            <td>{{$item->service_tax??''}}</td>
                                        
                                            <td>{{ $item->service_discount??''}}</td>
                                            <td class="td"><a href="#" class="btn btn-warning btn-sm edit-tax-btn" data-service-comission="{{$item->service_commission??''}}" data-service-tax="{{$item->service_tax??''}}" data-service-discount="{{ $item->service_discount??''}}" data-location="{{$item->location??''}}"><i class="fa fa-edit"></i></a></td>
                                            
                                        </tr>
                                    @endforeach
                                    @endif
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
        
    </div>
</section>







<!-- Modal -->
<div class="modal fade" id="serviceTexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">Add Or Update Taxes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            
            <form method="post" action="{{route('admin.finance.location.tax')}}">
                @csrf
                    <div class="form-group">
                        <label>Select Location</label>
                        <select class="form-control select2" name="location" id="location" required="">
                                <option>Select one</option>

                            @foreach(getAllLocations() as $item)
                                <option value="{{$item->location}}">{{$item->location??''}}</option>

                            @endforeach
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Services Commission (Percentage)</label>
                        <input type="number" min="0" id="service_commission" name="service_commission" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label>Service Tax (Percentage)</label>
                        <input type="number" min="0" id="service_tax" name="service_tax" class="form-control" required="">
                    </div>
                    <div class="form-group">
                        <label>Senior Discount (Percentage)</label>
                        <input type="number" min="0" id="service_discount" name="service_discount" class="form-control" required="">
                    </div>
                    <button type="submit" class="btn btn-primary pull-right">Save changes</button>
            </form>
      </div>
     
    </div>
  </div>
</div>
<!--set default  Modal -->
<div class="modal fade" id="defaultServiceTexModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title text-center" id="exampleModalLabel">Default Taxes value</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
            
             <form method="post" action="{{ route('admin.setting.update') }}" enctype="multipart/form-data">
                @csrf
                 <h3>Default Setting</h3> 
                                <div class="row">

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Services Commission (Percentage)</label>
                                            <input type="number" min="0" value="{{$setting['services_commission'] ?? ''}}" name="services_commission" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Services Tax (Percentage)</label>
                                            <input type="number" min="0" value="{{$setting['services_tax'] ?? ''}}" name="services_tax" class="form-control">
                                        </div>
                                    </div>

                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <label class="bmd-label-floating">Senior Discount (Percentage)</label>
                                            <input type="number" min="0" value="{{$setting['services_discount'] ?? ''}}" name="services_discount" class="form-control">
                                        </div>
                                    </div>
                                    

                                </div>
                                <div class="btn-group">
                                    <button type="submit" class="btn btn-primary pull-right float-right">Save</button>
                                   
                                </div>
            </form>
      </div>
     
    </div>
  </div>
</div>

@endsection

@section('js')
<script type="text/javascript">
    
    $(document).on('click','.edit-tax-btn',function(){

        var service_commission=$(this).data('service-comission');
        var service_tax=$(this).data('service-tax');
        var service_discount=$(this).data('service-discount');
        var location=$(this).data('location');

        
        $('#location').val(location).change();
        $('#service_commission').val(service_commission)
        $('#service_tax').val(service_tax)
        $('#service_discount').val(service_discount)

        $('#serviceTexModal').modal('show')


    });

</script>
@endsection

