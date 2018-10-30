
    <div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-2">
            
        </div>
        
    </div>
    <hr >
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <a href="<?php echo base_url();?>index.php/inboxC/compose" class="btn btn-danger btn-sm btn-block active" role="button">COMPOSE</a>
            
            <ul class="nav nav-pills nav-stacked">
                <li><a href="<?php echo base_url();?>index.php/inboxC"><span class="badge pull-right"><?php echo "$total_recieve";?></span> Inbox </a>
                </li>
                <li><a href="<?php echo base_url();?>index.php/inboxC/sent"><span class="badge pull-right"><?php echo "$total_sent";?></span> Sent Mail </a></li>
                <li><a href="<?php echo base_url();?>index.php/inboxC/draft"><span class="badge pull-right"><?php echo "$total_draft";?></span>Drafts</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <!-- Nav tabs -->
            <?php
                if($mail_query['type'] == 0){
                    $TITLE = "RECIEVED MAIL";
                    $back = "";
                }
                else if($mail_query['type'] == 1){
                    $TITLE = "SENT MAIL";
                    $back = "/sent";
                }
                else if($mail_query['type'] == 2){
                    $TITLE = "DRAFTED MAIL";
                    $back = "/draft";
                }
            ?>
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="container" style = "width: 100%">
                      <span><a href="<?php echo base_url();?>index.php/inboxC<?php echo $back?>"><h2><span class="glyphicon glyphicon-menu-left"></span><?php echo $TITLE;?></a>
                      <a href="<?php echo base_url();?>index.php/inboxC/delete/<?php echo $mail_query['mail_id'];?>" class="glyphicon glyphicon-remove" style="float:right;"></a></h2></span>
                      <small style="color: red"><strong><?php echo "$message <br></br>"?></strong></small>
                      <div class="form-group">
                          <div><label for="inputdefault"><?php echo $mail_type;?></label>
                          <label for="inputdefault" style="color: #003366; font-size: 18px;"><i><?php echo $mail_query['from'];?></i></label></div>
                        </div>
                        <div class="form-group row-xs-3">
                          <div><label for="inputdefault">SUBJECT : </label>
                          <label for="inputdefault" style="color: #336699; font-size: 20px;"><i><?php echo $mail_query['subject'];?></i></label></div>
                        </div>
                        <div class="form-group">
                          <div><label for="inputdefault" style="color: #006666; font-size: 14px;"><i><?php echo $mail_query['mail'];?></i></label></div>
                        </div>
                    </div>
            </div>
            
        </div>
    </div>
</div>
<hr />
