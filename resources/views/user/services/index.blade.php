@extends('layouts.homeopath')
@section('title','Services')
@section('heading','Services')


@section('content')

<div class="card">
    <div class="card-header pb-1">
        <h3>My Service(s)</h3>
        <button class="btn btn-primary btn-add-service float-right" data-action="{{ route('homeopath.services.create') }}">+  create my new service</button>
    </div>
</div>

<div class="row">
    @foreach(Auth::User()->HomeopathServices as $item)
        <div class="col-xl-3 col-md-3 col-sm-12 mb-4">
            <div class="card">
                <div class="card-content">
                    <div class="card-body">
                        <img class="card-img service-thumbnail mb-1" src="{{ asset($item->thumbnail) }}">
                        <h5 class="mt-1">{{ $item->title }}</h5>
                        <hr class="my-1">
                        <div class="d-flex justify-content-between mt-2">
                            <div class="float-left">
                                <p class="font-weight-bold mb-0">Duration</p>
                                <span class="badge badge-dark">{{ $item->duration }} Minutes</span>
                            </div>
                            <div class="float-right">
                                <p class="font-weight-bold mb-0">Status</p>
                                <span class="badge badge-primary">{{ $item->status }}</span>
                            </div>
                        </div>
                        <hr class="my-1">
                        <a href="{{ route('homeopath.services.detail', Crypt::encrypt($item->id)) }}" class="btn btn-block btn-dark">View detail</a>
                    </div>
                </div>
            </div>
        </div>
    @endforeach
</div>
    



<!-- Modal for ADD/UPDATE color -->
<div class="modal fade" id="modalAddService" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">My Service</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="post" action="" enctype="multipart/form-data">
                    @csrf
                    <label>Service Title</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="text" class="form-control rounded-0" id="title" name="title" placeholder="e.g. Initial Consultation" required="">
                    </div>
                    <label>Service Duration</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="duration">
                            @for($i=30; $i< 181; $i+=30)
                                <option value="{{ $i }}">{{ $i }} Minutes</option> 
                            @endfor
                        </select>
                    </div>

                    <label>Price Rate (USD)</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="price">
                            @for($i=5; $i< 500; $i+=5)
                                <option value="{{ $i }}">{{ $i }}</option> 
                            @endfor
                        </select>
                    </div>

                    <label>Service Thumbnail</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <input type="file" class="dropify" id="thumbnail" name="thumbnail" required="">
                    </div>
                    
                    <label>Service Type</label>
                    <div class="input-group mb-2 mr-sm-2">
                        <select class="form-control" name="type">
                            <option value="featured">Featured</option>
                            <option value="popular">Popular</option>
                            <option value="new">New</option>
                            <option value="old">Old</option>
                            <option value="other">Other</option>
                        </select>
                    </div>

                    <label>Service Theme <small>(Select desired theme for booking)</small></label>
                    <div class="input-group mb-2 mr-sm-2">
                        @foreach(serviceThemes() as $item)
                           <label class="selectTheme" for="option-{{ $loop->iteration }}" style="background-image:url('{{ asset($item->cover) }}')">
                               <input type="radio" name="service_theme_id" value="{{ $item->id }}" id="option-{{ $loop->iteration }}" required="">
                           </label>
                        @endforeach
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
        $(document).on('click', '.btn-add-service', function(){
            $modal = $('#modalAddService');
            $modal.find('form').attr('action', $(this).data('action'));
            $('#title').val('');

            $modal.modal('show');
        })
</script>
@endsection
