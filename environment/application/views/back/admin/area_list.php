	<div class="panel-body" id="demo_s">
		<table id="demo-table" class="table table-striped"  data-pagination="true" data-show-refresh="true" data-ignorecol="0,6" data-show-toggle="false" data-show-columns="false" data-search="true" >
			<thead>
				<tr>
					<th><?php echo translate('no');?></th>
					<th><?php echo translate('name');?></th>					
					
					
					<th><?php echo translate('people');?></th>
					<th><?php echo translate('length(km)');?></th>					
					
					<th><?php echo translate('authority');?></th>
					<th><?php echo translate('block');?></th>		
					<th><?php echo translate('status');?></th>		
					<th class="text-right"><?php echo translate('options');?></th>
				</tr>
			</thead>
	
			<tbody >
			<?php
				$i=0;
            	foreach($all_areas as $row){
            		$i++;
			?>
			<tr>
				<td><?php echo $i; ?></td>
				<td><?php echo $row['name']; ?></td>
				
				<td><?php echo $row['people']; ?></td>
				<td><?php echo $row['length']; ?></td>
				<td><?php echo $row['admin_id']; ?></td>
				<td><?php echo $row['block']; ?></td>
               	<td style="color:greeen"><?php echo $row['status_id']; ?></td>

				<td class="text-right">
                
                     <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('view','<?php echo translate('view_area'); ?>','<?php echo translate('successfully_viwed!'); ?>','area_view','<?php echo $row['area_id']; ?>')" data-original-title="view" data-container="body">
                        	<?php echo translate('view');?>
                    </a>
                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('edit','<?php echo translate('edit_area'); ?>','<?php echo translate('successfully_edited!'); ?>','area_edit','<?php echo $row['area_id']; ?>')" data-original-title="Edit" data-container="body">
                        	<?php echo translate('edit');?>
                    </a>
                    
					<a onclick="delete_confirm('<?php echo $row['area_id']; ?>','<?php echo translate('really_want_to_delete_this?'); ?>')" 
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
   