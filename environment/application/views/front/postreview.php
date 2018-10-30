<div class="container">
    <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
            <div class="modal-dialog modal-md">
                <div class="panel-heading">	
                    <h3 class="panel-title">Please sign up  <small>It's free!</small></h3>
                </div> 
                <div class="panel-body">
                    <form accept-charset="UTF-8" method="post" action="<?php echo base_url();?>index.php/PropertyC/postreview/<?php echo $property_id ; ?>/review">
                        
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
    <option 				value="1">1</option>
    <option 				value="2">2</option>
    <option 				value="3">3</option>
    <option 				value="4">4</option>
    <option 				value="5">5</option>
    <option 				value="6">6</option>
    <option 				value="7">7</option>
    <option 				value="8">8</option>
    <option 				value="9">9</option>
    <option 				value="10">10</option>
  </select>
                        </div>
                        <input type="submit" value="Add Property" class="btn btn-info btn-block">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>