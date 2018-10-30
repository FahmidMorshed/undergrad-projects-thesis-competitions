<?php 
	foreach($district_data as $row)
	{ 
?>
    <div id="content-container" style="padding-top:0px !important;">
        <h3 class="division-header text-overflow"><?php echo translate('District Detail');?></h3>
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
                        <th class="custom_td"><?php echo translate('people');?></th>
                        <td class="custom_td"><?php echo $row['people']; ?></td>
                    </tr>

<tr>
                        <th class="custom_td"><?php echo translate('length');?></th>
                        <td class="custom_td"><?php echo $row['length']; ?></td>
                    </tr>

<tr>
                        <th class="custom_td"><?php echo translate('description');?></th>
                        <td class="custom_td"><?php echo $row['description']; ?></td>
                    </tr>

                    <tr>
                        <th class="custom_td"><?php echo translate('in_charge');?></th>
                        <td class="custom_td"><?php echo $row['in_charge']; ?></td>
                    </tr>
                      <tr>
                        <th class="custom_td"><?php echo translate('division');?></th>
                        <td class="custom_td"><?php echo $row['division_id']; ?></td>
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