<head><?php echo $map['js']; ?></head>
<div class="container margin-bottom-40">
	<div class="row">
		<!-- Main Content -->

		<head><?php echo $map['html']; ?></head>

		<div class="col-md-9">
			<!-- Tab v4 -->
			<div class="tab-v4 margin-bottom-40">
				<!-- Tab Heading -->
				<div class="tab-heading">
					<h2>Recent Initiatives</h2>
					<ul class="nav nav-tabs" role="tablist">
						<li class="home active">
							<a href="#tab-v4-a1" role="tab" data-toggle="tab">Awareness Programs</a>
						</li>
						<li>
							<a href="#tab-v4-a2" role="tab" data-toggle="tab">Environment Law</a>
						</li>
						<li>
							<a href="#tab-v4-a3" role="tab" data-toggle="tab">Fundings</a>
						</li>
					</ul>

				</div>
				<!-- End Latest News -->
				<?php $count = 0;?>
				<!-- Tab Content -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab-v4-a1">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($awareness as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/awareness_image/awareness_' . $row['awareness_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									$q = $this->db->get_where('area' , array('area_id' => $row['area_id']))->result_array();

									foreach ($q as $r) {
										$area_name = $r['name'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/InnitiativeC/view_awareness/<?php echo $row['awareness_id'];?>"><?php echo $row['title']?></a></h3>
										<ul class="blog-grid-info">

											<li style="color: #336600">Awareness Program</li>
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li style="color: #669999"><?php echo "$area_name";?></li>
											<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count;?></span></span></li>
											
										</ul>
										

										<p><span style="color: midnightblue"><b>Description: </b></span><?php echo limit_chars($row['description'], 360);?><a href="#">...Read More</a></p>
										
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($awareness as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/awareness_image/awareness_' . $row['awareness_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									$q = $this->db->get_where('area' , array('area_id' => $row['area_id']))->result_array();

									foreach ($q as $r) {
										$area_name = $r['name'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/innitiativeC/view_awareness/<?php echo $row['awareness_id'];?>"><?php echo limit_chars($row['title'], 60);?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
												<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>

							</div>
						</div><!--/end row-->
					</div>



					<?php $count=0;?>
					<div class="tab-pane fade" id="tab-v4-a2">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($law as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/law_image/law_' . $row['law_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['law_id'];?>"><?php echo $row['title']?></a></h3>
										<ul class="blog-grid-info">

											<li style="color: #336600">Environment Law</li>
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count;?></span></span></li>
											
										</ul>
										

										<p><span style="color: midnightblue"><b>Description: </b></span><?php echo limit_chars($row['description'], 360);?><a href="#">...Read More</a></p>
										
									</div>
									
									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($law as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/law_image/law_' . $row['law_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['law_id'];?>"><?php echo limit_chars($row['title'], 60);?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
												<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>


							</div>
						</div><!--/end row-->
					</div>




					<?php $count=0;?>
					<div class="tab-pane fade" id="tab-v4-a3">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($funding as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/funding_image/funding_' . $row['funding_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									$q = $this->db->get_where('area' , array('area_id' => $row['area_id']))->result_array();

									foreach ($q as $r) {
										$area_name = $r['name'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['funding_id'];?>"><?php echo $row['title']?></a></h3>
										<ul class="blog-grid-info">

											<li style="color: #336600">Funding</li>
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li style="color: #669999"><?php echo "$area_name";?></li>
											<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count;?></span></span></li>
											
										</ul>
										

										<p><span style="color: midnightblue"><b>Description: </b></span><?php echo limit_chars($row['description'], 360);?><a href="#">...Read More</a></p>
										
									</div>
									
									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($funding as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/funding_image/funding_' . $row['funding_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									$q = $this->db->get_where('area' , array('area_id' => $row['area_id']))->result_array();

									foreach ($q as $r) {
										$area_name = $r['name'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a style="color: #cc3300" href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['funding_id'];?>"><?php echo limit_chars($row['title'], 60);?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
												<li><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>


							</div>
						</div><!--/end row-->
					</div>
				</div><!--/REMOVE THIS TODO-->
			</div>
			<!-- End Tab v4 -->




			<!-- Tab v4 -->
			<div class="tab-v4 margin-bottom-40">
				<!-- Tab Heading -->
				<div class="tab-heading">
					<h2>Recent Blogs</h2>
					<ul class="nav nav-tabs" role="tablist">
						<li class="home active">
							<a href="#tab-v4-b1" role="tab" data-toggle="tab">All Pollution</a>
						</li>
						<li>
							<a href="#tab-v4-b2" role="tab" data-toggle="tab">Water Pollution</a>
						</li>
						<li>
							<a href="#tab-v4-b3" role="tab" data-toggle="tab">Air Pollution</a>
						</li>
						<li>
							<a href="#tab-v4-b4" role="tab" data-toggle="tab">Noise Pollution</a>
						</li>
						<li>
							<a href="#tab-v4-b5" role="tab" data-toggle="tab">Garbage Pollution</a>
						</li>
					</ul>

				</div>


				<!-- End Tab Heading -->
				<?php $count = 0; ?>
				<!-- Tab Content -->
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab-v4-b1">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($blog as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 120);?></a></h3>
										<ul class="blog-grid-info">
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><?php echo $row['date']?></li>
											<li><i class="fa fa-comments"></i><span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
										</ul>
										<p><?php echo limit_chars($row['summary'], 360)?><a href="#">...Read More</a></p>
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>


							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($blog as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 80)?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo $pollu_type_name;?></li>
												<li><a href="#"><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></a></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>
								<!-- End Blog Thumb -->


							</div>
						</div><!--/end row-->
					</div>



					<?php $review_count = 0; $count =0;?>
					<div class="tab-pane fade" id="tab-v4-b2">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($blog_water as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 120);?></a></h3>
										<ul class="blog-grid-info">
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><?php echo $row['date']?></li>
											<li><i class="fa fa-comments"></i><span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
										</ul>
										<p><?php echo limit_chars($row['summary'], 360);?><a href="#">...Read More</a></p>
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($blog_water as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 80)?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo $pollu_type_name;?></li>
												<li><a href="#"><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></a></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>
								<!-- End Blog Thumb -->


							</div>
						</div><!--/end row-->
					</div>


					<?php $review_count = 0; $count =0;?>
					<div class="tab-pane fade" id="tab-v4-b3">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($blog_air as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 120);?></a></h3>
										<ul class="blog-grid-info">
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><?php echo $row['date']?></li>
											<li><i class="fa fa-comments"></i><span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
										</ul>
										<p><?php echo limit_chars($row['summary'], 360);?><a href="#">...Read More</a></p>
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($blog_air as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 80)?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo $pollu_type_name;?></li>
												<li><a href="#"><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></a></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>
								<!-- End Blog Thumb -->


							</div>
						</div><!--/end row-->
					</div>


					<?php $review_count = 0; $count =0;?>
					<div class="tab-pane fade" id="tab-v4-b4">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($blog_noise as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 120);?></a></h3>
										<ul class="blog-grid-info">
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><?php echo $row['date']?></li>
											<li><i class="fa fa-comments"></i><span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
										</ul>
										<p><?php echo limit_chars($row['summary'], 360);?><a href="#">...Read More</a></p>
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($blog_noise as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 80)?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo $pollu_type_name;?></li>
												<li><a href="#"><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></a></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>
								<!-- End Blog Thumb -->


							</div>
						</div><!--/end row-->
					</div>


					<?php $review_count = 0; $count =0;?>
					<div class="tab-pane fade" id="tab-v4-b5">
						<div class="row">
							<div class="col-sm-7">
								<!-- Blog Grid -->

								<?php 
								foreach ($blog_garbage as $row) {
									$count = $count + 1;
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>
									<div class="blog-grid sm-margin-bottom-40">
										<img class="img-responsive" src="<?php echo  $image_location;?>" alt="">
										<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 120);?></a></h3>
										<ul class="blog-grid-info">
											<li style="color: #993300"><?php echo "$pollu_type_name";?></li>
											<li><?php echo $row['date']?></li>
											<li><i class="fa fa-comments"></i><span class="counter"><span class="counter"><?php echo $review_count?></span></span></li>
										</ul>
										<p><?php echo limit_chars($row['summary'], 360);?><a href="#">...Read More</a></p>
									</div>
									<!-- End Blog Grid -->

									<?php 
									if($count == 1){
										break;
									}
								} ?>
							</div>

							<div class="col-sm-5">
								<!-- Blog Thumb -->

								<?php 
								foreach ($blog_garbage as $row) {
									$count = $count + 1;
									if($count == 2){
										continue;
									}
									$review_count = 0;
									$image_location = base_url() . '/uploads/blog_image/blog_' . $row['blog_id'] . '.jpg';
									
									$q = $this->db->get_where('pollution_type' , array('pollution_type_id' => $row['pollution_type_id']))->result_array();

									foreach ($q as $r) {
										$pollu_type_name = $r['type'];
									}
									?>

									<div class="blog-thumb margin-bottom-20">
										<div class="blog-thumb-hover">
											<a><img src="<?php echo $image_location;?>" alt=""></a>
										</div>
										<div class="blog-thumb-desc">
											<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $row['blog_id'];?>"><?php echo limit_chars($row['title'], 80)?></a></h3>
											<ul class="blog-thumb-info">
												<li style="color: #993300"><?php echo $pollu_type_name;?></li>
												<li><a href="#"><i class="fa fa-comments"></i> <span class="counter"><span class="counter"><?php echo $review_count?></span></span></a></li>
											</ul>
										</div>
									</div>
									<?php 
									if($count == 7){
										break;
									}
								} ?>
								<!-- End Blog Thumb -->


							</div>
						</div><!--/end row-->
					</div>
				</div>
			</div>
			</div>
			<!-- side bar-->



			<div class="col-md-3">
				<!-- Blog Thumb v3 -->
				<div class="margin-bottom-50">
					<h2 class="title-v4">Recent Public Feedbacks</h2>

					<?php
					if($recent_reviews != ""){ 
						$count = 0;
						foreach ($recent_reviews as $review) {
							$count = $count + 1;
							if($count > 12){
								break;
							}
							$q      =   $this->db->get_where('public' , array('public_id' => $review['public_id']))->result_array();
							foreach ($q as $r) {
								$name = $r['name'];
							}

							?>

							<div class="blog-thumb-v3">
								<small><a href="<?php echo base_url();?>index.php/profileC/browse_profile/<?php echo $review['public_id'];?>"><?php echo "$name";?></a></small>
								<h3><a href="<?php echo base_url();?>index.php/innitiativeC/view_innitiative/<?php echo $review['review_id'];?>"><?php echo $review['title'];?></a></h3>
							</div>

							<hr class="hr-xs">

							<?php } }?>


						</div>
						<!-- End Blog Thumb v3 -->

						<!-- Social Shares -->
						<div class="margin-bottom-50">
							<h2 class="title-v4">Other Links</h2>
							<ul class="blog-social-shares">
								<li>
									<i class="rounded-x fb fa fa-facebook"></i>
									<a class="rounded-3x" href="https://www.youtube.com/">Like Us on <strong>Facebook</strong></a>

								</li>
								<li>
									<i class="rounded-x tw fa fa-twitter"></i>
									<a class="rounded-3x" href="#">Follow Us on <strong>Twitter</strong></a>
								</li>
								<li>
									<i class="rounded-x gp fa fa-google-plus"></i>
									<a class="rounded-3x" href="#">Add to circle on <strong>Google+</strong></a>
								</li>
							</ul>
						</div>
						<!-- End Social Shares -->




						<!-- End Blog Video -->
					</div>
					<!-- End Blog Carousel -->


				</div>
				<!-- End Right Sidebar -->
			</div>
		</div>


