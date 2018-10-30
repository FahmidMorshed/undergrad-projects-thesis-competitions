<div class="row">
    <div class="col-md-12">
		<?php
            echo form_open(base_url() . 'index.php/admin/awareness/do_add/', array(
                'class' => 'form-horizontal',
                'method' => 'post',
                'id' => 'awareness_add'
            ));
        ?>
            <div class="panel-body">
                
                 <div class="form-group ">
                    <label class="col-sm-4 control-label"><?php echo translate('awareness_title');?></label>
                   <div class="col-sm-6 abstract">
                       <textarea class="summernotes" data-height="200" data-name="title" ></textarea>
                   </div>
                </div>

                <div class="form-group ">
                    <label class="col-sm-4 control-label"><?php echo translate('awareness_focus');?></label>
                   <div class="col-sm-6 abstract">
                       <textarea class="summernotes" data-height="200" data-name="focus" ></textarea>
                   </div>
                </div>

                <div class="form-group ">
                    <label class="col-sm-4 control-label"><?php echo translate('awareness_aim');?></label>
                   <div class="col-sm-6 abstract">
                       <textarea class="summernotes" data-height="200" data-name="aim" ></textarea>
                   </div>
                </div>

                <div class="form-group ">
                    <label class="col-sm-4 control-label"><?php echo translate('awareness_description');?></label>
                   <div class="col-sm-6 abstract">
                       <textarea class="summernotes" data-height="200" data-name="description" ></textarea>
                   </div>
                </div>

                 <div class="form-group">
	                <label class="col-sm-4 control-label" for="demo-hor-1"><?php echo translate('area');?></label>
	                <div class="col-sm-6">
	                    <?php echo $this->crud_model->select_html('area','area_id','name','add','demo-chosen-select','') ?>
	                </div>
                 </div>
                 <div class="form-group">
	                <label class="col-sm-4 control-label" for="demo-hor-1"><?php echo translate('pollution_type');?></label>
	                <div class="col-sm-6">
	                    <?php echo $this->crud_model->select_html('pollution_type','pollution_type_id','type','add','demo-chosen-select','') ?>
	                </div>
                 </div>
                 <div class="form-group">
	                <label class="col-sm-4 control-label" for="demo-hor-1"><?php echo translate('employee');?></label>
	                <div class="col-sm-6">
	                    <?php echo $this->crud_model->select_html('employee','employee_id','name','add','demo-chosen-select','') ?>
	                </div>
                 </div>

                <div class="form-group btm_border">
                    <label class="col-sm-4 control-label" for="awareness_date"><?php echo translate('date');?></label>
                    <div class="col-sm-6">
                        <input type="date" name="time" id="time" 
                        	placeholder="<?php echo translate('date');?>" class="form-control required">
                    </div>
                </div>
              
                                               
            
             
            </div>
    
            <div class="panel-footer">
                <div class="row">
                	<div class="col-md-11">
                        <span class="btn btn-purple btn-labeled fa fa-refresh pro_list_btn pull-right" 
                            onclick="ajax_set_full('add','<?php echo translate('add_awareness'); ?>','<?php echo translate('successfully_added!'); ?>','awareness_add',''); ">
                            	<?php echo translate('reset');?>
                        </span>
                    </div>
                    
                    <div class="col-md-1">
                        <span class="btn btn-success btn-md btn-labeled fa fa-upload pull-right" onclick="form_submit('awareness_add','<?php echo translate('successfully_added!'); ?>')" ><?php echo translate('upload');?></span>
                    </div>
                    
                </div>
            </div>
    
        </form>
    </div>
</div>
<input type="hidden" id="nums" value='1' />
<script src="<?php echo base_url(); ?>template/back/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js">
</script>

