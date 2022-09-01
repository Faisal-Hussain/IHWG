@extends('layouts.front')
@section('title', 'Explore Homeopathy')
@section('content')

@include('front.components.pages_banner', ['heading' => 'Explore Homeopathy', 'description' => 'Explore our resource library and find out about Homeopathy'])

<!--MAIN CONTENT SECTION-->
<section class="content">
    <div id="custom_single_page">
        <div class="container-fluid">
            <div class="navbar">
                <ul class="nav nav-tabs tabs2 pt-4">
                    @foreach($homeopath_categories as $category)
                        <li class="nav-item main-catalog">
                            <a class="nav-link @if($loop->first) active @endif" data-toggle="tab" href="#catalog-{{ $category->id }}">{{ $category->title }}</a>
                        </li>
                    @endforeach
                </ul>
            </div>
        </div>
        <!-- Tab panes -->
        <div class="tab-content mt-3">
            @foreach($homeopath_categories as $category)
                <div class="tab-pane container @if($loop->first) active @endif" id="catalog-{{ $category->id }}">
                <div class="container-fluid">
                    <div class="navbar">
                        <ul class="nav nav-tabs tabs2 child-catalog-sections">
                            @foreach($category->homeopathLibraries as $item)
                                <li class="nav-item">
                                    <a class="nav-link @if($loop->first)  @endif" data-toggle="tab" href="#child-catalog-{{ $item->id }}">{{ $item->title }}</a>
                                </li>
                            @endforeach
                        </ul>
                     </div>
                </div>
                <p>{{ $category->title }}</p>
            </div>
            @endforeach


        </div>
        <div class="cont            ainer">
            <div class="row">

                <div class="col-sm-9">
                                    <div class="tab-content child-catalog-sections">
                        @foreach($homeopath_categories as $category)
                            @foreach($category->homeopathLibraries as $item)
                                <div class="tab-pane p-5 @if($loop->first)  @endif" id="child-catalog-{{ $item->id }}">{!! $item->description !!}</div>
                            @endforeach
                        @endforeach
                    </div>
                </div>

                <div class="col-sm-3">
                    <div class="text-center mt15">
                        <a href="#" classt="txt15 " style="text-decoration: underline;">SUPPORTING LINKS</a>
                    </div>
                    <br>
                    <div class="img-box">
                        <img src="{{ asset('front/assets') }}/frontend/img/img2.webp" alt="">
                    </div>
                    <div class="img-box">
                        <img src="{{ asset('front/assets') }}/frontend/img/img3.webp" alt="">
                    </div>
                    <div class="img-box">
                        <img src="{{ asset('front/assets') }}/frontend/img/img4.webp" alt="">
                    </div>
                </div>
            </div>
        </div>
        <div class="banner-bottom  text-center">
            <div class="inner">
                <h2>Looking for more information? Join the CHWG Community.</h2>
            </div>
        </div>
    </div>
</section>
@endsection
@section('js')
    <script type="text/javascript">
        $(document).on('click', '.main-catalog a', function(){
            $('.child-catalog-sections').find('.tab-pane').removeClass('active');
            $('.child-catalog-sections').find('.nav-link ').removeClass('active');
        })
    </script>
@endsection
