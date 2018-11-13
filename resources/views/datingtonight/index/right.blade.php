<aside class="col-lg-4 agileits-w3ls-right-blog-con text-right">
   <div class="right-blog-info text-left">
      <div class="tech-btm" style="margin-left: 60px;">
         <img src="/templates/datingtonight/images/logo/logo2.jpg" class="img-fluid" alt="">
      </div>
      <div class="tech-btm">
         <h4>The Most Views Of Flirting Methods</h4>
         @foreach($getTop5FM as $top5fm)
         <div class="blog-grids row mb-3">
            <div class="col-md-5 blog-grid-left">
               <a href="{{ route('datingtonight.flirtingmethods.detail',['slug' => str_slug($top5fm->name_flirting), 'id' => $top5fm->id]) }}">
                  <img src="/storage/app/files/flirtingmethods/{{$top5fm->image}}" class="img-fluid" alt="">
               </a>
            </div>
            <div class="col-md-7 blog-grid-right">
               <h5>
                  <a href="{{ route('datingtonight.flirtingmethods.detail',['slug' => str_slug($top5fm->name_flirting), 'id' => $top5fm->id]) }}"> {{$top5fm->name_flirting}} </a>
               </h5>
               @php
                  $date = $top5fm->date_created;
                  $date_int = strtotime($date);
                  //$date_format = date('d-month-Y',$date_int);
                  //dd($date_int);
                  $date_array = getdate($date_int);
                  //dd($date_array);
                  $month = $date_array['month'];
                  $day = $date_array['mday'];
                  $year = $date_array['year'];
               @endphp
               <div class="sub-meta">
                  <span>
                     <i class="far fa-clock"></i> {{ $month }} {{ $day }}, {{ $year }}</span>
               </div>
            </div>
         </div>
         @endforeach

         <h4>The Latest News Of Dating Places</h4>
         @foreach($getTop5byDate as $top5bd)
         <div class="blog-grids row mb-3">
            <div class="col-md-5 blog-grid-left">
               <a href="{{ route('datingtonight.datingplaces.detail',['slug' => str_slug($top5bd->name_place), 'id' => $top5bd->id_place]) }}">
                  <img src="/storage/app/files/datingplaces/{{$top5bd->picture}}" class="img-fluid" alt="">
               </a>
            </div>
            <div class="col-md-7 blog-grid-right">
               <h5>
                  <a href="{{ route('datingtonight.datingplaces.detail',['slug' => str_slug($top5bd->name_place), 'id' => $top5bd->id_place]) }}"> {{$top5bd->name_place}} </a>
               </h5>
               <a style="font-size: 13px;" href="{{ route('datingtonight.datingplaces.detail',['slug' => str_slug($top5bd->name_place), 'id' => $top5bd->id_place]) }}"> {{$top5bd->name_type}} </a>
               @php
                  $date = $top5bd->date_created;
                  $date_int = strtotime($date);
                  //$date_format = date('d-month-Y',$date_int);
                  //dd($date_int);
                  $date_array = getdate($date_int);
                  //dd($date_array);
                  $month = $date_array['month'];
                  $day = $date_array['mday'];
                  $year = $date_array['year'];
               @endphp
               <div class="sub-meta">
                  <span>
                     <i class="far fa-clock"></i> {{ $month }} {{ $day }}, {{ $year }}</span>
               </div>
            </div>
         </div>
         @endforeach
      </div>
   </div>

</aside>