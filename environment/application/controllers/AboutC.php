<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class AboutC extends CI_Controller
{
	public  function  index()
	{
		$page_data['page_name']         = "about_us";
        $page_data['page_title']        = translate('About Us');
        $this->load->view('front/index', $page_data);
	}
}