<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Post_a_feedbackC extends CI_Controller{

    function __construct()
    {
        //   This is theconstructor for Homepage
        //   Loads The Database
        //   Set up the necessary headers
        //   Configures cache query
        //   crud model is set to ip data
        parent::__construct();
        $this->load->database();
        $cache_time  =  $this->db->get_where('general_settings',array('type' => 'cache_time'))->row()->value;
        if(!$this->input->is_ajax_request()){
            $this->output->set_header('HTTP/1.0 200 OK');
            $this->output->set_header('HTTP/1.1 200 OK');
            $this->output->set_header('Last-Modified: '.gmdate('D, d M Y H:i:s', time()).' GMT');
            $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate');
            $this->output->set_header('Cache-Control: post-check=0, pre-check=0');
            $this->output->set_header('Pragma: no-cache');
            if($this->router->fetch_method() == 'index'){
                $this->output->cache($cache_time);
            }
        }
        $this->config->cache_query();
        $this->crud_model->ip_data();
    }

    public function index(){
        
        if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/loginC' , 'refresh');
        }
        $page_data['page_name']     = "post_a_feedback";
        $page_data['page_title']    = translate('post_a_feedback');
        $this->load->model('user_model');
        $this->load->model('crud_model');

        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        
        $query      =   $this->db->get_where('public' , array('name' => $page_data['user_name'] , 'public_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $sent_query                  = $this->db->get_where('review' , array('public_id' => $page_data['user_id']))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $page_data['total_sent']     = $sent_count;


        $page_data['recent_reviews'] = $this->user_model->get_reviews();
        $user_id = $this->session->userdata('user_id');
        $page_data['my_recent_reviews'] = $this->user_model->get_my_reviews("$user_id");
        
        $this->load->view('front/index', $page_data);
    }

    function send_feedback(){
        if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/inboxC/error' , 'refresh');
        }
        date_default_timezone_set('Asia/Dhaka');
        $datestring = "d M, Y - h:i a";
        $time = time();
        $t = date($datestring, $time);
        $query = $this->db->get_where('public' , array('name' => $this->session->userdata('user_name')));
        if($query->num_rows() == 0){
            echo "Something went worng!";
        }
        $row = $query->row();
        $type = $this->input->post('send');

        $data['pollution_type_id'] = $this->input->post('pollution_type_id');
        $data['description']       =   $this->input->post('mail');
        $data['area_id'] = $this->input->post('area_id');
        $data['public_id'] = $this->session->userdata('user_id');
        $data['title'] = $this->input->post('subject');
        $data['date']      =   $t;

        if($type == "save"){
            $data['user_id']   =    $row->user_id;
            $data['type']      =   "2";     //DRAFT
            $data['status']    =   "2";     //INVALID


            if(!$this->db->insert('inbox' , $data)){
                echo "DRAFT FAILED!";
            };
            $page_data['message']       = "MESSAGE DRAFTED SUCCESSFULLY";
        }
        else if($type == "send"){
                if(!$this->db->insert('review' , $data)){
                        echo "SEND FAILED!";
                };
                $page_data['message']       = "MESSAGE SENT SUCCESSFULLY";
                
        }
        
        $page_data['page_name']     = "post_a_feedback";
        $page_data['page_title']    = translate('post_a_feedback');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        // $page_data['message']       = "MESSAGE SENT SUCCESSFULLY";
        $query      =   $this->db->get_where('public' , array('name' => $page_data['user_name'] , 'public_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;
        redirect(base_url() . 'index.php/post_a_feedbackC' , 'refresh');
        
    }

}
?>