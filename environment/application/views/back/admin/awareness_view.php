<?php 
	foreach($awareness_data as $row)
	{ 
?>
    <div id="content-container" style="padding-top:0px !important;">
        
        </div>
    
    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel-body">
                <table class="table table-striped" style="border-radius:3px;">
                    <tr>
                        <th class="custom_td"><?php echo translate('Pollution type');?></th>
                        <td class="custom_td"><?php echo $row['pollution_type_id']; ?></td>
                    </tr>
                       <tr>
                        <th class="custom_td"><?php echo translate('Area');?></th>
                        <td class="custom_td"><?php echo $row['area_id']; ?></td>
                    </tr>
                       <tr>
                        <th class="custom_td"><?php echo translate('Employee');?></th>
                        <td class="custom_td"><?php echo $row['employee_id']; ?></td>
                    </tr>
                     <tr>
                        <th class="custom_td"><?php echo translate('title');?></th>
                        <td class="custom_td"><?php echo $row['title']; ?></td>
                    </tr>
                       <tr>
                        <th class="custom_td"><?php echo translate('Description');?></th>
                        <td class="custom_td"><?php echo $row['description']; ?></td>
                    </tr>
                      
                       <tr>
                        <th class="custom_td"><?php echo translate('aim');?></th>
                        <td class="custom_td"><?php echo $row['aim']; ?></td>
                    </tr>
                       <tr>
                        <th class="custom_td"><?php echo translate('focus');?></th>
                        <td class="custom_td"><?php echo $row['focus']; ?></td>
                    </tr>

                    
                    <tr>
                        <th class="custom_td"><?php echo translate('creation_date');?></th>
                        <td class="custom_td"><?php echo $row['time'];?></td>
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