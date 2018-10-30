	<div class="panel-body" id="demo_s">
		<table id="demo-table" class="table table-striped"  data-pagination="true" data-show-refresh="true" data-ignorecol="0,6" data-show-toggle="false" data-show-columns="false" data-search="true" >
			<thead>
				<tr>
					<th><?php echo translate('no');?></th>
					<th><?php echo translate('name');?></th>					
					
					
					<th><?php echo translate('length(km)');?></th>
					<th><?php echo translate('people');?></th>
									
					
					<th><?php echo translate('district');?></th>
					<th><?php echo translate('in_charge');?></th>		
					<th class="text-right"><?php echo translate('options');?></th>
				</tr>
			</thead>
	
			<tbody >
			<?php
				$i=0;
            	foreach($all_upazilas as $row){
            		$i++;
			?>
			<tr>
				<td><?php echo $i; ?></td>
				
				<td><?php echo $row['name']; ?></td>
				
				<td><?php echo $row['length']; ?></td>
				<td><?php echo $row['people']; ?></td>
				
			
				<td><?php echo ($row['district_id']); ?></td>
				
				<td><?php echo $row['in_charge']; ?></td>
               
				<td class="text-right">
                
                    
                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('view','<?php echo translate('view_upazila'); ?>','<?php echo translate('successfully_edited!'); ?>','upazila_view','<?php echo $row['upazila_id']; ?>')" data-original-title="view" data-container="body">
                        	<?php echo translate('view');?>
                    </a>
                    
					<a onclick="delete_confirm('<?php echo $row['upazila_id']; ?>','<?php echo translate('really_want_to_delete_this?'); ?>')" 
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
   