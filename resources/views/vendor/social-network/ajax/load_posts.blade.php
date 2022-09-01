@foreach($posts as $post)
	@if($post->user_id==Auth::id())


		@if($post->post_type=='Resources')
		    @if($loop->first)<div class="row res-card-row">@endif
		        <div class="col-md-6">
		            @include('vendor.social-network.ajax.load_social_post')
		        </div>
		     @if($loop->last)</div>@endif

		@else
		@include('vendor.social-network.ajax.load_social_post')
		@endif

	@else

		@if($post->post_type=='Resources' && $post->status=='Public')
		    @if($loop->first)<div class="row res-card-row">@endif
		        <div class="col-md-6">
		            @include('vendor.social-network.ajax.load_social_post')
		        </div>
		     @if($loop->last)</div>@endif

		@else
			@if($post->status=='Public')
				@include('vendor.social-network.ajax.load_social_post')
			@endif	
		@endif
	@endif
@endforeach