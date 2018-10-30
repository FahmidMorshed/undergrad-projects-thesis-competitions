<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Home extends CI_Controller
{
    
	
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
        //$this->load->library('paypal');
        /*cache control*/
		//ini_set("user_agent","My-Great-Marketplace-App");
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
        $page_data['slider']            = 'slider2';
        $page_data['slider_news']       = $this->crud_model->get_special('2','5');
        $page_data['category_place_5']  = $this->crud_model->get_category('2','5');
        $page_data['category_place_2']  = $this->crud_model->get_category('2','2');
        $page_data['category_place_4']  = $this->crud_model->get_category('2','4');
        $page_data['category_place_1']  = $this->crud_model->get_category('2','1');
        $page_data['category_place_3']  = $this->crud_model->get_category('2','3');
        $page_data['page_name']         = "home";
        $page_data['page_title']        = translate('home');
        $this->load->view('front/index', $page_data);
    }
    
    function home1()
    {
        $page_data['slider']        = 'slider1';
        $page_data['slider_news']       = $this->crud_model->get_special('2','7');
        $page_data['category_place_5']  = $this->crud_model->get_category('2','5');
        $page_data['category_place_7']  = $this->crud_model->get_category('2','7');
        $page_data['category_place_2']  = $this->crud_model->get_category('2','2');
        $page_data['category_place_4']  = $this->crud_model->get_category('2','4');
        $page_data['category_place_1']  = $this->crud_model->get_category('2','1');
        $page_data['category_place_3']  = $this->crud_model->get_category('2','3');
        $page_data['page_name']     = "home1";
        $page_data['page_title']    = translate('home1');
        $this->load->view('front/index', $page_data);
    }

    function news_detail()
    {
        $page_data['page_name']     = "news_detail";
        $page_data['page_title']    = translate('news_detail');
        $this->load->view('front/index', $page_data);
    }

    function page1()
    {
        
        $page_data['page_name']     = "page1";
        $page_data['page_title']    = translate('page1');
        $this->load->view('front/index', $page_data);
    }

    function page2()
    {
        
        $page_data['page_name']     = "page2";
        $page_data['page_title']    = translate('page2');
        $this->load->view('front/index', $page_data);
    }

    function page3()
    {
        
        $page_data['page_name']     = "page3";
        $page_data['page_title']    = translate('page3');
        $this->load->view('front/index', $page_data);
    }

    function page4()
    {
        
        $page_data['page_name']     = "page4";
        $page_data['page_title']    = translate('page4');
        $this->load->view('front/index', $page_data);
    }

    function page5()
    {
        
        $page_data['page_name']     = "page5";
        $page_data['page_title']    = translate('page5');
        $this->load->view('front/index', $page_data);
    }

  

    function error()
    {
        $this->load->view('front/error');
    }

    //SITEMAP
    function sitemap(){
        $otherurls = array(
                        base_url().'index.php/home/contact/',
                        base_url().'index.php/home/legal/terms_conditions',
                        base_url().'index.php/home/legal/privacy_policy'
                    );
        $producturls = array();
        $products = $this->db->get_where('product',array('status'=>'ok'))->result_array();
        foreach ($products as $row) {
            $producturls[] = $this->crud_model->product_link($row['product_id']);
        }
        $vendorurls = array();
        $vendors = $this->db->get_where('vendor',array('status'=>'approved'))->result_array();
        foreach ($vendors as $row) {
            $vendorurls[] = $this->crud_model->vendor_link($row['vendor_id']);
        }
        $page_data['otherurls']  = $otherurls;
        $page_data['producturls']  = $producturls;
        $page_data['vendorurls']  = $vendorurls;
        $this->load->view('front/sitemap', $page_data);
    }
    
}

/* End of file home.php */
/* Location: ./application/controllers/home.php */
