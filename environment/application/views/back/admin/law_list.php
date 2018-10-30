	<div class="panel-body" id="demo_s">
		<table id="demo-table" class="table table-striped"  data-pagination="true" data-show-refresh="true" data-ignorecol="0,6" data-show-toggle="false" data-show-columns="false" data-search="true" >
			<thead>
				<tr>
					<th><?php echo translate('no');?></th>
					<th><?php echo translate('law name');?></th>					
					
					
					<th><?php echo translate('description');?></th>		
					<th class="text-right"><?php echo translate('options');?></th>
				</tr>
			</thead>
	
			<tbody >
			<?php
				$i=0;
            	foreach($all_laws as $row){
            		$i++;
			?>
			<tr>
				<td><?php echo $i; ?></td>
				<td><?php echo $row['law_name']; ?></td>
				
				<td><?php echo $row['description']; ?></td>
               
				<td class="text-right">
                
                    
                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('edit','<?php echo translate('edit_law'); ?>','<?php echo translate('successfully_edited!'); ?>','law_edit','<?php echo $row['law_id']; ?>')" data-original-title="Edit" data-container="body">
                        	<?php echo translate('edit');?>
                    </a>
                    
					<a onclick="delete_confirm('<?php echo $row['law_id']; ?>','<?php echo translate('really_want_to_delete_this?'); ?>')" 
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
   