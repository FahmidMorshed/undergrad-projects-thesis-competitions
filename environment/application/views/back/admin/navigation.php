<nav id="mainnav-container" >
    <div id="mainnav">
        <!--Menu-->
        <div id="mainnav-menu-wrap">
            <div class="nano">
                <div class="nano-content" style="overflow-x:auto;">
                    <ul id="mainnav-menu" class="list-group">
                        <!--Category name-->
                        <li class="list-header"></li>
                        <!--Menu list item-->
                        <li <?php if($page_name=="dashboard"){?> class="active-link" <?php } ?> 
                        	style="border-top:1px solid rgba(69, 74, 84, 0.7);">
                            <a href="<?php echo base_url(); ?>index.php/admin/">
                                <i class="fa fa-tachometer"></i>
                                <span class="menu-title">
									<?php echo translate('dashboard');?>
                                </span>
                            </a>
                        </li>

                        <?php
                            if($this->crud_model->admin_permission('area') ){
                        ?>
                        <li <?php if($page_name=="upazila" || $page_name=="district"|| $page_name=="division"|| $page_name=="union"|| $page_name=="area" ){?>
                                     class="active-sub" 
                                        <?php } ?> >
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span class="menu-title">
                                    <?php echo translate('Area managment');?>
                                </span>
                                <i class="fa arrow"></i>
                            </a>
            
                            <ul class="collapse <?php if($page_name=="upazila" || $page_name=="district"|| $page_name=="division"|| $page_name=="union" || $page_name=="area"){?>
                                                                 in
                                                                    <?php } ?>" >
                                  
                                <?php
                                    if($this->crud_model->admin_permission('area')){
                                ?>
                                <li <?php if($page_name=="area"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/area/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Local area');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?> 
                                <?php
                                    if($this->crud_model->admin_permission('union')){
                                ?>
                                <li <?php if($page_name=="union"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/union/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Union');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>


                                <?php
                                    if($this->crud_model->admin_permission('upazila')){
                                ?>
                                <li <?php if($page_name=="upazila"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/upazila/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('upazila');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                               <?php
                                    if($this->crud_model->admin_permission('district')){
                                ?>
                                <li <?php if($page_name=="district"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/district/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('district');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                                 <?php
                                    if($this->crud_model->admin_permission('division')){
                                ?>
                                <li <?php if($page_name=="division"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/division/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('division');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>

                              
                            </ul>
                        </li>
                        <?php
                            }
                        ?>


                        <?php
                            if($this->crud_model->admin_permission('employee')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="employee"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/employee/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('Employee managment');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>

                        <?php
                            if($this->crud_model->admin_permission('authority')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="authority"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/authority/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('authority managment');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>
                        

                         <?php
                            if($this->crud_model->admin_permission('public')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="public"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/public1/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('Mass people');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>

                     <?php
                            if($this->crud_model->admin_permission('report') ){
                        ?>
                        <li <?php if($page_name=="area_report" || $page_name=="pollution_report"|| $page_name=="complain_report"){?>
                                     class="active-sub" 
                                        <?php } ?> >
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span class="menu-title">
                                    <?php echo translate('report managment');?>
                                </span>
                                <i class="fa arrow"></i>
                            </a>
            
                            <ul class="collapse <?php if($page_name=="area_report" || $page_name=="pollution_report"|| $page_name=="complain_report"){?>
                                                                 in
                                                                    <?php } ?>" >
                                
                                <?php
                                    if($this->crud_model->admin_permission('area_report')){
                                ?>
                                <li <?php if($page_name=="area_report"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/area_report/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Area wise report');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>


                                <?php
                                    if($this->crud_model->admin_permission('pollution_report')){
                                ?>
                                <li <?php if($page_name=="pollution_report"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/pollution_report/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('pollution wise report');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                               <?php
                                    if($this->crud_model->admin_permission('complain_report')){
                                ?>
                                <li <?php if($page_name=="complain_report"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/complain_report/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('complain wise report');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                               
                              
                            </ul>
                        </li>
                        <?php
                            }
                        ?>
                          
                          <?php
                            if($this->crud_model->admin_permission('initiative') ){
                        ?>
                        <li <?php if($page_name=="law" || $page_name=="funding"|| $page_name=="awareness" ||$page_name=="research" ){?>
                                     class="active-sub" 
                                        <?php } ?> >
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span class="menu-title">
                                    <?php echo translate('initiative');?>
                                </span>
                                <i class="fa arrow"></i>
                            </a>
            
                            <ul class="collapse <?php if($page_name=="law" || $page_name=="funding"|| $page_name=="awareness" ||$page_name=="research" ){?>
                                                                 in
                                                                    <?php } ?>" >
                                
                                <?php
                                    if($this->crud_model->admin_permission('law')){
                                ?>
                                <li <?php if($page_name=="law"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/law/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Environment law');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>


                                <?php
                                    if($this->crud_model->admin_permission('funding')){
                                ?>
                                <li <?php if($page_name=="funding"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/funding/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Funding');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                               <?php
                                    if($this->crud_model->admin_permission('awareness')){
                                ?>
                                <li <?php if($page_name=="awareness"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/awareness/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('Awareness');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                               
                                
                              
                            </ul>
                        </li>
                        <?php
                            }
                        ?>                      
                        <?php
                            if($this->crud_model->admin_permission('blog') ){
                        ?>
                        <li <?php if($page_name=="blog" || $page_name=="blog_category" ||$page_name=="poll" ||$page_name=="useful_link"){?>
                                     class="active-sub" 
                                        <?php } ?> >
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span class="menu-title">
                                    <?php echo translate('blog');?>
                                </span>
                                <i class="fa arrow"></i>
                            </a>
            
                            <ul class="collapse <?php if($page_name=="blog" || $page_name=="blog_category"||$page_name=="poll"||$page_name=="useful_link"){?>
                                                                 in
                                                                    <?php } ?>" >
                                
                                <?php
                                    if($this->crud_model->admin_permission('blog')){
                                ?>
                                <li <?php if($page_name=="blog"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/blog/">
                                        <i class="fa fa-circle fs_i"></i>
                                            <?php echo translate('all_blogs');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                                
                                <?php
                            if($this->crud_model->admin_permission('poll')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="poll"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/poll/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('poll');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>

                        <?php
                            if($this->crud_model->admin_permission('useful_link')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="useful_link"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/useful_link/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('useful_link');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>
                            </ul>
                        </li>
                        <?php
                            }
                        ?>

                        <?php
                            if($this->crud_model->admin_permission('review')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="review"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/review/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('complain Box');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>

                         <?php
                            if($this->crud_model->admin_permission('punishment')){
                        ?>
                        <!--Menu list item-->
                        <li <?php if($page_name=="punishment"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/punishment/">
                                <i class="fa fa-users"></i>
                                    <span class="menu-title">
                                        <?php echo translate('Punishment list');?>
                                    </span>
                            </a>
                        </li>
                        <!--Menu list item-->
                        <?php
                            }
                        ?>
	
                        <?php
                            if($this->crud_model->admin_permission('initiative') ){
                        ?>
                        <li <?php if($page_name=="seo-settings" || $page_name=="language"|| $page_name=="newsletter" ||$page_name=="manage_admin" ){?>
                                     class="active-sub" 
                                        <?php } ?> >
                            <a href="#">
                                <i class="fa fa-user"></i>
                                <span class="menu-title">
                                    <?php echo translate('Site settings & Others');?>
                                </span>
                                <i class="fa arrow"></i>
                            </a>
            
                            <ul class="collapse <?php if($page_name=="seo-settings" || $page_name=="language"|| $page_name=="newsletter" ||$page_name=="manage_admin" ){?>
                                                                 in
                                                                    <?php } ?>" >
                                
                                
                        <?php
                            if($this->crud_model->admin_permission('language')){
                        ?> 
                        <li <?php if($page_name=="language"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/language_settings">
                                <i class="fa fa-language"></i>
                                <span class="menu-title">
                                    <?php echo translate('language');?>
                                </span>
                            </a>
                        </li>
                        <?php
                            }
                        ?>
                            <li <?php if($page_name=="manage_admin"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/manage_admin/">
                                <i class="fa fa-lock"></i>
                                <span class="menu-title">
                                    <?php echo translate('manage_admin_profile');?>
                                </span>
                            </a>
                        </li>
                                <?php
                            if($this->crud_model->admin_permission('seo')){
                        ?>
                        <li <?php if($page_name=="seo_settings"){?> class="active-link" <?php } ?> >
                            <a href="<?php echo base_url(); ?>index.php/admin/seo_settings">
                                <i class="fa fa-search-plus"></i>
                                <span class="menu-title">
                                    SEO
                                </span>
                            </a>
                        </li>
                        <?php
                            }
                        ?>
                               
                        <?php
                                    if($this->crud_model->admin_permission('newsletter')){
                                ?>
                                <li <?php if($page_name=="newsletter"){?> class="active-link" <?php } ?> >
                                    <a href="<?php echo base_url(); ?>index.php/admin/newsletter">
                                        <i class="fa fa-plus fs_i"></i>
                                            <?php echo translate('newsletters');?>
                                    </a>
                                </li>
                                <?php
                                    }
                                ?>
                                

                              
                            </ul>
                        </li>
                        <?php
                            }
                        ?>
            		
                                
							                               
                                                    

                       

                       
                        
                        
                        
                       
                        
                        
                </div>
            </div>
        </div>
    </div>
</nav>
<style>
.activate_bar{
border-left: 3px solid #1ACFFC;	
transition: all .6s ease-in-out;
}
.activate_bar:hover{
border-bottom: 3px solid #1ACFFC;
transition: all .6s ease-in-out;
background:#1ACFFC !important;
color:#000 !important;	
}
</style>