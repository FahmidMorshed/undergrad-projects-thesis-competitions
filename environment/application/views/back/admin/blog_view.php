<?php 
	foreach($blog_data as $row)
	{ 
?>
    <div id="content-container" style="padding-top:0px !important;">
        
        </div>
    
    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel-body">
                <table class="table table-striped" style="border-radius:3px;">
                    <tr>
                        <th class="custom_td"><?php echo translate('title');?></th>
                        <td class="custom_td"><?php echo $row['title']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('pollution_type');?></th>
                        <td class="custom_td"><?php echo $row['pollution_type_id']; ?></td>
                    </tr>
                    <tr>
                        <th class="custom_td"><?php echo translate('summary');?></th>
                        <td class="custom_td"><?php echo $row['summary']; ?></td>
                    </tr>

                     <tr>
                        <th class="custom_td"><?php echo translate('description');?></th>
                        <td class="custom_td"><?php echo $row['description']; ?></td>
                    </tr>
                     <tr>
                        <th class="custom_td"><?php echo translate('motivation');?></th>
                        <td class="custom_td"><?php echo $row['motivation']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('date');?></th>
                        <td class="custom_td"><?php echo $row['date']; ?></td>
                    </tr>




                   
                </table>
              </div>
            </div>
        </div>					
    </div>					
<?php 
	}
?>
            
<style>
.custom_td{
border-left: 1px solid #ddd;
border-right: 1px solid #ddd;
border-bottom: 1px solid #ddd;
}
</style>