<script>
    window.preview = function (input) {
        if (input.files && input.files[0]) {
            $("#previewImg").html('');
            $(input.files).each(function () {
                var reader = new FileReader();
                reader.readAsDataURL(this);
                reader.onload = function (e) {
                    $("#previewImg").append("<div style='float:left;border:4px solid #303641;padding:5px;margin:5px;'><img height='80' src='" + e.target.result + "'></div>");
                }
            });
        }
    }

    function other_forms(){}
	
	function set_summer(){
        $('.summernotes').each(function() {
            var now = $(this);
            var h = now.data('height');
            var n = now.data('name');
			if(now.closest('.abstract').find('.val').length){
			} else {
            	now.closest('.abstract').append('<input type="hidden" class="val" name="'+n+'">');
				now.summernote({
					height: h,
					onChange: function() {
						now.closest('.abstract').find('.val').val(now.code());
					}
				});
				now.closest('.abstract').find('.val').val(now.code());
			}
        });
	}
	
    $(document).ready(function() {
        $('.demo-chosen-select').chosen();
        $('.demo-cs-multiselect').chosen({width:'100%'});
		set_summer();
    });
    function other(){
        $('.demo-chosen-select').chosen();
        $('.demo-cs-multiselect').chosen({width:'100%'});
    }
	
    $("#awareness_name").blur(function(){
		var val = $(this).val();
		val = val.split(' ').join('_');
		$("#awareness_code").val(val);
	});
	
    $("#part_num").click(function(){
		var num = $('#all_parts').find('.sets').length;
		var no	= $('#nums').val();
		var htmls = '';
		htmls =	htmls
			+'<div class="sets col-md-3">'
			+'	<div class="panel panel-bordered panel-info">'
			+'		<div class="panel-heading">'
			+'          <span class="pull-right remove rmc"><i class="fa fa-times-circle"></i></span>'
			+'			<h3 class="panel-title">Column :'+no+'</h3>'
			+'		</div>'
			+'		<div class="panel-body">'
			+'   		 <div class="col-sm-12">'
			+'				<select name="part_size[]" class="demo-chosen-select size" >'
			+'					<option value="0"><?php echo translate('select_size'); ?></option>'
			+'					<option value="3"><?php echo translate('one-fourth'); ?></option>'
			+'					<option value="4"><?php echo translate('one-third'); ?></option>'
			+'					<option value="6"><?php echo translate('half'); ?></option>'
			+'					<option value="8"><?php echo translate('two-third'); ?></option>'
			+'					<option value="9"><?php echo translate('three-fourth'); ?></option>'
			+'					<option value="12"><?php echo translate('full'); ?></option>'
			+'   		 	</select>'
			+'  		  </div>'
			+'   		 <div class="col-sm-12">'
			+'				<select name="part_content_type[]" class="demo-cs-multiselect type" >'
			+'					<option value=""><?php echo translate('select_type'); ?></option>'
			+'					<option value="content"><?php echo translate('content'); ?></option>'
			+'					<option value="awareness"><?php echo translate('awareness'); ?></option>'
			+'    			</select>'
			+'   		 </div>'
			+'    		<div class="col-sm-12 awareness" style="display:none;">'
			+'				<select class="demo-cs-multiselect awareness_select" name="" multiple >'
			+'					<option value="most_sold"><?php echo translate('most_sold'); ?></option>'
			+'					<option value="most_viewed"><?php echo translate('most_viewed'); ?></option>'
			+'					<option value="latest"><?php echo translate('latest_products'); ?></option>'
			+'  		  	</select>'
			+'  		  </div>'
			+'  		  <input type="hidden" name="part_awareness[]" class="hidd" />'
			+'   		 <div class="col-sm-12 content" style="display:none;">'
			+'				<div class="abstract">'
			+'					<textarea rows="9"  class="summernotes" data-height="400" data-name="part_content[]"></textarea>'
			+'   		 	</div>'
			+'   		 </div>'
			+'		</div>';
			+'	</div>';
			+'</div>';
		if(num <= 3){
			$("#all_parts").append(htmls);
			$('#nums').val(Number($('#nums').val())+1);
		} else {
			$.activeitNoty({
				type: 'danger',
				icon : 'fa fa-times',
				message : '<?php echo translate('not_more_than_4_columns!'); ?>',
				container : 'floating',
				timer : 3000
			});
		}
		set_summer();
		other();
    });
	
	$('body').on('click', '.rmc', function(){
		$(this).closest('.sets').remove();
	});
	
	$('body').on('change', '.awareness_select', function(){	
		var a = $(this).val();
		$(this).closest('.sets').find('.hidd').val(a);
	});
	
	$('body').on('change', '.size', function() {
		var a = $(this).val();
		var p = $(this).parent().parent().parent().parent();
		p.attr('class','');
		p.addClass('sets');
		p.addClass('col-md-'+a);
	});
	
	$('body').on('change', '.type', function(){	
		var h = $(this);
		var a = h.val();
		if(a == 'awareness'){
			h.parent().parent().find('.awareness').show();
			h.parent().parent().find('.content').hide();
		} else if (a == 'content'){
			h.parent().parent().find('.awareness').hide();
			h.parent().parent().find('.content').show();
		}
	});

	$(document).ready(function() {
		$("form").submit(function(e){
			return false;
		});
	});
	
</script>

<style>
.btm_border{
  border-bottom: 1px solid #ebebeb;
  padding-bottom: 15px;	
}
.remove{
	color:#FFF !important;
	margin-right:5px !important;
	font-size:20px !important;
	transition: all .4s ease-in-out;	
}
.remove:hover{
	color:#003376 !important;	
}
</style>


<!--Bootstrap Tags Input [ OPTIONAL ]-->

