<div class="container">
	<div class="row">
	<form class="form-inline" role="form" action="<?php echo base_url();?>index.php/SearchC/get_result"  method="post">
        <div id="filter-panel" class="collapse filter-panel">
            <div class="panel panel-default">
                <div class="panel-body">
                        <div class="form-group">
                            <label class="filter-col" style="margin-right:0;" for="pref-perpage">Bed Rooms:</label>
                            <select id="pref-perpage" class="form-control"name="bed_rooms">
                                <option selected="selected" value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="more">More</option>
                            </select>                                
                        </div> <!-- form group [rows] -->
                        <div class="form-group">
                            <label class="filter-col" style="margin-right:0;" for="pref-search">Minimum Rent:</label>
                            <input type="text" class="form-control input-sm" id="pref-search" name="minimum_rent">
                        </div><!-- form group [search] -->
                        <div class="form-group">
                            <label class="filter-col" style="margin-right:0;" for="pref-search">Maximum Rent:</label>
                            <input type="text" class="form-control input-sm" id="pref-search" name="maximum_rent">
                        </div><!-- form group [search] -->
                        <div class="form-group">
                            <label class="filter-col" style="margin-right:0;" for="pref-search">City/Location:</label>
                            <input type="text" class="form-control input-sm" id="pref-search" name="location">
                        </div><!-- form group [search] -->
                        <div class="form-group">
                            <label class="filter-col" style="margin-right:0;" for="pref-search">Available From:</label>
                            <input type="date" class="form-control input-sm" id="pref-search" name="available_from">
                        </div><!-- form group [search] -->
                        
                            <button type="submit" class="btn btn-default filter-col">
                                <span class="glyphicon glyphicon-record"></span> Save Settings
                            </button>  
                        </div>
                </div>
            </div>
        </div>
        </br>
        <h2>Search House</h2></br>
        <div id="custom-search-input">
                <div class="input-group col-md-12">
                    <input type="text" class="form-control input-lg" placeholder="Type Anything" name="key_words"/>
                    <span class="input-group-btn">
                        <button class="btn btn-info btn-lg" type="submit">
                            <i class="glyphicon glyphicon-search"></i>
                        </button>
                    </span>
                </div>
         </div>      
         </br>
         </br> 
        <button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#filter-panel">
            <span class="glyphicon glyphicon-cog"></span> Advanced Search
        </button>
        </form>
	</div>
</div>
</br>
</br>