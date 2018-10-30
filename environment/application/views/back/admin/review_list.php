	<div class="panel-body" id="demo_s">
		<table id="demo-table" class="table table-striped"  data-pagination="true" data-show-refresh="true" data-ignorecol="0,6" data-show-toggle="false" data-show-columns="false" data-search="true" >
			<thead>
				<tr>
					<th><?php echo translate('no');?></th>
					<th><?php echo translate('pollution_type');?></th>					
					
					
					<th><?php echo translate('area');?></th>	
					<th><?php echo translate('title');?></th>	
                    <th><?php echo translate('remark');?></th>
					<th class="text-right"><?php echo translate('options');?></th>
				</tr>
			</thead>
	
			<tbody >
			<?php
				$i=0;
            	foreach($all_reviews as $row){
            		$i++;
			?>
			<tr>
				<td><?php echo $i; ?></td>
				<td><?php echo $row['pollution_type_id']; ?></td>
				
				<td><?php echo $row['area_id']; ?></td>
                <td><?php echo $row['title']; ?></td>
                <td><?php echo $row['remark']; ?></td>

				<td class="text-right">
                
                    
                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('edit','<?php echo translate('edit_review'); ?>','<?php echo translate('successfully_edited!'); ?>','review_edit','<?php echo $row['review_id']; ?>')" data-original-title="Edit" data-container="body">
                        	<?php echo translate('edit');?>
                    </a>

                    <a class="btn btn-success btn-xs btn-labeled fa fa-wrench" data-toggle="tooltip" 
                    	onclick="ajax_set_full('view','<?php echo translate('view_review'); ?>','<?php echo translate('successfully_viewed!'); ?>','review_view','<?php echo $row['review_id']; ?>')" data-original-title="view" data-container="body">
                        	<?php echo translate('view');?>
                    </a>
                    
					<a onclick="delete_confirm('<?php echo $row['review_id']; ?>','<?php echo translate('really_want_to_delete_this?'); ?>')" 
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
   