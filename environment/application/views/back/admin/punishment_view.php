<?php 
	foreach($punishment_data as $row)
	{ 
?>
    <div id="content-container" style="padding-top:0px !important;">
     
        </div>
    
    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel-body">
                <table class="table table-striped" style="border-radius:3px;">
                    <tr>
                        <th class="custom_td"><?php echo translate('Punishment type');?></th>
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
                        <th class="custom_td"><?php echo translate('description');?></th>
                        <td class="custom_td"><?php echo $row['description']; ?></td>
                    </tr>
                     <tr>
                        <th class="custom_td"><?php echo translate('action');?></th>
                        <td class="custom_td"><?php echo $row['action']; ?></td>
                    </tr>
 
                    <tr>
                        <th class="custom_td"><?php echo translate('date');?></th>
                        <td class="custom_td"><?php echo $row['date'];?></td>
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