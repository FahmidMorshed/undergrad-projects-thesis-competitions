
    <div class="container">
    <div class="row">
        <div class="col-sm-3 col-md-2">
            
        </div>
        
    </div>
    <hr >
    <div class="row">
        <div class="col-sm-3 col-md-2">
            <a href="<?php echo base_url();?>index.php/inboxC/compose" class="btn btn-danger btn-sm btn-block" role="button">COMPOSE</a>
            
            <ul class="nav nav-pills nav-stacked">
                <li><a href="<?php echo base_url();?>index.php/inboxC"><span class="badge pull-right"><?php echo "$total_recieve";?></span> Inbox </a>
                </li>
                <li><a href="<?php echo base_url();?>index.php/inboxC/sent"><span class="badge pull-right"><?php echo "$total_sent";?></span> Sent Mail </a></li>
                <li class="active"><a href="<?php echo base_url();?>index.php/inboxC/draft"><span class="badge pull-right"><?php echo "$total_draft";?></span>Drafts</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <!-- Nav tabs -->
            
            <!-- Tab panes -->
            <div class="tab-content">
                <h1 style="color: green"><strong><?php echo "$message"?></strong></h1>
                      
                <div class="tab-pane fade in active" id="home">
                   <?php
                        foreach ($draft_query as $row) {
                            
                            $q      =   $this->db->get_where('user' , array('email' => $row['to']))->result_array();
                            $to_first_name = "";
                            $to_last_name = "";
                            foreach ($q as $r) {
                                
                            $to_first_name = $r['name'];
                            $to_last_name = $r['last_name'];
                            }
                            $m_id = $row['mail_id'];
                   ?>
                    <div class="list-group">
                        <a href="<?php echo base_url();?>index.php/inboxC/see_mail/<?php echo $m_id;?>" class="list-group-item ">
                            <span class="glyphicon glyphicon-circle-arrow-down"></span> <span class="name" style="min-width: 240px;
                                display: inline-block;"><?php echo "TO : $to_first_name $to_last_name";?></span> <strong><span class="display: inline-block;"><?php echo $row['subject'];?></span></strong>
                                <span class="text-muted" style="font-size: 12px; max-width: 300px; display: inline-block; white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                                 - <?php echo $row['mail'];?></span> <span
                                class="badge"><?php echo $row['time'];?></span></a>
                        </a>
                    </div>
                    <?php  } ?>
                </div>
                
            </div>
            
        </div>
    </div>
</div>
<hr />
