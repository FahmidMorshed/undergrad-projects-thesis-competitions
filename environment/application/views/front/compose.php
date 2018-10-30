
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
                <li><a href="#"><span class="badge pull-right"><?php echo "$total_sent";?></span> Sent Mail </a></li>
                <li><a href="#"><span class="badge pull-right"><?php echo "$total_draft";?></span>Drafts</a></li>
            </ul>
        </div>
        <div class="col-sm-9 col-md-10">
            <!-- Nav tabs -->
            
            <!-- Tab panes -->
            <div class="tab-content">
                <div class="container" style = "width: 100%">
                      <h2>COMPOSE MAIL</h2>
                      <small style="color: red"><strong><?php echo "$message <br></br>"?></strong></small>
                      <form role="form" id="mail_form" method="post" action="<?php echo base_url();?>index.php/inboxC/send_mail">
                        <div class="form-group">
                          <label for="inputdefault">TO: </label>
                          <input class="form-control" id="sendto" type="email" name="sendto" placeholder="<?php echo $to ;?>" value ="<?php echo $to ;?>">
                        </div>
                        <div class="form-group row-xs-3">
                          <label for="sel1">SUBJECT: </label>
                          <input class="form-control" id="subject" type="text" name="subject">
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
    </div>
</div>
<hr />
