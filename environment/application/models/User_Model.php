<?php
class user_model extends CI_Model{
    //insert into user table
    function insertUser($data)
    {
        return $this->db->insert('user', $data);
    }
    
    public function get_innitiatives($table, $filter="") {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . "$table");
        if($filter != ""){
            $this->db->where('pollution_type_id', $filter);
        }
        $this->db->order_by('time', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_innitiatives_area($table, $filter="") {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . "$table");
        if($filter != ""){
            $this->db->where('area_id', $filter);
        }
        $this->db->order_by('time', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }


    public function get_my_area() {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . "public");
        
        $this->db->where('public_id', $this->session->userdata('user_id'));
        
        $query = $this->db->get();

        $result = $query->result_array();
        
        foreach ($result as $row) {
            $this->db->select('*');
            $this->db->from($this->db->dbprefix . "area");
            $this->db->where('area_id', $row['area_id']);
            $query = $this->db->get();

            if ($query->num_rows() > 0) {
                
                return $query->result_array();
            } else {
                return false;
            }
        }
        return false;
    }

    public function get_this_awareness($awareness_id){
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . "awareness");
        
        $this->db->where('awareness_id', $awareness_id);
        
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_blogs($table, $filter="") {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . "$table");
        if($filter != ""){
            $this->db->where('pollution_type_id', $filter);
        }
        $this->db->order_by('date', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }


    public function get_awareness($filter="") {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . 'awareness');
        if($filter != ""){
            $this->db->where('awareness_type', $filter);
        }
        $this->db->order_by('awareness_id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_reviews($filter="") {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . 'review');
        if($filter != ""){
            $this->db->where('pollution_type_id', $filter);
        }
        $this->db->order_by('review_id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }
    public function get_my_reviews($filter) {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . 'review');
        $this->db->where('public_id', $filter);
        $this->db->order_by('review_id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_reviews_area($my_area) {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . 'review');
        $this->db->where('area_id', $my_area); 
        $this->db->order_by('review_id', 'DESC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    public function get_area() {
        $this->db->select('*');
        $this->db->from($this->db->dbprefix . 'area');
        
        $this->db->order_by('area_id', 'ASC');
        $query = $this->db->get();

        if ($query->num_rows() > 0) {
            
            return $query->result_array();
        } else {
            echo"Jhamela";
            return false;
        }
    }
    



    public function get_top_picks($filter="") {
        //$sql = "SELECT * FROM `property` ORDER BY property_id DESC";
        //$query = $this->db->query($sql);
        $this->db->select('property_id, property_name, full_address, bedrooms, rent, available_from, owner_id, detail_description, view_count, (avg_rating*5+view_count*2) avg, (avg_rating*view_count) top, property_type');
        $this->db->from($this->db->dbprefix . 'property');
        if($filter != ""){
            $this->db->where('property_type', $filter);
        }
        $this->db->order_by('avg', 'DESC');
        $query = $this->db->get();

        if (($query->num_rows()) > 0) {
            
            return $query->result_array();
        } else {
            return false;
        }
    }

    

    //send verification email to user's email id
    function sendEmail($to_email)
    {
        $from_email = 'x.fahid@gmail.com'; //change this to yours
        $subject = 'Verify Your Email Address';
        $message = 'Dear User,<br /><br />Please click on the below activation link to verify your email address.<br /><br /> http://www.mydomain.com/user/verify/' . md5($to_email) . '<br /><br /><br />Thanks<br />Mydomain Team';
        
        //configure email settings
        $config['protocol'] = 'smtp';
        $config['smtp_host'] = 'ssl://smtp.googlemail.com'; //smtp host name
        $config['smtp_port'] = '465'; //smtp port number
        $config['smtp_user'] = $from_email;
        $config['smtp_pass'] = ''; //$from_email password
        $config['mailtype'] = 'html';
        $config['charset'] = 'iso-8859-1';
        //$config['SMTPSecure'] = 'tls';
        $config['wordwrap'] = TRUE;
        $config['newline'] = "\r\n"; //use double quotes
        //@mail($to_email, $subject, $message, "", "-f " . $from_email);
        $this->load->library('email');
        $this->email->initialize($config);
        //send mail
        $this->email->from($from_email, 'Admin');
        $this->email->to($to_email);
        $this->email->subject($subject);
        $this->email->message($message);
        if(!$this->email->send())
        {
            echo "$this->email->print_debugger()";
            //redirect(base_url() . 'index.php/searchC' , 'refresh');
            
        }
        else{
            redirect(base_url() . 'index.php/homeC' , 'refresh');
        }
    }
    
    //activate user account
    function verifyEmailID($key)
    {
        $data = array('status' => 1);
        $this->db->where('md5(email)', $key);
        return $this->db->update('user', $data);
    }	
}
?>