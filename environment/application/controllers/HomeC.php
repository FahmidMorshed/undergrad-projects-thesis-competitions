<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class HomeC extends CI_Controller
{
    
    function __construct()
    {
        //   This is theconstructor for Homepage
        //   Loads The Database
        //   Set up the necessary headers
        //   Configures cache query
        //   crud model is set to ip data
        parent::__construct();
        $this->load->database();
		$cache_time	 =  $this->db->get_where('general_settings',array('type' => 'cache_time'))->row()->value;
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
    
    /* FUNCTION: Loads Homepage*/
    public function index()
    {
        $page_data['page_name']         = "home";
        $page_data['page_title']        = translate('home');
        $this->load->model('user_model');
        $this->load->model('crud_model');
        
        $page_data['awareness'] = $this->user_model->get_innitiatives("awareness");
        $page_data['law'] = $this->user_model->get_innitiatives("law");
        $page_data['funding'] = $this->user_model->get_innitiatives("funding");
        $page_data['blog'] = $this->user_model->get_blogs("blog");
        $page_data['blog_water'] = $this->user_model->get_blogs("blog", "1");
        $page_data['blog_air'] = $this->user_model->get_blogs("blog", "2");
        $page_data['blog_noise'] = $this->user_model->get_blogs("blog", "3");
        $page_data['blog_garbage'] = $this->user_model->get_blogs("blog", "4");


        $page_data['recent_reviews'] = $this->user_model->get_reviews();


        $this->load->library('googlemaps');

$config['center'] = '37.4419, -122.1419';
$config['zoom'] = 'auto';
$this->googlemaps->initialize($config);

$marker = array();
$marker['position'] = '37.429, -122.1419';

$this->googlemaps->add_marker($marker);
$page_data['map'] = $this->googlemaps->create_map();

        // $page_data['top_picks'] = $this->user_model->get_top_picks();
        // $page_data['top_picks'] = $this->user_model->get_top_picks();
        // $page_data['top_picks'] = $this->user_model->get_top_picks();
        $this->load->view('front/index', $page_data);
    }

    function test(){
        $page_data['page_name']         = "compose_mail";
        $page_data['page_title']        = translate('compose_mail');
        $this->load->view('front/index', $page_data);
    }
    
    

    function error()
    {
        $this->load->view('front/error');
    }

    
}

