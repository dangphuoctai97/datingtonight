@extends('templates.datingtonight.master')
@section('title')
	{{ $getCatItem->name_type }}
@endsection
@section('content')
	<!--/banner-->
	<div class="banner-inner">
	</div>
	<ol class="breadcrumb">
		<li class="breadcrumb-item">
			<a href="index.html">Dating Places</a>
		</li>
		<li class="breadcrumb-item" style="color:#910745">{{ $getCatItem->name_type }}</li>
	</ol>
	<!--//banner-->

	<!--/main-->
	<section class="main-content-w3layouts-agileits">
		<div class="container">
			<h3 class="tittle">{{ $getCatItem->name_type }}</h3>
			<div class="row inner-sec">
				<!--left-->
				<div class="col-lg-8 left-blog-info-w3layouts-agileits text-left">
					@foreach($getIdCat as $item)
					@php
                        $id = $item->id_place;
                        $name = $item->name_place;
                        $slug = str_slug($name);
                        $city = $item->city;
                        $preview = $item->preview_text;
                        $picture = $item->picture;
                        $date_created = $item->date_created;
                        $count = $item->count_number;
                        $urlDetail = route('datingtonight.datingplaces.detail',['slug' => $slug, 'id' => $id]) ;
                    @endphp
					<article class="blog-grid-top">
						<div class="b-grid-top">
							<div class="blog_info_left_grid">
								<a href="{{ $urlDetail }}">
									@if($picture != '')
		                            @php
		                                $urlImg = '/storage/app/files/datingplaces/'.$picture;
		                            @endphp
									<img src="{{ $urlImg }}" class="img-fluid" alt="">
									@endif
								</a>
							</div>
							<div class="blog-info-middle">
								<ul>
									<li>
										<a href="{{ $urlDetail }}">
											<i class="far fa-calendar-alt"></i> FEB 15,2018</a>
									</li>
									<li class="mx-2">
										<a href="{{ $urlDetail }}">
											<i class="far fa-thumbs-up"></i> {{ $count }} Views</a>
									</li>
									<li>
										<a href="{{ $urlDetail }}">
											<i class="far fa-comment"></i> 0 Comments</a>
									</li>

								</ul>
							</div>
						</div>

						<h3>
							<a href="{{ $urlDetail }}">{{ $name }} </a>
						</h3>
						<p> {!! $preview !!}</p>
						<a href="{{ $urlDetail }}" class="btn btn-primary read-m">Read More</a>
					</article>
					@endforeach
					{{ $getIdCat->links()}}
				</div>
				<!--//left-->
				<!--right-->
				@include('datingtonight.datingplaces.right-bar')
				<!--//right-->
			</div>
		</div>
	</section>
	<!--//main-->
	<!-- js -->
	<script src="/templates/datingtonight/js/jquery-2.2.3.min.js"></script>
	<!-- //js -->
	<!--/ start-smoth-scrolling -->
	<script src="/templates/datingtonight/js/move-top.js"></script>
	<script src="/templates/datingtonight/js/easing.js"></script>
	<script>
		jQuery(document).ready(function ($) {
			$(".scroll").click(function (event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop: $(this.hash).offset().top
				}, 900);
			});
		});
	</script>
	<!--// end-smoth-scrolling -->

	<script>
		$(document).ready(function () {
			/*
				var defaults = {
		  			containerID: 'toTop', // fading element id
					containerHoverID: 'toTopHover', // fading element hover id
					scrollSpeed: 1200,
					easingType: 'linear'
		 		};
				*/

			$().UItoTop({
				easingType: 'easeOutQuart'
			});

		});
	</script>
	<a href="#home" class="scroll" id="toTop" style="display: block;">
		<span id="toTopHover" style="opacity: 1;"> </span>
	</a>

	<!-- //Custom-JavaScript-File-Links -->
	<script src="/templates/datingtonight/js/bootstrap.js"></script>


</body>
</html>
@endsection