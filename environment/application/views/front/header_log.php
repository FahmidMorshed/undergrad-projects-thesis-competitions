<div class="header-v8 header-sticky">
		<!-- Topbar blog -->
		<div class="blog-topbar">
			
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-xs-8">
						<?php $username = $this->session->userdata('user_name');
							  $userid = $this->session->userdata('user_id');
							if($username == ""){
								$username = "Guest";
							}
						?>
						<div class="topbar-time"><strong><a href="<?php echo base_url();?>index.php/homeC">Welcome <?php echo "$username";?> to Online Rental Service</a></strong></div>
						<div class="topbar-toggler"><span class="fa fa-angle-down"></span></div>
						<ul class="topbar-list topbar-menu">
							
							<li><a href="#">Contact</a></li>
							<li><a href="#">About Us</a></li>
							
							<li><strong><a class="cd-signin" style="color: FireBrick" href="<?php echo base_url();?>index.php/loginC/do_loggout">Loggout</a></strong></li>
							
						</ul>
					</div>

					
				</div><!--/end row-->
			</div><!--/end container-->
		</div>
		<!-- End Topbar blog -->

		<!-- Navbar -->
		<div class="navbar mega-menu" role="navigation">
			<div class="container">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="res-container">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>

					<div class="navbar-brand">
						<a href="<?php echo base_url();?>index.php/homeC">
							<img src="<?php echo base_url();?>template/front/img/themes/rental.png" alt="Logo">
							City Environment
						</a>
					</div>
				</div><!--/end responsive container-->


				<?php
					$homeA = "";
					$my_areaA = "";
					$our_objectiveA = "";
					$post_a_feedbackA = "";
					$profileA = "";
					if($page_name=='home'){
						$homeA = "active";
					}
					else if($page_name=='my_area'){
						$my_areaA = "active";
					}
					else if($page_name=='our_objective'){
						$our_objectiveA = "active";
					}
					else if($page_name=='post_a_feedback'){
						$post_a_feedbackA = "active";
					}
					else if($page_name=='my_profile'){
						$profileA = "active";
					}
					
				?>


				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-responsive-collapse">
					<div class="res-container">
						<ul class="nav navbar-nav">
							<!-- Home -->
							<li class="dropdown home <?php echo "$homeA"?>">
								<a href="<?php echo base_url();?>index.php/homeC">
									Home
								</a>
								
							</li>
							<!-- End Home -->

							<li class="dropdown home <?php echo "$our_objectiveA"?>">
								<a href="<?php echo base_url();?>index.php/our_objectiveC">
									Our Objectives
								</a>
								
							</li>
							<!-- End My Profile -->

							<!-- Post Ad -->
							<li class="dropdown home <?php echo "$my_areaA"?>">
								<a href="<?php echo base_url();?>index.php/my_areaC">
									My Area
								</a>
							</li>
							<!-- End Post Ad -->

							<!-- My Profile -->
							
							<!-- Lifestyle -->
							<li class="dropdown home <?php echo "$post_a_feedbackA"?>">
								<a href="<?php echo base_url();?>index.php/post_a_feedbackC">
									Post A Feedback
								</a>
								
							</li>
							<li class="dropdown home <?php echo "$profileA"?>">
								<a href="<?php echo base_url();?>index.php/profileC">
									My Proflie
								</a>
								
							</li>
							<!-- End Lifestyle -->
							<li class="dropdown home">
								<a style="color: #ff0000" href="<?php echo base_url();?>index.php/loginC/do_loggout">
									Loggout
								</a>
								
							</li>
						</ul>
					</div><!--/responsive container-->
				</div><!--/navbar-collapse-->
			</div><!--/end contaoner-->
		</div>
		<!-- End Navbar -->
	</div>