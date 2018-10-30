<?php 
	foreach($employee_data as $row)
	{ 
?>
    <div id="content-container" style="padding-top:0px !important;">
        <div class="text-center pad-all">
           
        </div>
    
    
    <div class="row">
        <div class="col-sm-12">
            <div class="panel-body">
                <table class="table table-striped" style="border-radius:3px;">
                    <tr>
                        <th class="custom_td"><?php echo translate('name');?></th>
                        <td class="custom_td"><?php echo $row['name']; ?></td>
                    </tr>
                   
                    <tr>
                        <th class="custom_td"><?php echo translate('email');?></th>
                        <td class="custom_td"><?php echo $row['email']; ?></td>
                    </tr>  

                    <tr>
                        <th class="custom_td"><?php echo translate('phone');?></th>
                        <td class="custom_td"><?php echo $row['phone']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('area');?></th>
                        <td class="custom_td"><?php echo $row['area_id']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('address');?></th>
                        <td class="custom_td"><?php echo $row['address']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('Working type');?></th>
                        <td class="custom_td"><?php echo $row['employee_type_id']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('status');?></th>
                        <td class="custom_td"><?php echo $row['status_id']; ?></td>
                    </tr>
                     <tr>
                        <th class="custom_td"><?php echo translate('status');?></th>
                        <td class="custom_td"><?php echo $row['status_id']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('payment');?></th>
                        <td class="custom_td"><?php echo $row['payment']; ?></td>
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