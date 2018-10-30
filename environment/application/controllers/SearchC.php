<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class SearchC extends CI_Controller{

	public function index(){
        $page_data['page_name']     = "search";
        $page_data['page_title']    = translate('search');
        $this->load->view('front/index', $page_data); 
    }

    function get_result(){
    	
    	// grabe all the values
       // /*
        $minimum_price      =  $this->input->post('minimum_rent');
        $maximum_price      =  $this->input->post('maximum_rent');
        $bedrooms           =  $this->input->post('bed_rooms')  ;
        $location           =  $this->input->post('location')  ;
        $keywords           =  $this->input->post('key_words') ;
		$available_from     =  $this->input->post('available_from') ;
		///*
		if($maximum_price==""){
			// $maximum price was not set
			$maximum_price = 100000000 ;
		}
		//echo $maximum_price ;
		if($minimum_price==""){
			//$minimum_price was not set
			$minimum_price = 0 ;
		}
		if($bedrooms==""){
			$bedrooms = 0 ;
		}
		if($available_from==""){
			$available_from = time() ;
		}
		//echo $minimum_price ;
		//echo $maximum_price ;
		//echo $available_from ;
		//*/
		// need improvement here
		//echo $minimum_price.'</br>'.$maximum_price.'</br>'.$bedrooms ;
		///*   kewords not included proabbly use count also include available date
        //$sql = "SELECT * FROM `property` WHERE ( rent<=? or rent>=? ) and   bedrooms>=? and available_from <= ?";  
        $sql = "SELECT * from property" ;
		$query = $this->db->query($sql,array($maximum_price,$minimum_price,$location,$location,$bedrooms,$available_from)) ;
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
        
        //*/
        
        $page_data['query'] = $query ;
        $page_data['page_name']     = "showresults";
        $page_data['page_title']    = translate('Show Results');
        $this->load->view('front/index', $page_data);
     //   */
    
    }
    function error()
    {
        $this->load->view('front/error');
    }
}