	<div class="panel-body" id="demo_s">
		<table id="demo-table" class="table table-striped"  data-pagination="true" data-show-refresh="true" data-ignorecol="0,6" data-show-toggle="false" data-show-columns="false" data-search="true" >
			<thead>
				<tr>
					<th><?php echo translate('no');?></th>
					<th><?php echo translate('location');?></th>
					<th><?php echo translate('area_id');?></th>	
					<th><?php echo translate('employee_id');?></th>					
					<th><?php echo translate('vehicle_id');?></th>	
					
					
					<th><?php echo translate('status_id');?></th>		
					<th class="text-right"><?php echo translate('options');?></th>
				</tr>
			</thead>
	
			<tbody >
			<?php
				$i=0;
            	foreach($all_dustbins as $row){
            		$i++;
			?>
			<tr>
				<td><?php echo $i; ?></td>
				<td><?php echo $row['location']; ?></td>
				
				<td><?php echo $row['area_id']; ?></td>
                <td><?php echo $row['employee_id']; ?></td>
				<td><?php echo $row['vehicle_id']; ?></td>
				<td><?php echo $row['status_id']; ?></td>

				<td class="text-right">
                
                    
                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('edit','<?php echo translate('edit_dustbin'); ?>','<?php echo translate('successfully_edited!'); ?>','dustbin_edit','<?php echo $row['dustbin_id']; ?>')" data-original-title="Edit" data-container="body">
                        	<?php echo translate('edit');?>
                    </a>
                     <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('view','<?php echo translate('view_dustbin'); ?>','<?php echo translate('successfully_viewed!'); ?>','dustbin_view','<?php echo $row['dustbin_id']; ?>')" data-original-title="view" data-container="body">
                        	<?php echo translate('view');?>
                    </a>

					<a onclick="delete_confirm('<?php echo $row['dustbin_id']; ?>','<?php echo translate('really_want_to_delete_this?'); ?>')" 
	                    class="btn btn-danger btn-xs btn-labeled fa fa-trash" data-toggle="tooltip" data-original-title="Delete" data-container="body">
	                    	<?php echo translate('delete');?>
                    </a>
                    
				</td>
			</tr>
            <?php
            	}
			?>
			</tbody>
		</table>
	</div>
   