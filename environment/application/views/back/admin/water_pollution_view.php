<?php 
    foreach($water_pollution_data as $row)
    { 
?>
    <div id="content-container" style="padding-top:0px !important;">
        
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
                        <th class="custom_td"><?php echo translate('area');?></th>
                        <td class="custom_td"><?php echo $row['area_id']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('noisy point type');?></th>
                        <td class="custom_td"><?php echo $row['water_pollution_type_id']; ?></td>
                    </tr>
                   <tr>
                        <th class="custom_td"><?php echo translate('status');?></th>
                        <td class="custom_td"><?php echo $row['status_id']; ?></td>
                    </tr>
                   <tr>
                        <th class="custom_td"><?php echo translate('reason');?></th>
                        <td class="custom_td"><?php echo $row['action']; ?></td>
                    </tr>
                     <tr>
                        <th class="custom_td"><?php echo translate('employee');?></th>
                        <td class="custom_td"><?php echo $row['employee_id']; ?></td>
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