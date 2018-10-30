<?php foreach ($query->result() as $row) {
           //print_r($row) ;
           $property = $row ;
}
?>
<div class="container">
    <div class="row centered-form">
        <div class="col-xs-12 col-sm-8 col-md-4 col-sm-offset-2 col-md-offset-4">
            <div class="modal-dialog modal-md">
                <div class="panel-heading">	
                    <h3 class="panel-title">Please sign up  <small>It's free!</small></h3>
                </div> 
                <div class="panel-body">
                    <form accept-charset="UTF-8" method="post" action="<?php echo base_url().'index.php/PropertyC/edit/'.$property->property_id.'/change">'?>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="property_name" id="name" class="form-control input-sm" value="<?php echo $property->property_name?>">
                                </div>
                            </div>
                        </div>		
                        
                        <div class="form-group">
                            <select name="division" >
                                <option value="dhaka" <?php if($property->division=="dhaka") echo "selected" ?>>Dhaka</option>
                                <option value="chittagong" <?php if($property->division=="chittagong") echo "selected" ;?> >Chittagong</option>
                                <option value="mymensingh"<?php if($property->division=="mymensingh") echo "selected" ; ?> >Mymensingh</option>
                                <option value="rajshahi"<?php if($property->division=="rajshahi") echo "selected" ;?> >Rajshahi</option>
                                <option value="rangpur"<?php if($property->division=="rangpur") echo "selected" ;?>>Rangpur</option>
                                <option value="sylhet"<?php if($property->division=="sylhet") echo "selected"  ;?>>Sylhet</option>
                                <option value="khulna"<?php if($property->division=="khulna") echo "selected"  ;?>>Khulna</option>
                                <option value="barisal"<?php if($property->division=="barisal") echo "selected"  ; ?> >Barisal </option> <!-- dynamically generate !-->
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <input type="text" name="full_address" id="full_address" class="form-control input-sm" value="<?php echo $property->full_address ; ?>" >
                        </div>
                        
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="rent" id="name" class="form-control input-sm" value="<?php echo $property->rent ; ?>">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
                                    <input type="text" name="bed_rooms" id="name" class="form-control input-sm" value="<?php echo $property->bedrooms ; ?>">
                                </div>
                            </div>
                        </div>
                        <div>
                            Available From:
                            <input type="date" name="available_from" value="<?php echo $property->available_from ; ?>">
                        </div>
                        
                        </br>
                        <div class="form-group">
                            <input type="text" name="keywords" id="key_words" class="form-control input-sm" value="<?php echo $property->keywords ; ?>">
                        </div>
                         <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <div class="form-group">
          
                                    <textarea class="formInput" name="detail_description" value="<?php echo $property->detail_description ; ?>" placeholder="<?php echo $property->detail_description ; ?>"id="comments" maxlength="1000000" cols="90" rows="6"></textarea>
                                   
                                </div>
                            </div>
                        </div>
                        
                        <input type="submit" value="Edit Property" class="btn btn-info btn-block">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>