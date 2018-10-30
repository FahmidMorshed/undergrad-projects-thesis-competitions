<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class InboxC extends CI_Controller{

	public function index(){
         if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/inboxC/error' , 'refresh');
        }
        $page_data['page_name']     = "inbox";
        $page_data['page_title']    = translate('inbox');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        $page_data['send_query']     = $sent_query;
        $page_data['draft_query']    = $draft_query;
        

        $this->load->view('front/index', $page_data);
    }

    function sent(){
         if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/inboxC/error' , 'refresh');
        }
        $page_data['page_name']     = "sent";
        $page_data['page_title']    = translate('sent');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        $page_data['sent_query']     = $sent_query;
        $page_data['draft_query']    = $draft_query;

        $this->load->view('front/index', $page_data);
    }

    function draft(){
         if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/inboxC/error' , 'refresh');
        }
        $page_data['page_name']     = "draft";
        $page_data['page_title']    = translate('draft');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        $page_data['sent_query']     = $sent_query;
        $page_data['draft_query']    = $draft_query;

        $this->load->view('front/index', $page_data);
    }

    function compose($to = ''){
        if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/loginC' , 'refresh');
        }
        $page_data['page_name']     = "compose";
        $page_data['page_title']    = translate('compose');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        $send_query = $this->db->get_where('user' , array('user_id' => $to));
        $to = "";
        if($send_query->num_rows() > 0){
            $page_data['to']        = $send_query->row()->email;
        }
        else{
            $page_data['to']        = "";
        }
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        
        $this->load->view('front/index', $page_data);
    }

    function send_mail(){
        if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/inboxC/error' , 'refresh');
        }
        date_default_timezone_set('Asia/Dhaka');
        $datestring = "%D %M, %Y - %h:%i %a";
        $time = time();
        $t = date($datestring, $time);
        $query = $this->db->get_where('user' , array('name' => $this->session->userdata('user_name')));
        if($query->num_rows() == 0){
            echo "Something went worng!";
        }
        $row = $query->row();
        $type = $this->input->post('send');

        $data['to']     =   $this->input->post('sendto');
        $data['subject'] = $this->input->post('subject');
        $data['mail']       =   $this->input->post('mail');
        $data['from']      =   $row->email;
        $data['time']      =   $t;

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
            $query2 = $this->db->get_where('user' , array('email' => $this->input->post('sendto')));
            if($query2->num_rows() == 0){
                //NO USER FOUND
                $page_data['page_name']     = "compose";
                $page_data['page_title']    = translate('compose');
                $page_data['user_name']     = $this->session->userdata('user_name');
                $page_data['user_id']       = $this->session->userdata('user_id');
                $page_data['message']       = "No such user found!";
                $page_data['to']        = "";
                $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
                $row = $query->row();
                $page_data['row'] = $row;
                $this->load->view('front/index', $page_data);
            }
            else {
                $row_to = $query2->row();
                if($row_to->email == $row->email){
                    //SELF MAIL
                    $page_data['page_name']     = "compose";
                    $page_data['page_title']    = translate('compose');
                    $page_data['user_name']     = $this->session->userdata('user_name');
                    $page_data['user_id']       = $this->session->userdata('user_id');
                    $page_data['message']       = "Can't send mail to self";
                    $page_data['to']        = "";
                    $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
                    $row = $query->row();
                    $page_data['row'] = $row;
                    $this->load->view('front/index', $page_data);
                }
                else{

                    $data['user_id']   =    $row->user_id;
                    $data['type']      =   "1";     //SEND
                    $data['status']    =   "2";     //INVALID

                    if(!$this->db->insert('inbox' , $data)){
                        echo "SEND FAILED!";
                    };
                    
                    $data['user_id']   =    $row_to->user_id;
                    $data['type']      =    "0";    //RECIEVED
                    $data['status']    =    "0";    //UNREAD

                    if(!$this->db->insert('inbox' , $data)){
                        echo "RECIEVE FAILED!";
                    };
                    
                    $page_data['message']       = "MESSAGE SENT SUCCESSFULLY";
                }
            }
        }
        $page_data['page_name']     = "inbox";
        $page_data['page_title']    = translate('inbox');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        // $page_data['message']       = "MESSAGE SENT SUCCESSFULLY";
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;

        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        

        $this->load->view('front/index', $page_data);
        
    }

    function see_mail($mail_id){
        if($this->session->userdata('user_name') == ""){
                redirect(base_url() . 'index.php/loginC' , 'refresh');
        }
        $page_data['page_name']     = "my_mail";
        $page_data['page_title']    = translate('my_mail');
        $page_data['user_name']     = $this->session->userdata('user_name');
        $page_data['user_id']       = $this->session->userdata('user_id');
        $page_data['message']       = "";
        $to = "";
        $send_query = $this->db->get_where('user' , array('user_id' => $to));
        $to = "";
        if($send_query->num_rows() > 0){
            $page_data['to']        = $send_query->row()->email;
        }
        else{
            $page_data['to']        = "";
        }
        $query      =   $this->db->get_where('user' , array('name' => $page_data['user_name'] , 'user_id' => $page_data['user_id']));
        $row = $query->row();
        $page_data['row'] = $row;


        $rcv_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 0))->result_array();
        $rcv_query = array_reverse($rcv_query);
        $rcv_count                  = 0;
        foreach ($rcv_query as $row) {
            if($row['status']=="0"){
                $rcv_count = $rcv_count + 1;
            }
        }

        $sent_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 1))->result_array();
        $sent_query = array_reverse($sent_query);
        $sent_count                  = 0;
        foreach ($sent_query as $row) {
            $sent_count = $sent_count + 1;
        }

        $draft_query                  = $this->db->get_where('inbox' , array('user_id' => $page_data['user_id'] , 'type' => 2))->result_array();
        $draft_query = array_reverse($draft_query);
        $draft_count                  = 0;
        foreach ($draft_query as $row) {
            $draft_count = $draft_count + 1;
        }

        $mail_query                   = $this->db->get_where('inbox' , array('mail_id' => $mail_id))->result_array();
        $m_temp = "";
        foreach ($mail_query as $mr) {
            $m_temp = $mr;
            if($mr['type']==0){
                $mail_type = "FROM :";
                $update_data = array('status' => "1");
                $this->db->where('mail_id', $mail_id);
                $this->db->update('inbox', $update_data); 
            }
            else if($mr['type']==1){
                $mail_type = "TO :";
            }
            else if($mr['type']==2){
                $mail_type = "TO :";
            }
            else{
                $mail_type = "";
            }
        }
        $page_data['total_recieve']     = $rcv_count;
        $page_data['total_draft']     = $draft_count;   
        $page_data['total_sent']     = $sent_count;
        $page_data['recieve_query']  = $rcv_query;
        $page_data['mail_query']    = $m_temp;
        $page_data['mail_type']     = $mail_type;
        $this->load->view('front/index', $page_data);
    }

    function delete($mail_id){
        $this->db->delete('inbox', array('mail_id' => $mail_id));
        redirect(base_url() . 'index.php/inboxC' , 'refresh'); 
    }
    function error()
    {
        $this->load->view('front/error');
    }
}