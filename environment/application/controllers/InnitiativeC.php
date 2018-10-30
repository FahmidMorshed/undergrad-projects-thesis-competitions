<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class InnitiativeC extends CI_Controller{

	public function index(){
        $page_data['page_name']  = "innitiative";
        // get all he dirstrict names from database

        $this->load->view('front/index', $page_data);
    }
    public function add_property($param="") {
               
        $data['property_name']     =   $this->input->post('property_name');
        $data['division'] = $this->input->post('division');
        $data['full_address']       =   $this->input->post('full_address');
        $data['bedrooms']      =   $this->input->post('bed_rooms');
        $data['rent']      =   $this->input->post('rent');
        $data['keywords']        =   $this->input->post('keywords');
        $data['available_from']      =   $this->input->post('available_from');
        $data['detail_description'] = $this->input->post('detail_description') ;
        $data['view_count'] = 0;
        $data['avg_rating'] = 0;
        $data['property_type'] = $this->input->post('property_type');
        $data['owner_id'] = $this->session->userdata('user_id');
        //print_r($data) ; 
        // insert it into database
        if(!$this->db->insert('property' , $data)){ 
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
            echo "UFFF";
        }

        $query = $this->db->get_where('property' , array('property_name' => $data['property_name'] ,'owner_id' => $data['owner_id']));
         if ($query->num_rows() > 0){
                    $row = $query->row();
                    //echo $row->property_id ;
                    
                    $page_data['page_name']     = "add_property_image";
                    $page_data['property_id'] = $row->property_id ;
                    $page_data['page_title']    = translate('Add Property Image');
                    $this->load->view('front/index', $page_data);
         }else{
             echo "something went worng" ;
             // something wrong has happened try again
         }
         
       
    }
    public function view_awareness($param=""){  
        
        $this->load->model('user_model');
        $query=$this->user_model->get_innitiatives('awareness');
        foreach ($query as $row) {
            if ($row['awareness_id'] == $param) {
                $page_data['awareness'] = $row;
                break;
            }
        }
        $page_data['page_name']     = "show_awareness";
        $page_data['page_title']    = translate('Awareness');
        $this->load->view('front/index', $page_data);
    }
    
    public function view($param="") {
        if($param==""){
            $owner=$this->session->userdata('user_id');
        }
        else{
            $owner=$param;
        }
       // echo $owner ;
        // make  a sql query and show all the properies
        
        $sql = "SELECT * FROM `property` WHERE owner_id=?";  
        $query = $this->db->query($sql,array($owner)) ;
        
        if ($query->num_rows() > 0)
        {
            foreach ($query->result() as $row)
            {
                $sql_1 = "SELECT * FROM `user` WHERE user_id=?" ;
                $query_1 = $this->db->query($sql_1,array($row->owner_id)) ;
                if($query_1->num_rows()>0){
                    foreach ($query_1->result() as $row1) {
                       // echo $row->name ;
                        $row->owner_name = $row1->name ;
                    }
                }    
            }
        }
        //echo "Hello" ;
        $page_data['query'] = $query ;
        $page_data['page_name']     = "showresults";
        $page_data['page_title']    = translate('Show Results');
        $this->load->view('front/index', $page_data);
    }

    public function postreview($param1="",$param2=""){
    	if($this->session->userdata('user_id') == ""){
                redirect(base_url().'index.php/LoginC/', refresh) ;
        }
        $page_data['property_id'] = $param1 ;
    	if($param2==""){
        	
            $page_data['page_name']     = "postreview";
        	$page_data['page_title']    = translate('Review');
        	$this->load->view('front/index', $page_data) ;
    	}else{
    	    //$email = $this->input->post('email') ;
            $review = $this->input->post('review') ;
            $rating = $this->input->post('rating') ;
            $property_id = $param1 ;
            $user_name = $this->session->userdata('user_name');
            $user_id = $this->session->userdata('user_id');
            date_default_timezone_set('Asia/Dhaka');
            $datestring = "%d %M, %Y - %h:%i %a";
            $time = time();
            $time = mdate($datestring, $time);

            $data['user_name'] = $this->session->userdata('user_name');
            $data['property_id'] = $param1 ;
            $data['review'] = $this->input->post('review') ;
            date_default_timezone_set('Asia/Dhaka');
            $datestring = "%d %M, %Y - %h:%i %a";
            $time = time();
            $data['time'] = mdate($datestring, $time);
            //$data['email'] = $this->input->post('email') ;

            $data['rating'] = $this->input->post('rating') ;    		
            $data['user_id'] = $this->session->userdata('user_id');
            if($this->db->insert('review', $data)){
                redirect(base_url().'index.php/PropertyC/viewsingleproperty/'.$property_id) ;
            }
            else{
                echo "hoy nai.";
            }
            
            //$time = date('Y-m-d-h-M-s');
			//echo $user_name ;
		//	echo $time ;
    		//echo  $email.'</br>'.$review ;
    		// now insert into DB
    		//echo $email.'</br>'.$property_id.'</br>'.$user_name.'</br>'.$time ;
        	
            //$sql = "INSERT INTO `review` (user_name,property_id,review,time,email,rating,user_id) VALUES (?,?,?,?,?,?,?);";  
        	//$query = $this->db->query($sql,array('user_name' => $user_name ,'property_id' =>$property_id,'review'=>$review,'time'=>$time,'email'=>$email, 'rating'=>$rating, 'user_id'=>$user_id)) ;
        	//redirect(base_url().'index.php/PropertyC/viewsingleproperty/'.$property_id) ;
    	}
    }

    public function add_property_image($param=""){
       // echo $param ;
        ///*
        $property_id = $param ;
        $config = array(
            'upload_path' => "./images/properties/",
            'allowed_types' => "gif|jpg|png|jpeg",
            'overwrite' => TRUE,
            'max_size' => "20480000", // Can be set to particular file size
            'max_height' => "1024",
            'max_width' => "2024",
            'file_name' => "property_" . "$property_id"
        );
        
        $this->load->library('upload', $config);
        if ($this->upload->do_upload()) {
            $page_data['page_name'] = "add_property_success";
            $page_data['page_title'] = translate('Add Property Success');
           //$page_data['message'] = "Property Has been Added Successfully :)" ;
            redirect(base_url().'index.php/PropertyC/viewsingleproperty/'.$param) ;
            //$this->load->view('front/index', $page_data);
        } else {
            $page_data['page_name'] = "error";
            $page_data['message'] = " Some Thing Went Worng";
            $this->load->view('front/index', $page_data);
        }         
        // */
    }
    
    public function edit($param1="",$param2="") {
    		if($param2==""){
    			$property_id = $param1 ;
    			$sql = "SELECT * FROM `property` where property_id=?" ;
    			$query = $this->db->query($sql,array('property_id' => $property_id)) ;
            	$page_data['page_name'] = "editproperty";
            	$page_data['query'] = $query ;
            	$this->load->view('front/index', $page_data);
    		}else{
    			//	echo $param2 ;
    		// grabe the datas
        	$data['property_name']     =   $this->input->post('property_name');
        	$data['division'] = $this->input->post('division');
        	$data['full_address']       =   $this->input->post('full_address');
        	$data['bedrooms']      =   $this->input->post('bed_rooms');
        	$data['rent']      =   $this->input->post('rent');
        	$data['keywords']        =   $this->input->post('keywords');
        	$data['available_from']      =   $this->input->post('available_from');
        	$data['detail_description'] = $this->input->post('detail_description') ;
    		print_r($data) ;
        	// change DB 
   			$sql = "UPDATE `property` SET property_name=?, division=?,full_address=?,bedrooms=?,rent=?,keywords=?,available_from=?,	detail_description=? where property_id=".$param1."" ;		
    		$query = $this->db->query($sql,array('property_name' => $data['property_name'] , 'division' => $data['division'],'full_address' => $data['full_address'],'bedrooms' => $data['bedrooms'],'rent' => $data['rent'],'keywords' => $data['keywords'],'available_from' => $data['available_from'],'detail_description' => $data['detail_description']));
        	redirect(base_url().'index.php/PropertyC/viewsingleproperty/'.$param1) ;		
    		}
    }
    
    function error()
    {
        $this->load->view('front/error');
    }
}