
<div class="container">
  <div class="row">
    <div class="col-sm-3 col-md-2">

    </div>

  </div>
  <hr >
  <div class="row">
    <div class="col-sm-3 col-md-2">
      <div class="margin-bottom-50">
          <h2 class="title-v4">My Earlier Feedbacks</h2>

          <?php
          if($my_recent_reviews != ""){ 
            $count = 0;
            foreach ($my_recent_reviews as $review) {
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

              <?php } }
              else{ ?>
                              <div class="blog-thumb-v3">
                <h3>You have never posted a feedback before!</h3>
              </div>

              <?php
              }?>


            </div>
            <!-- End Blog Thumb v3 -->

        
    </div>
    <div class="col-sm-9 col-md-7">
      <!-- Nav tabs -->

      <!-- Tab panes -->
      <div class="tab-content">
        <div class="container" style = "width: 100%">
          <h2>Write A <b style="color: green">Feedback</b></h2>
          <small style="color: red"><strong><?php echo "$message <br></br>"?></strong></small>
          <form role="form" id="mail_form" method="post" action="<?php echo base_url();?>index.php/post_a_feedbackC/send_feedback">

            <div class="form-group row-xs-3">
              <label for="sel1">SUBJECT: </label>
              <input class="form-control" id="subject" type="text" name="subject">
            </div>
            <div class="form-group row-xs-3">
                  <label for="sel1">Area: </label>
                  <select name="area_id" id="area_id" type="text">
                  <?php 
                    $this->db->select('*');
                    $this->db->from($this->db->dbprefix . 'area');
                    $this->db->order_by('area_id', 'ASC');
                    $query = $this->db->get();

                        $area_names = $query->result_array();

                        echo "<option> CHOOSE ONE </option>";
                    foreach ($area_names as $area) {
                      $a_name = $area['name'];
                      $a_id = $area['area_id'];
                      echo "$a_name";
                      echo "<option value=$a_id> $a_name </option>";
                    }
                  ?>
                  </select>
              </div>
            <div class="form-group row-xs-3">
              <label for="sel1">Pollution Type: </label>
              <select name="pollution_type_id" id="pollution_type_id" type="text" style="height: 35px; width: 300px">
                <?php 
                $this->db->select('*');
                $this->db->from($this->db->dbprefix . 'pollution_type');
                $this->db->order_by('pollution_type_id', 'ASC');
                $query = $this->db->get();

                $pollution_names = $query->result_array();

                echo "<option> CHOOSE ONE </option>";
                foreach ($pollution_names as $pollu) {
                  $p_type = $pollu['type'];
                  $p_id = $pollu['pollution_type_id'];
                  echo "<option value=$p_id> $p_type </option>";
                }
                ?>
              </select> 
            </div>
            <div class="form-group">
              <label for="sel2">MESSAGE: </label>
              <textarea class="form-control input-lg" id="mail" form="mail_form" name="mail"></textarea>
            </div>
            <input class="btn btn-lg btn-success " type="submit" value="send" name="send">
            <input class="btn btn-lg btn-info " type="submit" value="save" name="send">
          </form>
        </div>


      </div>

    </div>

      <div class="col-md-3">
        <!-- Blog Thumb v3 -->
        <div class="margin-bottom-50">
          <h2 class="title-v4">All Feedbacks</h2>

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

          </div>
        
      </div>
      <hr />
