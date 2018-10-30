    <body>
        <!-- Page Content -->
        <div class="container">
            <div class="row">
                <div class="col-md-9">
                    <div class="row carousel-holder">
                        <div class="col-md-12 margin-bottom-40">
                            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                       <?php  $image_location = base_url() . '/images/properties/property_' . $property->property_id . '.jpg';?>
                                       <img class="slide-image" src="<?php echo  $image_location?>" alt="">
                                   </div>
                                   <div class="item">
                                    <img class="slide-image" src="<?php echo $image_location?>" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="<?php echo $image_location?>" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>
                    <div class="caption-full">
                        <br></br>
                        <span><h1 class="title-v4"><a href="<?php echo base_url();?>index.php/propertyC/viewsingleproperty/<?php echo $property->property_id;?>"><?php echo $property->property_name ; ?></a>
                        <small>
                            <?php 
                            $user_id = $this->session->userdata('user_id');
                                if($property->owner_id==$user_id){

                                    echo '        <div >' ;
                                     echo '                      <a class="btn btn-info" href="'.base_url().'index.php/PropertyC/edit/'.$property->property_id.'">Edit</a> ' ;
                                     echo  '              </div>' ;
                                     
                                     //echo '      </div>' ;
    }
    ?>

                        </small></h1></span>
                        <div class="tab-content">
                            <h2 style="color:#cc6600;">Basic Info</h2>
                            <ul>
                                <li><label style="font-size: 18px;">Rent : 

                                    <?php echo $property->rent ; ?> $ </label></li>

                                <li style="font-size: 18px;"><label >Address : </label>

                                        <?php echo $property->full_address . ", ". strtoupper($property->division) ; ?> </li>

                                <li style="font-size: 18px;"><label >Bedrooms : </label>

                                            <?php echo $property->bedrooms; ?> </li>

                                <li style="font-size: 18px;"><label >Available From : </label>

                                    <?php echo $property->available_from; ?> </li>


                                <li style="font-size: 18px;"><label >Owner : </label>
                                    <?php 
                                    $q = $this->db->get_where('user' , array('user_id' => $property->owner_id))->result_array();
                                    foreach ($q as $r) {
                                        $first_name = $r['name'];
                                        $last_name = $r['last_name'];
                                    }
                                    ?>
                                    <?php echo $first_name . " ". $last_name ; ?> 
                                    <small><a href="<?php echo base_url();?>index.php/inboxC/compose/<?php echo $property->owner_id;?>">
                                    <?php if($property->owner_id != $this->session->userdata('user_id')) echo "(send a message now)"?></a></small></li>
                            </ul>
                            <br>
                            </div>

                                            <hr class="hr-xs">
                                            <div class="tab-content">
                                                <h2 style="color:#cc6600;">Description</h2>
                                                <?php echo $property->detail_description ; ?>
                                                <br>
                                            </div>

                                            <hr class="hr-xs">
                                            <div class="tab-content">
                                                <h2 style="color:#cc6600;">Reviews</h2>
                                                <div class="ratings">
                                                    <p>
                                                        <?php for($i=0;$i<$rating;$i++){ 
                                                            echo '<span class="glyphicon glyphicon-star"></span>' ;
                                                        }?>

                                                        <?php for( ;$i<10;$i++){    
                                                            echo '<span class="glyphicon glyphicon-star-empty"></span>' ;
                                                        }?>      
                                                        (<span class="counter"><?php echo $review->num_rows()  ; ?></span>)
                                                    </p>
                                                </div>
                                                <br>
                                            </div>
                                            
                                        </div>
                                        <!-- use loop here-->

                                    </div>
                                    <div class="well">





                                        <?php foreach ($review->result() as $row) { 
                                            echo '                    	<hr>' ;
                                            echo  '                   	<div class="row">' ;
                                            echo  '                      <div class="col-md-12">' ;

                                            $q      =   $this->db->get_where('user' , array('user_id' => $row->user_id))->result_array();
                                            foreach ($q as $r) {
                                                $first_name = $r['name'];
                                                $last_name = $r['last_name'];
                                            }
                                            $base = base_url()."index.php/profileC/browse_profile/".$row->user_id;
                                            echo "<a href=\"$base\">";
                                            echo  "$first_name $last_name";
                                            echo ' </a>';
                                            for($i=0;$i<$row->rating ;$i++){
                                             echo '<span class="glyphicon glyphicon-star"></span>' ;
                                         }
                                         for( ;$i<10;$i++){	
                                           echo '<span class="glyphicon glyphicon-star-empty"></span>' ;
                                       }		
    // echo  $row->user_name ;
                                       echo  '                          <span class="pull-right">'.$row->time.'</span>' ;
                                       echo '<p>'.$row->review.'</p>' ;
                                       echo  '                      </div>' ;
                                       echo  '                  </div>' ;
                                       echo  '                  <hr> ' ;
                                   } ;?>
                                    <hr>
                                    <div class="row">
                                        <div class="col-md-12">

                                            <form accept-charset="UTF-8" method="post" action="<?php echo base_url();?>index.php/PropertyC/postreview/<?php echo $property->property_id ; ?>/review">
                            
                                             <div class="row">
                                                <div class="col-xs-6 col-sm-6 col-md-6">
                                                    <div class="form-group">
                              
                                                        <textarea class="formInput" name="review" placeholder="Your review" id="comments" maxlength="1000000" cols="90" rows="6" required ></textarea>
                                                       
                                                    </div>
                                                </div>
                                            </div>
                                            <h5>Your Rating</h5>
                                            <div class="form-group">
                                                <select name="rating">
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                  </select>
                                                </div>
                                                <div class="text-right">
                                                <input class="btn btn-success" type="submit" value="Leave A Review" class="btn btn-info btn-block">
                                                </div>
                                            </form>
                                        </div>
                                    </div>
        