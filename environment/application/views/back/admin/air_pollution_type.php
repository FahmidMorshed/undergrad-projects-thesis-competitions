<div id="content-container">
	<div id="air_pollution_type-title">
		<h1 class="air_pollution_type-header text-overflow"><?php echo translate('manage_air_pollution_type');?></h1>
	</div>
        <div class="tab-base">
            <div class="panel">
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="col-md-12" style="border-bottom: 1px solid #ebebeb;padding: 5px;">
                            <button class="btn btn-primary btn-labeled fa fa-plus-circle add_pro_btn pull-right" 
                                onclick="ajax_set_full('add','<?php echo translate('add_air_pollution_type'); ?>','<?php echo translate('successfully_added!'); ?>','air_pollution_type_add',''); proceed('to_list');">
									<?php echo translate('create_air_pollution_type');?>
                            			</button>
                            <button class="btn btn-info btn-labeled fa fa-step-backward pull-right pro_list_btn" 
                                style="display:none;"  onclick="ajax_set_list();  proceed('to_add');">
									<?php echo translate('back_to_air_pollution_type_list');?>
                            			</button>
                        </div>
                    <!-- LIST -->
                    <div class="tab-pane fade active in" id="list" style="border:1px solid #ebebeb; border-radius:4px;">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<span id="pag"></span>
<script>
	var base_url = '<?php echo base_url(); ?>';
	var user_type = 'admin';
	var module = 'air_pollution_type';
	var list_cont_func = 'list';
	var dlt_cont_func = 'delete';
	
	function proceed(type){
		if(type == 'to_list'){
			$(".pro_list_btn").show();
			$(".add_pro_btn").hide();
		} else if(type == 'to_add'){
			$(".add_pro_btn").show();
			$(".pro_list_btn").hide();
		}
	}
</script>

