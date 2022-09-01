<div class="banner-top v2 text-center" style="height:600px; background-image:url('{{ asset('front/assets/frontend') }}/img/imgb.webp'); background-size:cover;">
<div class="inner">
<h1 class="heading" style="font-size:60px;font-weight:600;">{{$setting['about_bottom_section_heading'] ?? ''}}</h1>
<p style="max-width:600px; margin:0 auto;">{{$setting['about_bottom_section_description'] ?? ''}}
    <br> <br>
    {{$setting['about_bottom_section_interested'] ?? ''}}
</p>
<br>
<a href="{{ route('contact.us') }}" class="btn btn-primary  v2-btn-blue">Contact Us</a>
</div>
</div>
