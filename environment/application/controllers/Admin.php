<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
class Admin extends CI_Controller
{
    
    
    function __construct()
    {
        parent::__construct();
        $this->load->database();
        //$this->load->library('paypal');
        /*cache control*/
        $this->output->set_header('Cache-Control: no-store, no-cache, must-revalidate, post-check=0, pre-check=0');
        $this->output->set_header('Pragma: no-cache');
        $this->crud_model->ip_data();
		$this->config->cache_query();
    }
    
    /* index of the admin. Default: Dashboard; On No Login Session: Back to login page. */
    public function index()
    {
        if ($this->session->userdata('admin_login') == 'yes') {
            if ($this->session->userdata('type') == 'local_authority')
                $page_data['page_name'] = "dashboard_local";
            else
            {
                $page_data['page_name'] = "dashboard";
            }
            $this->load->view('back/index', $page_data);
        } else {
            $page_data['control'] = "admin";
            $this->load->view('back/login',$page_data);
        }
    }
    
    /*Product Category add, edit, view, delete */
    function category($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('category')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['category_name'] = $this->input->post('category_name');
            $this->db->insert('category', $data);
            recache();
        } else if ($para1 == 'edit') {
            $page_data['category_data'] = $this->db->get_where('category', array(
                'category_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/category_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['category_name'] = $this->input->post('category_name');
            $this->db->where('category_id', $para2);
            $this->db->update('category', $data);
            recache();
        } elseif ($para1 == 'delete') {
            $this->db->where('category_id', $para2);
            $this->db->delete('category');
            recache();
        } elseif ($para1 == 'list') {
            $this->db->order_by('category_id', 'desc');
            $page_data['all_categories'] = $this->db->get('category')->result_array();
            $this->load->view('back/admin/category_list', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/category_add');
        } else {
            $page_data['page_name']      = "category";
            $page_data['all_categories'] = $this->db->get('category')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    

    /*Product slides add, edit, view, delete */
    function slides($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('slides')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $type                = 'slides';
            $data['name']        = $this->input->post('name');
            $this->db->insert('slides', $data);
            $id = $this->db->insert_id();
            $this->crud_model->file_up("img", "slides", $id, '', '', '.jpg');
            recache();
        } elseif ($para1 == "update") {
            $data['name']        = $this->input->post('name');
            $this->db->where('slides_id', $para2);
            $this->db->update('slides', $data);
            $this->crud_model->file_up("img", "slides", $para2, '', '', '.jpg');
            recache();
        } elseif ($para1 == 'delete') {
            $this->crud_model->file_dlt('slides', $para2, '.jpg');
            $this->db->where('slides_id', $para2);
            $this->db->delete('slides');
            recache();
        } elseif ($para1 == 'multi_delete') {
            $ids = explode('-', $param2);
            $this->crud_model->multi_delete('slides', $ids);
        } else if ($para1 == 'edit') {
            $page_data['slides_data'] = $this->db->get_where('slides', array(
                'slides_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/slides_edit', $page_data);
        } elseif ($para1 == 'list') {
            $this->db->order_by('slides_id', 'desc');
            $page_data['all_slidess'] = $this->db->get('slides')->result_array();
            $this->load->view('back/admin/slides_list', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/slides_add');
        } else {
            $page_data['page_name']  = "slides";
            $page_data['all_slidess'] = $this->db->get('slides')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    

    
    /*Frontend Banner Management */
    function banner($para1 = '', $para2 = '', $para3 = '')
    {
        if (!$this->crud_model->admin_permission('banner')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == "set") {
            $data['link']   = $this->input->post('link');
            $data['status'] = $this->input->post('status');
            $this->db->where('banner_id', $para2);
            $this->db->update('banner', $data);
            $this->crud_model->file_up("img", "banner", $para2);
            recache();
        } else if ($para1 == 'banner_publish_set') {
            if ($para3 == 'true') {
                $data['status'] = 'ok';
            } else if ($para3 == 'false') {
                $data['status'] = '0';
            }
            $this->db->where('banner_id', $para2);
            $this->db->update('banner', $data);
            recache();
        } else {
            $page_data['page_name']      = "banner";
            $page_data['all_categories'] = $this->db->get('category')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    function reporter($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('reporter')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['email']    = $this->input->post('email');
            $data['phone']    = $this->input->post('phone');
            $data['address']    = $this->input->post('address');
            $data['designation']    = $this->input->post('designation');
            
            $this->db->insert('reporter', $data);
        } else if ($para1 == 'edit') {
            $page_data['reporter_data'] = $this->db->get_where('reporter', array(
                'reporter_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/reporter_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['name']    = $this->input->post('name');
            $data['email']    = $this->input->post('email');
            $data['phone']    = $this->input->post('phone');
            $data['address']    = $this->input->post('address');
            $data['designation']    = $this->input->post('designation');
            $this->db->where('reporter_id', $para2);
            $this->db->update('reporter', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('reporter_id', $para2);
            $this->db->delete('reporter');
        } elseif ($para1 == 'list') {
            $this->db->order_by('reporter_id', 'desc');
            $page_data['all_reporters'] = $this->db->get('reporter')->result_array();
            $this->load->view('back/admin/reporter_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['reporter_data'] = $this->db->get_where('reporter', array(
                'reporter_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/reporter_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/reporter_add');
        } else {
            $page_data['page_name'] = "reporter";
            $page_data['all_reporters'] = $this->db->get('reporter')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function useful_link($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('useful_link')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['link']    = $this->input->post('link');
           
            
            $this->db->insert('useful_link', $data);
        } else if ($para1 == 'edit') {
            $page_data['useful_link_data'] = $this->db->get_where('useful_link', array(
                'useful_link_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/useful_link_edit', $page_data);
        } elseif ($para1 == "update") {
            
            $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['link']    = $this->input->post('link');
            
            $this->db->where('useful_link_id', $para2);
            $this->db->update('useful_link', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('useful_link_id', $para2);
            $this->db->delete('useful_link');
        } elseif ($para1 == 'list') {
            $this->db->order_by('useful_link_id', 'desc');
            $page_data['all_useful_links'] = $this->db->get('useful_link')->result_array();
            $this->load->view('back/admin/useful_link_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['useful_link_data'] = $this->db->get_where('useful_link', array(
                'useful_link_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/useful_link_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/useful_link_add');
        } else {
            $page_data['page_name'] = "useful_link";
            $page_data['all_useful_links'] = $this->db->get('useful_link')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
     
    function gallery($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('gallery')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
           
            $data['status']    = $this->input->post('status');
           
            
            $this->db->insert('gallery', $data);
        } else if ($para1 == 'edit') {
            $page_data['gallery_data'] = $this->db->get_where('gallery', array(
                'gallery_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/gallery_edit', $page_data);
        } elseif ($para1 == "update") {
            
            $data['title']    = $this->input->post('title');
            $data['status']    = $this->input->post('status');
          
            
            $this->db->where('gallery_id', $para2);
            $this->db->update('gallery', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('gallery_id', $para2);
            $this->db->delete('gallery');
        } elseif ($para1 == 'list') {
            $this->db->order_by('gallery_id', 'desc');
            $page_data['all_gallerys'] = $this->db->get('gallery')->result_array();
            $this->load->view('back/admin/gallery_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['gallery_data'] = $this->db->get_where('gallery', array(
                'gallery_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/gallery_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/gallery_add');
        } else {
            $page_data['page_name'] = "gallery";
            $page_data['all_gallerys'] = $this->db->get('gallery')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
   

    function speciality($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('speciality')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
          
            
            
            $this->db->insert('speciality', $data);
        } else if ($para1 == 'edit') {
            $page_data['speciality_data'] = $this->db->get_where('speciality', array(
                'speciality_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/speciality_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['title']    = $this->input->post('title');
            

            $this->db->where('speciality_id', $para2);
            $this->db->update('speciality', $data);
        } elseif ($para1 == 'list') {
            $this->db->order_by('speciality_id', 'desc');
            $page_data['all_specialitys'] = $this->db->get('speciality')->result_array();
            $this->load->view('back/admin/speciality_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['speciality_data'] = $this->db->get_where('speciality', array(
                'speciality_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/speciality_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/speciality_add');
        } else {
            $page_data['page_name'] = "speciality";
            $page_data['all_specialitys'] = $this->db->get('speciality')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }



    function video($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('video')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
            $data['link']    = $this->input->post('link');
            $data['status']    = $this->input->post('status');
            
            
            $this->db->insert('video', $data);
        } else if ($para1 == 'edit') {
            $page_data['video_data'] = $this->db->get_where('video', array(
                'video_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/video_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
            $data['link']    = $this->input->post('link');
            $data['status']    = $this->input->post('status');


            $this->db->where('video_id', $para2);
            $this->db->update('video', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('video_id', $para2);
            $this->db->delete('video');
        } elseif ($para1 == 'list') {
            $this->db->order_by('video_id', 'desc');
            $page_data['all_videos'] = $this->db->get('video')->result_array();
            $this->load->view('back/admin/video_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['video_data'] = $this->db->get_where('video', array(
                'video_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/video_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/video_add');
        } else {
            $page_data['page_name'] = "video";
            $page_data['all_videos'] = $this->db->get('video')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function vehicle($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('vehicle')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['route_id']    = $this->input->post('route_id');
            $data['status_id']    = $this->input->post('status_id');
            
            
            $this->db->insert('vehicle', $data);
        } else if ($para1 == 'edit') {
            $page_data['vehicle_data'] = $this->db->get_where('vehicle', array(
                'vehicle_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/vehicle_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['name']    = $this->input->post('name');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['route_id']    = $this->input->post('route_id');
            $data['status_id']    = $this->input->post('status_id');



            $this->db->where('vehicle_id', $para2);
            $this->db->update('vehicle', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('vehicle_id', $para2);
            $this->db->delete('vehicle');
        } elseif ($para1 == 'list') {
            $this->db->order_by('vehicle_id', 'desc');
            $page_data['all_vehicles'] = $this->db->get('vehicle')->result_array();
            $this->load->view('back/admin/vehicle_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['vehicle_data'] = $this->db->get_where('vehicle', array(
                'vehicle_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/vehicle_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/vehicle_add');
        } else {
            $page_data['page_name'] = "vehicle";
            $page_data['all_vehicles'] = $this->db->get('vehicle')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


    function dustbin($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('dustbin')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['area_id']    = $this->input->post('area_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['vehicle_id']    = $this->input->post('vehicle_id');
            $data['status_id']    = $this->input->post('status_id');
            $data['location']    = $this->input->post('location');
            
            
            $this->db->insert('dustbin', $data);
        } else if ($para1 == 'edit') {
            $page_data['dustbin_data'] = $this->db->get_where('dustbin', array(
                'dustbin_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/dustbin_edit', $page_data);
        } elseif ($para1 == "update") {
          
           $data['area_id']    = $this->input->post('area_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['vehicle_id']    = $this->input->post('vehicle_id');
            $data['status_id']    = $this->input->post('status_id');
            $data['location']    = $this->input->post('location');


            $this->db->where('dustbin_id', $para2);
            $this->db->update('dustbin', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('dustbin_id', $para2);
            $this->db->delete('dustbin');
        } elseif ($para1 == 'list') {
            $this->db->order_by('dustbin_id', 'desc');
            $page_data['all_dustbins'] = $this->db->get('dustbin')->result_array();
            $this->load->view('back/admin/dustbin_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['dustbin_data'] = $this->db->get_where('dustbin', array(
                'dustbin_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/dustbin_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/dustbin_add');
        } else {
            $page_data['page_name'] = "dustbin";
            $page_data['all_dustbins'] = $this->db->get('dustbin')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


    function route($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('route')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['area_id']    = $this->input->post('area_id');
            $data['latitude']    = $this->input->post('latitude');
            $data['longitude']    = $this->input->post('longitude');
            
            
            $this->db->insert('route', $data);
        } else if ($para1 == 'edit') {
            $page_data['route_data'] = $this->db->get_where('route', array(
                'route_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/route_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['name']    = $this->input->post('name');
            $data['area_id']    = $this->input->post('area_id');
            $data['latitude']    = $this->input->post('latitude');
            $data['longitude']    = $this->input->post('longitude');



            $this->db->where('route_id', $para2);
            $this->db->update('route', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('route_id', $para2);
            $this->db->delete('route');
        } elseif ($para1 == 'list') {
            $this->db->order_by('route_id', 'desc');
            $page_data['all_routes'] = $this->db->get('route')->result_array();
            $this->load->view('back/admin/route_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['route_data'] = $this->db->get_where('route', array(
                'route_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/route_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/route_add');
        } else {
            $page_data['page_name'] = "route";
            $page_data['all_routes'] = $this->db->get('route')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


   
    function garbage_collector($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('garbage_collector')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['address']    = $this->input->post('address');
            $data['phone']    = $this->input->post('phone');
            $data['status_id']    = $this->input->post('status_id');
            
            
            $this->db->insert('garbage_collector', $data);
        } else if ($para1 == 'edit') {
            $page_data['garbage_collector_data'] = $this->db->get_where('garbage_collector', array(
                'garbage_collector_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/garbage_collector_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['name']    = $this->input->post('name');
            $data['address']    = $this->input->post('address');
            $data['phone']    = $this->input->post('phone');
            $data['status_id']    = $this->input->post('status_id');


            $this->db->where('garbage_collector_id', $para2);
            $this->db->update('garbage_collector', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('garbage_collector_id', $para2);
            $this->db->delete('garbage_collector');
        } elseif ($para1 == 'list') {
            $this->db->order_by('garbage_collector_id', 'desc');
            $page_data['all_garbage_collectors'] = $this->db->get('garbage_collector')->result_array();
            $this->load->view('back/admin/garbage_collector_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['garbage_collector_data'] = $this->db->get_where('garbage_collector', array(
                'garbage_collector_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/garbage_collector_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/garbage_collector_add');
        } else {
            $page_data['page_name'] = "garbage_collector";
            $page_data['all_garbage_collectors'] = $this->db->get('garbage_collector')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
 
    function water_pollution($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('water_pollution')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
                 $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['water_pollution_type_id']    = $this->input->post('water_pollution_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->session->set_userdata('area_id');
            
            
            $this->db->insert('water_pollution', $data);
        } else if ($para1 == 'edit') {
            $page_data['water_pollution_data'] = $this->db->get_where('water_pollution', array(
                'water_pollution_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/water_pollution_edit', $page_data);
        } elseif ($para1 == "update") {
          
                  $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['water_pollution_type_id']    = $this->input->post('water_pollution_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->session->set_userdata('area_id');


            $this->db->where('water_pollution_id', $para2);
            $this->db->update('water_pollution', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('water_pollution_id', $para2);
            $this->db->delete('water_pollution');
        } elseif ($para1 == 'list') {
            $this->db->order_by('water_pollution_id', 'desc');
            $page_data['all_water_pollutions'] = $this->db->get('water_pollution')->result_array();
            $this->load->view('back/admin/water_pollution_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['water_pollution_data'] = $this->db->get_where('water_pollution', array(
                'water_pollution_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/water_pollution_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/water_pollution_add');
        } else {
            $page_data['page_name'] = "water_pollution";
            $page_data['all_water_pollutions'] = $this->db->get('water_pollution')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function water_pollution_type($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('water_pollution_type')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
         
            $data['type']    = $this->input->post('type');
            
            
            
            $this->db->insert('water_pollution_type', $data);
        } else if ($para1 == 'edit') {
            $page_data['water_pollution_type_data'] = $this->db->get_where('water_pollution_type', array(
                'water_pollution_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/water_pollution_type_edit', $page_data);
        } elseif ($para1 == "update") {
          
     
            $data['type']    = $this->input->post('type');
           

            $this->db->where('water_pollution_type_id', $para2);
            $this->db->update('water_pollution_type', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('water_pollution_type_id', $para2);
            $this->db->delete('water_pollution_type');
        } elseif ($para1 == 'list') {
            $this->db->order_by('water_pollution_type_id', 'desc');
            $page_data['all_water_pollution_types'] = $this->db->get('water_pollution_type')->result_array();
            $this->load->view('back/admin/water_pollution_type_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['water_pollution_type_data'] = $this->db->get_where('water_pollution_type', array(
                'water_pollution_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/water_pollution_type_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/water_pollution_type_add');
        } else {
            $page_data['page_name'] = "water_pollution_type";
            $page_data['all_water_pollution_types'] = $this->db->get('water_pollution_type')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function air_pollution($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('air_pollution')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
              $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['air_pollution_type_id']    = $this->input->post('air_pollution_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->session->set_userdata('area_id');            
            
            $this->db->insert('air_pollution', $data);
        } else if ($para1 == 'edit') {
            $page_data['air_pollution_data'] = $this->db->get_where('air_pollution', array(
                'air_pollution_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/air_pollution_edit', $page_data);
        } elseif ($para1 == "update") {
          
               $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['air_pollution_type_id']    = $this->input->post('air_pollution_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->session->set_userdata('area_id');            


            $this->db->where('air_pollution_id', $para2);
            $this->db->update('air_pollution', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('air_pollution_id', $para2);
            $this->db->delete('air_pollution');
        } elseif ($para1 == 'list') {
            $this->db->order_by('air_pollution_id', 'desc');
            $page_data['all_air_pollutions'] = $this->db->get('air_pollution')->result_array();
            $this->load->view('back/admin/air_pollution_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['air_pollution_data'] = $this->db->get_where('air_pollution', array(
                'air_pollution_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/air_pollution_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/air_pollution_add');
        } else {
            $page_data['page_name'] = "air_pollution";
            $page_data['all_air_pollutions'] = $this->db->get('air_pollution')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function air_pollution_type($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('air_pollution_type')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['type']    = $this->input->post('type');
          
            
            
            $this->db->insert('air_pollution_type', $data);
        } else if ($para1 == 'edit') {
            $page_data['air_pollution_type_data'] = $this->db->get_where('air_pollution_type', array(
                'air_pollution_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/air_pollution_type_edit', $page_data);
        } elseif ($para1 == "update") {
          
            
            $data['type']    = $this->input->post('type');
           


            $this->db->where('air_pollution_type_id', $para2);
            $this->db->update('air_pollution_type', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('air_pollution_type_id', $para2);
            $this->db->delete('air_pollution_type');
        } elseif ($para1 == 'list') {
            $this->db->order_by('air_pollution_type_id', 'desc');
            $page_data['all_air_pollution_types'] = $this->db->get('air_pollution_type')->result_array();
            $this->load->view('back/admin/air_pollution_type_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['air_pollution_type_data'] = $this->db->get_where('air_pollution_type', array(
                'air_pollution_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/air_pollution_type_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/air_pollution_type_add');
        } else {
            $page_data['page_name'] = "air_pollution_type";
            $page_data['all_air_pollution_types'] = $this->db->get('air_pollution_type')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function noisy_point($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('noisy_point')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['noisy_point_type_id']    = $this->input->post('noisy_point_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->session->set_userdata('area_id');
            $this->db->insert('noisy_point', $data);
        } else if ($para1 == 'edit') {
            $page_data['noisy_point_data'] = $this->db->get_where('noisy_point', array(
                'noisy_point_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/noisy_point_edit', $page_data);
        } elseif ($para1 == "update") {
          
           $data['name']    = $this->input->post('name');
            $data['status_id']    = $this->input->post('status_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['noisy_point_type_id']    = $this->input->post('noisy_point_type_id');
             $data['action']    = $this->input->post('action');
            $data['reason']    = $this->input->post('reason');
             $data['area_id']    = $this->input->post('area_id');


            $this->db->where('noisy_point_id', $para2);
            $this->db->update('noisy_point', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('noisy_point_id', $para2);
            $this->db->delete('noisy_point');
        } elseif ($para1 == 'list') {
            $this->db->order_by('noisy_point_id', 'desc');
            $page_data['all_noisy_points'] = $this->db->get('noisy_point')->result_array();
            $this->load->view('back/admin/noisy_point_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['noisy_point_data'] = $this->db->get_where('noisy_point', array(
                'noisy_point_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/noisy_point_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/noisy_point_add');
        } else {
            $page_data['page_name'] = "noisy_point";
            $page_data['all_noisy_points'] = $this->db->get('noisy_point')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


    function noisy_point_type($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('noisy_point_type')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['type']    = $this->input->post('type');
            
            
            
            $this->db->insert('noisy_point_type', $data);
        } else if ($para1 == 'edit') {
            $page_data['noisy_point_type_data'] = $this->db->get_where('noisy_point_type', array(
                'noisy_point_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/noisy_point_type_edit', $page_data);
        } elseif ($para1 == "update") {
          
            $data['type']    = $this->input->post('type');
            


            $this->db->where('noisy_point_type_id', $para2);
            $this->db->update('noisy_point_type', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('noisy_point_type_id', $para2);
            $this->db->delete('noisy_point_type');
        } elseif ($para1 == 'list') {
            $this->db->order_by('noisy_point_type_id', 'desc');
            $page_data['all_noisy_point_types'] = $this->db->get('noisy_point_type')->result_array();
            $this->load->view('back/admin/noisy_point_type_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['noisy_point_type_data'] = $this->db->get_where('noisy_point_type', array(
                'noisy_point_type_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/noisy_point_type_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/noisy_point_type_add');
        } else {
            $page_data['page_name'] = "noisy_point_type";
            $page_data['all_noisy_point_types'] = $this->db->get('noisy_point_type')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

   

    function news($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('news')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['description']    = $this->input->post('description');
            $data['date']    = $this->input->post('date');
            $data['admin']    = $this->input->post('admin');
            $data['speciality_id']    = json_encode($this->input->post('speciality_id'));

            $data['status']    = $this->input->post('status');
            $data['reporter_id']    = $this->input->post('reporter_id');
            $data['category_id']    = $this->input->post('category_id');
            $this->db->insert('news', $data);
            $id = $this->db->insert_id();
            $this->crud_model->file_up("img", "news", $id, '', '', '.jpg');

            
        } else if ($para1 == 'edit') {
            $page_data['news_data'] = $this->db->get_where('news', array(
                'news_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/news_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['description']    = $this->input->post('description');
            $data['date']    = $this->input->post('date');
            $data['admin']    = $this->input->post('admin');
            $data['speciality_id']    = json_encode($this->input->post('speciality_id'));
           
            $data['status']    = $this->input->post('status');
            $data['reporter_id']    = $this->input->post('reporter_id');
            $data['category_id']    = $this->input->post('category_id');


            $this->db->where('news_id', $para2);
            $this->db->update('news', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('news_id', $para2);
            $this->db->delete('news');
        } elseif ($para1 == 'list') {
            $this->db->order_by('news_id', 'desc');
            $page_data['all_newss'] = $this->db->get('news')->result_array();
            $this->load->view('back/admin/news_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['news_data'] = $this->db->get_where('news', array(
                'news_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/news_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/news_add');
        } else {
            $page_data['page_name'] = "news";
            $page_data['all_newss'] = $this->db->get('news')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

      function area($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('area')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['people']    = $this->input->post('people');
            $data['length']    = $this->input->post('length');
            $data['admin_id']    = $this->input->post('admin_id');
            $data['union_id']    = $this->input->post('union_id');
            $data['block']    = $this->input->post('block');
            $data['status_id']    = $this->input->post('status_id');
            
            
            $this->db->insert('area', $data);
        } else if ($para1 == 'edit') {
            $page_data['area_data'] = $this->db->get_where('area', array(
                'area_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/area_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['name']    = $this->input->post('name');
            $data['people']    = $this->input->post('people');
            $data['length']    = $this->input->post('length');
            $data['admin_id']    = $this->input->post('admin_id');
            $data['union_id']    = $this->input->post('union_id');
            $data['block']    = $this->input->post('block');
            $data['status_id']    = $this->input->post('status_id');
            $this->db->where('area_id', $para2);
            $this->db->update('area', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('area_id', $para2);
            $this->db->delete('area');
        } elseif ($para1 == 'list') {
            $this->db->order_by('area_id', 'desc');
            $page_data['all_areas'] = $this->db->get('area')->result_array();
            $this->load->view('back/admin/area_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['area_data'] = $this->db->get_where('area', array(
                'area_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/area_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/area_add');
        } else {
            $page_data['page_name'] = "area";
            $page_data['all_areas'] = $this->db->get('area')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


    function widget($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('widget')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
            $data['detail']    = $this->input->post('detail');
            $data['position']    = $this->input->post('position');
            $data['status']    = $this->input->post('status');
            
            
            $this->db->insert('widget', $data);
        } else if ($para1 == 'edit') {
            $page_data['widget_data'] = $this->db->get_where('widget', array(
                'widget_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/widget_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
             $data['detail']    = $this->input->post('detail');
            $data['position']    = $this->input->post('position');
            $data['status']    = $this->input->post('status');
            $this->db->where('widget_id', $para2);
            $this->db->update('widget', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('widget_id', $para2);
            $this->db->delete('widget');
        } elseif ($para1 == 'list') {
            $this->db->order_by('widget_id', 'desc');
            $page_data['all_widgets'] = $this->db->get('widget')->result_array();
            $this->load->view('back/admin/widget_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['widget_data'] = $this->db->get_where('widget', array(
                'widget_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/widget_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/widget_add');
        } else {
            $page_data['page_name'] = "widget";
            $page_data['all_widgets'] = $this->db->get('widget')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


   function union($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('union')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'delete') {
            $this->db->where('union_id', $para2);
            $this->db->delete('union');
        } elseif ($para1 == 'list') {
            $this->db->order_by('union_id', 'desc');
            $page_data['all_unions'] = $this->db->get('union')->result_array();
            $this->load->view('back/admin/union_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['union_data'] = $this->db->get_where('union', array(
                'union_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/union_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/union_add');
        } else {
            $page_data['page_name'] = "union";
            $page_data['all_unions'] = $this->db->get('union')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
   function upazila($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('upazila')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'delete') {
            $this->db->where('upazila_id', $para2);
            $this->db->delete('upazila');
        } elseif ($para1 == 'list') {
            $this->db->order_by('upazila_id', 'desc');
            $page_data['all_upazilas'] = $this->db->get('upazila')->result_array();
            $this->load->view('back/admin/upazila_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['upazila_data'] = $this->db->get_where('upazila', array(
                'upazila_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/upazila_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/upazila_add');
        } else {
            $page_data['page_name'] = "upazila";
            $page_data['all_upazilas'] = $this->db->get('upazila')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

function district($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('district')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'delete') {
            $this->db->where('district_id', $para2);
            $this->db->delete('district');
        } elseif ($para1 == 'list') {
            $this->db->order_by('district_id', 'desc');
            $page_data['all_districts'] = $this->db->get('district')->result_array();
            $this->load->view('back/admin/district_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['district_data'] = $this->db->get_where('district', array(
                'district_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/district_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/district_add');
        } else {
            $page_data['page_name'] = "district";
            $page_data['all_districts'] = $this->db->get('district')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    function division($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('division')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'delete') {
            $this->db->where('division_id', $para2);
            $this->db->delete('division');
        } elseif ($para1 == 'list') {
            $this->db->order_by('division_id', 'desc');
            $page_data['all_divisions'] = $this->db->get('division')->result_array();
            $this->load->view('back/admin/division_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['division_data'] = $this->db->get_where('division', array(
                'division_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/division_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/division_add');
        } else {
            $page_data['page_name'] = "division";
            $page_data['all_divisions'] = $this->db->get('division')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    function employee($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('employee')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['phone']    = $this->input->post('phone');
            $data['email']    = $this->input->post('email');
            $data['address']    = $this->input->post('address');
            $data['area_id']    = $this->input->post('area_id');
            $data['employee_type_id']    = $this->input->post('employee_type_id');
             $data['status_id']    = $this->input->post('status_id');
            $data['payment']    = $this->input->post('payment');
            
            
            $this->db->insert('employee', $data);
        } else if ($para1 == 'edit') {
            $page_data['employee_data'] = $this->db->get_where('employee', array(
                'employee_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/employee_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['name']    = $this->input->post('name');
            $data['phone']    = $this->input->post('phone');
            $data['email']    = $this->input->post('email');
            $data['address']    = $this->input->post('address');
            $data['area_id']    = $this->input->post('area_id');
            $data['employee_type_id']    = $this->input->post('employee_type_id');
             $data['status_id']    = $this->input->post('status_id');
            $data['payment']    = $this->input->post('payment');

            $this->db->where('employee_id', $para2);
            $this->db->update('employee', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('employee_id', $para2);
            $this->db->delete('employee');
        } elseif ($para1 == 'list') {
            $this->db->order_by('employee_id', 'desc');
            $page_data['all_employees'] = $this->db->get('employee')->result_array();
            $this->load->view('back/admin/employee_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['employee_data'] = $this->db->get_where('employee', array(
                'employee_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/employee_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/employee_add');
        } else {
            $page_data['page_name'] = "employee";
            $page_data['all_employees'] = $this->db->get('employee')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
     function authority($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('authority')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['question']    = $this->input->post('question');
            $data['options']    = $this->input->post('options');
            $data['status']    = $this->input->post('status');
           
        
            
            
            $this->db->insert('authority', $data);
        } else if ($para1 == 'edit') {
            $page_data['authority_data'] = $this->db->get_where('authority', array(
                'authority_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/authority_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['question']    = $this->input->post('question');
            $data['options']    = $this->input->post('options');
            $data['status']    = $this->input->post('status');

            $this->db->where('authority_id', $para2);
            $this->db->update('authority', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('authority_id', $para2);
            $this->db->delete('authority');
        } elseif ($para1 == 'list') {
            $this->db->order_by('authority_id', 'desc');
            $page_data['all_authoritys'] = $this->db->get('authority')->result_array();
            $this->load->view('back/admin/authority_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['authority_data'] = $this->db->get_where('authority', array(
                'authority_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/authority_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/authority_add');
        } else {
            $page_data['page_name'] = "authority";
            $page_data['all_authoritys'] = $this->db->get('authority')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
   function public1($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('public')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']    = $this->input->post('name');
            $data['n_id']    = $this->input->post('n_id');
            $data['age']    = $this->input->post('age');
            $data['area_id']    = $this->input->post('area_id');
           
        
            
            
            $this->db->insert('public', $data);
        } else if ($para1 == 'edit') {
            $page_data['public_data'] = $this->db->get_where('public', array(
                'public_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/public_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['name']    = $this->input->post('name');
            $data['n_id']    = $this->input->post('n_id');
            $data['age']    = $this->input->post('age');
            $data['area_id']    = $this->input->post('area_id');

            $this->db->where('public_id', $para2);
            $this->db->update('public', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('public_id', $para2);
            $this->db->delete('public');
        } elseif ($para1 == 'list') {
            $this->db->order_by('public_id', 'desc');
            $page_data['all_publics'] = $this->db->get('public')->result_array();
            $this->load->view('back/admin/public_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['public_data'] = $this->db->get_where('public', array(
                'public_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/public_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/public_add');
        } else {
            $page_data['page_name'] = "public";
            $page_data['all_publics'] = $this->db->get('public')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    function area_report($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('area_report')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'list') {
            $this->db->order_by('area_report_id', 'desc');
            //$page_data['all_area_reports'] = $this->db->get('area_report')->result_array();
            $this->load->view('back/admin/area_report_list', $page_data);
        }else {
            $page_data['page_name'] = "area_report";
            //$page_data['all_area_reports'] = $this->db->get('area_report')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

     function pollution_report($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('pollution_report')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'list') {
            $this->db->order_by('pollution_report_id', 'desc');
            //$page_data['all_pollution_reports'] = $this->db->get('pollution_report')->result_array();
            $this->load->view('back/admin/pollution_report_list', $page_data);
        }else {
            $page_data['page_name'] = "pollution_report";
            //$page_data['all_pollution_reports'] = $this->db->get('pollution_report')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

     function complain_report($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('complain_report')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'list') {
            $this->db->order_by('complain_report_id', 'desc');
            //$page_data['all_complain_reports'] = $this->db->get('complain_report')->result_array();
            $this->load->view('back/admin/complain_report_list', $page_data);
        }else {
            $page_data['page_name'] = "complain_report";
            //$page_data['all_complain_reports'] = $this->db->get('complain_report')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }


      function law($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('law')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['law_name']    = $this->input->post('law_name');
            $data['description']    = $this->input->post('description');
            
           
        
            
            
            $this->db->insert('law', $data);
        } else if ($para1 == 'edit') {
            $page_data['law_data'] = $this->db->get_where('law', array(
                'law_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/law_edit', $page_data);
        } elseif ($para1 == "update") {
           $data['law_name']    = $this->input->post('law_name');
            $data['description']    = $this->input->post('description');


            $this->db->where('law_id', $para2);
            $this->db->update('law', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('law_id', $para2);
            $this->db->delete('law');
        } elseif ($para1 == 'list') {
            $this->db->order_by('law_id', 'desc');
            $page_data['all_laws'] = $this->db->get('law')->result_array();
            $this->load->view('back/admin/law_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['law_data'] = $this->db->get_where('law', array(
                'law_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/law_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/law_add');
        } else {
            $page_data['page_name'] = "law";
            $page_data['all_laws'] = $this->db->get('law')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

    function awareness($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('awareness')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');
            $data['area_id']    = $this->input->post('area_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['description']    = $this->input->post('description');
            $data['time']    = $this->input->post('time');
            $data['title']    = $this->input->post('title');
            $data['aim']    = $this->input->post('focus');

            $data['focus']    = $this->input->post('aim');

           

        
            
            
            $this->db->insert('awareness', $data);
        } else if ($para1 == 'edit') {
            $page_data['awareness_data'] = $this->db->get_where('awareness', array(
                'awareness_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/awareness_edit', $page_data);
        } elseif ($para1 == "update") {
             $data['pollution_type_id']    = $this->input->post('pollution_type_id');
            $data['area_id']    = $this->input->post('area_id');
            $data['employee_id']    = $this->input->post('employee_id');
            $data['description']    = $this->input->post('description');
            $data['time']    = $this->input->post('time');
            $data['title']    = $this->input->post('title');
            $data['aim']    = $this->input->post('focus');

            $data['focus']    = $this->input->post('aim');


            $this->db->where('awareness_id', $para2);
            $this->db->update('awareness', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('awareness_id', $para2);
            $this->db->delete('awareness');
        } elseif ($para1 == 'list') {
            $this->db->order_by('awareness_id', 'desc');
            $page_data['all_awarenesss'] = $this->db->get('awareness')->result_array();
            $this->load->view('back/admin/awareness_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['awareness_data'] = $this->db->get_where('awareness', array(
                'awareness_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/awareness_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/awareness_add');
        } else {
            $page_data['page_name'] = "awareness";
            $page_data['all_awarenesss'] = $this->db->get('awareness')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

     function funding($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('funding')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');
            $data['title']    = $this->input->post('title');
            $data['area_id']    = $this->input->post('area_id');
            $data['description']    = $this->input->post('description');
          
            $data['remark']= "Start";
        
            
            
            $this->db->insert('funding', $data);
        } else if ($para1 == 'edit') {
            $page_data['funding_data'] = $this->db->get_where('funding', array(
                'funding_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/funding_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');
            $data['title']    = $this->input->post('title');
            $data['area_id']    = $this->input->post('area_id');
            $data['description']    = $this->input->post('description');
            $data['remark']    = $this->input->post('remark');
            $this->db->where('funding_id', $para2);
            $this->db->update('funding', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('funding_id', $para2);
            $this->db->delete('funding');
        } elseif ($para1 == 'list') {
            $this->db->order_by('funding_id', 'desc');
            $page_data['all_fundings'] = $this->db->get('funding')->result_array();
            $this->load->view('back/admin/funding_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['funding_data'] = $this->db->get_where('funding', array(
                'funding_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/funding_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/funding_add');
        } else {
            $page_data['page_name'] = "funding";
            $page_data['all_fundings'] = $this->db->get('funding')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

     function research($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('research')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['question']    = $this->input->post('question');
            $data['options']    = $this->input->post('options');
            $data['status']    = $this->input->post('status');
           
        
            
            
            $this->db->insert('research', $data);
        } else if ($para1 == 'edit') {
            $page_data['research_data'] = $this->db->get_where('research', array(
                'research_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/research_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['question']    = $this->input->post('question');
            $data['options']    = $this->input->post('options');
            $data['status']    = $this->input->post('status');

            $this->db->where('research_id', $para2);
            $this->db->update('research', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('research_id', $para2);
            $this->db->delete('research');
        } elseif ($para1 == 'list') {
            $this->db->order_by('research_id', 'desc');
            $page_data['all_researchs'] = $this->db->get('research')->result_array();
            $this->load->view('back/admin/research_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['research_data'] = $this->db->get_where('research', array(
                'research_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/research_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/research_add');
        } else {
            $page_data['page_name'] = "research";
            $page_data['all_researchs'] = $this->db->get('research')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
     function review($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('review')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'edit') {
            $page_data['review_data'] = $this->db->get_where('review', array(
                'review_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/review_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['solution']    = $this->input->post('solution');
            $data['remark']    = $this->input->post('remark');
            

            $this->db->where('review_id', $para2);
            $this->db->update('review', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('review_id', $para2);
            $this->db->delete('review');
        } elseif ($para1 == 'list') {
            $this->db->order_by('review_id', 'desc');
            $page_data['all_reviews'] = $this->db->get('review')->result_array();
            $this->load->view('back/admin/review_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['review_data'] = $this->db->get_where('review', array(
                'review_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/review_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/review_add');
        } else {
            $page_data['page_name'] = "review";
            $page_data['all_reviews'] = $this->db->get('review')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
     
    function punishment($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('punishment')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['employee_id']    = $this->input->post('employee_id');
            $data['area_id']    = $this->input->post('area_id');
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');
              $data['description']    = $this->input->post('description');
            $data['action']    = $this->input->post('action');
             $data['date']    = $this->input->post('date');
            
           
        
            
            
            $this->db->insert('punishment', $data);
        } else if ($para1 == 'edit') {
            $page_data['punishment_data'] = $this->db->get_where('punishment', array(
                'punishment_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/punishment_edit', $page_data);
        } elseif ($para1 == "update") {
                $data['employee_id']    = $this->input->post('employee_id');
            $data['area_id']    = $this->input->post('area_id');
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');
             $data['description']    = $this->input->post('descriptction');
            $data['action']    = $this->input->post('action');
             $data['date']    = $this->input->post('date');

            $this->db->where('punishment_id', $para2);
            $this->db->update('punishment', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('punishment_id', $para2);
            $this->db->delete('punishment');
        } elseif ($para1 == 'list') {
            $this->db->order_by('punishment_id', 'desc');
            $page_data['all_punishments'] = $this->db->get('punishment')->result_array();
            $this->load->view('back/admin/punishment_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['punishment_data'] = $this->db->get_where('punishment', array(
                'punishment_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/punishment_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/punishment_add');
        } else {
            $page_data['page_name'] = "punishment";
            $page_data['all_punishments'] = $this->db->get('punishment')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }

     function blog($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('blog')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['description']    = $this->input->post('description');
              $data['motivation']    = $this->input->post('motivation');
            $data['pollution_type_id']    = $this->input->post('pollution_type_id');        
            $data['date']    = $this->input->post('date');
            
            $this->db->insert('blog', $data);
        } else if ($para1 == 'edit') {
            $page_data['blog_data'] = $this->db->get_where('blog', array(
                'blog_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/blog_edit', $page_data);
        } elseif ($para1 == "update") {
             $data['title']    = $this->input->post('title');
            $data['summary']    = $this->input->post('summary');
            $data['description']    = $this->input->post('description');
              $data['motivation']    = $this->input->post('motivation');
            $data['pollution_type_id']    = $this->input->post('pollution_type_id'); 
             $data['date']    = $this->input->post('date');
            $this->db->where('blog_id', $para2);
            $this->db->update('blog', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('blog_id', $para2);
            $this->db->delete('blog');
        } elseif ($para1 == 'list') {
            $this->db->order_by('blog_id', 'desc');
            $page_data['all_blogs'] = $this->db->get('blog')->result_array();
            $this->load->view('back/admin/blog_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['blog_data'] = $this->db->get_where('blog', array(
                'blog_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/blog_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/blog_add');
        } else {
            $page_data['page_name'] = "blog";
            $page_data['all_blogs'] = $this->db->get('blog')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    function menu($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('menu')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
            $data['detail']    = $this->input->post('detail');
           
            $data['status']    = $this->input->post('status');
            
            
            $this->db->insert('menu', $data);
        } else if ($para1 == 'edit') {
            $page_data['menu_data'] = $this->db->get_where('menu', array(
                'menu_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/menu_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['title']    = $this->input->post('title');
            $data['type']    = $this->input->post('type');
             $data['detail']    = $this->input->post('detail');
         
            $data['status']    = $this->input->post('status');
            $this->db->where('menu_id', $para2);
            $this->db->update('menu', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('menu_id', $para2);
            $this->db->delete('menu');
        } elseif ($para1 == 'list') {
            $this->db->order_by('menu_id', 'desc');
            $page_data['all_menus'] = $this->db->get('menu')->result_array();
            $this->load->view('back/admin/menu_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['menu_data'] = $this->db->get_where('menu', array(
                'menu_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/menu_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/menu_add');
        } else {
            $page_data['page_name'] = "menu";
            $page_data['all_menus'] = $this->db->get('menu')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    
    
    /*User Management */
    function user($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('user')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['username']    = $this->input->post('user_name');
            $data['description'] = $this->input->post('description');
            $this->db->insert('user', $data);
        } else if ($para1 == 'edit') {
            $page_data['user_data'] = $this->db->get_where('user', array(
                'user_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/user_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['username']    = $this->input->post('username');
            $data['description'] = $this->input->post('description');
            $this->db->where('user_id', $para2);
            $this->db->update('user', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('user_id', $para2);
            $this->db->delete('user');
        } elseif ($para1 == 'list') {
            $this->db->order_by('user_id', 'desc');
            $page_data['all_users'] = $this->db->get('user')->result_array();
            $this->load->view('back/admin/user_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['user_data'] = $this->db->get_where('user', array(
                'user_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/user_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/user_add');
        } else {
            $page_data['page_name'] = "user";
            $page_data['all_users'] = $this->db->get('user')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    
    /* Administrator Management */
    function admins($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('admin')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']      = $this->input->post('name');
            $data['email']     = $this->input->post('email');
            $data['phone']     = $this->input->post('phone');
            $data['address']   = $this->input->post('address');
            $password          = substr(hash('sha512', rand()), 0, 12);
            $data['password']  = sha1($password);
            $data['role']      = $this->input->post('role');
            $data['timestamp'] = time();
            $this->db->insert('admin', $data);
            $this->email_model->account_opening('admin', $data['email'], $password);
        } else if ($para1 == 'edit') {
            $page_data['admin_data'] = $this->db->get_where('admin', array(
                'admin_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/admin_edit', $page_data);
        } elseif ($para1 == "update") {
            $data['name']    = $this->input->post('name');
            $data['email']   = $this->input->post('email');
            $data['phone']   = $this->input->post('phone');
            $data['address'] = $this->input->post('address');
            $data['role']    = $this->input->post('role');
            $this->db->where('admin_id', $para2);
            $this->db->update('admin', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('admin_id', $para2);
            $this->db->delete('admin');
        } elseif ($para1 == 'list') {
            $this->db->order_by('admin_id', 'desc');
            $page_data['all_admins'] = $this->db->get('admin')->result_array();
            $this->load->view('back/admin/admin_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['admin_data'] = $this->db->get_where('admin', array(
                'admin_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/admin_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/admin_add');
        } else {
            $page_data['page_name']  = "admin";
            $page_data['all_admins'] = $this->db->get('admin')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    /* Account Role Management */
    function role($para1 = '', $para2 = '')
    {
        if (!$this->crud_model->admin_permission('role')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $data['name']        = $this->input->post('name');
            $data['permission']  = json_encode($this->input->post('permission'));
            $data['description'] = $this->input->post('description');
            $this->db->insert('role', $data);
        } elseif ($para1 == "update") {
            $data['name']        = $this->input->post('name');
            $data['permission']  = json_encode($this->input->post('permission'));
            $data['description'] = $this->input->post('description');
            $this->db->where('role_id', $para2);
            $this->db->update('role', $data);
        } elseif ($para1 == 'delete') {
            $this->db->where('role_id', $para2);
            $this->db->delete('role');
        } elseif ($para1 == 'list') {
            $this->db->order_by('role_id', 'desc');
            $page_data['all_roles'] = $this->db->get('role')->result_array();
            $this->load->view('back/admin/role_list', $page_data);
        } elseif ($para1 == 'view') {
            $page_data['role_data'] = $this->db->get_where('role', array(
                'role_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/role_view', $page_data);
        } elseif ($para1 == 'add') {
            $page_data['all_permissions'] = $this->db->get('permission')->result_array();
            $this->load->view('back/admin/role_add', $page_data);
        } else if ($para1 == 'edit') {
            $page_data['all_permissions'] = $this->db->get('permission')->result_array();
            $page_data['role_data']       = $this->db->get_where('role', array(
                'role_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/role_edit', $page_data);
        } else {
            $page_data['page_name'] = "role";
            $page_data['all_roles'] = $this->db->get('role')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    
    /* Checking if email exists*/
    function exists()
    {
        $email  = $this->input->post('email');
        $admin  = $this->db->get('admin')->result_array();
        $exists = 'no';
        foreach ($admin as $row) {
            if ($row['email'] == $email) {
                $exists = 'yes';
            }
        }
        echo $exists;
    }
    
    /* Login into Admin panel */
    function login($para1 = '')
    {
        if ($para1 == 'forget_form') {
            $page_data['control'] = 'vendor';
            $this->load->view('back/forget_password',$page_data);
        } else if ($para1 == 'forget') {
			
        	$this->load->library('form_validation');
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email');			
            if ($this->form_validation->run() == FALSE)
            {
                echo validation_errors();
            }
            else
            {
				$query = $this->db->get_where('admin', array(
					'email' => $this->input->post('email')
				));
				if ($query->num_rows() > 0) {
					$admin_id         = $query->row()->admin_id;
					$password         = substr(hash('sha512', rand()), 0, 12);
					$data['password'] = sha1($password);
					$this->db->where('admin_id', $admin_id);
					$this->db->update('admin', $data);
					if ($this->email_model->password_reset_email('admin', $admin_id, $password)) {
						echo 'email_sent';
					} else {
						echo 'email_not_sent';
					}
				} else {
					echo 'email_nay';
				}
			}
        } else {
        	$this->load->library('form_validation');
			$this->form_validation->set_rules('email', 'Email', 'required|valid_email');
			$this->form_validation->set_rules('password', 'Password', 'required');
			
            if ($this->form_validation->run() == FALSE)
            {
                echo validation_errors();
            }
            else
            {
				$login_data = $this->db->get_where('admin', array(
					'email' => $this->input->post('email'),
					'password' => sha1($this->input->post('password'))
				));

				if ($login_data->num_rows() > 0) {
					foreach ($login_data->result_array() as $row) {
						$this->session->set_userdata('login', 'yes');
						$this->session->set_userdata('admin_login', 'yes');
						$this->session->set_userdata('admin_id', $row['admin_id']);
                        $this->session->set_userdata('area_id', $row['area_id']);
						$this->session->set_userdata('admin_name', $row['name']);
                        $this->session->set_userdata('type', $row['type']);

						$this->session->set_userdata('title', 'admin');
						echo 'lets_login';
					}
				}
                else {
					echo 'login_failed';
				}
			}
        }
    }
    
    /* Loging out from Admin panel */
    function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url() . 'index.php/admin', 'refresh');
    }
    
    /* Sending Newsletters */
    function newsletter($para1 = "")
    {
        if (!$this->crud_model->admin_permission('newsletter')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == "send") {
            $users       = explode(',', $this->input->post('users'));
            $subscribers = explode(',', $this->input->post('subscribers'));
            $text        = $this->input->post('text');
            $title       = $this->input->post('title');
            $from        = $this->input->post('from');
            foreach ($users as $key => $user) {
                if ($user !== '') {
                    $this->email_model->newsletter($title, $text, $user, $from);
                }
            }
            foreach ($subscribers as $key => $subscriber) {
                if ($subscriber !== '') {
                    $this->email_model->newsletter($title, $text, $subscriber, $from);
                }
            }
        } else {
            $page_data['users']       = $this->db->get('user')->result_array();
            $page_data['subscribers'] = $this->db->get('subscribe')->result_array();
            $page_data['page_name']   = "newsletter";
            $this->load->view('back/index', $page_data);
        }
    }
    
    
    /* Checking Login Stat */
    function is_logged()
    {
        if ($this->session->userdata('admin_login') == 'yes') {
            echo 'yah!good';
        } else {
            echo 'nope!bad';
        }
    }
    
    /* Manage Frontend User Interface */
    function page_settings($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        $page_data['page_name'] = "page_settings";
        $page_data['tab_name']  = $para1;
        $this->load->view('back/index', $page_data);
    }
    
    /* Manage Frontend Facebook Login Credentials */
    function social_login_settings($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        $this->db->where('type', "fb_appid");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('appid')
        ));
        $this->db->where('type', "fb_secret");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('secret')
        ));
        $this->db->where('type', "application_name");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('application_name')
        ));
        $this->db->where('type', "client_id");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('client_id')
        ));
        $this->db->where('type', "client_secret");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('client_secret')
        ));
        $this->db->where('type', "redirect_uri");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('redirect_uri')
        ));
        $this->db->where('type', "api_key");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('api_key')
        ));
    }
    
    /* Manage Frontend Facebook Login Credentials */
    function product_comment($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        $this->db->where('type', "discus_id");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('discus_id')
        ));
        $this->db->where('type', "comment_type");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('type')
        ));
        $this->db->where('type', "fb_comment_api");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('fb_comment_api')
        ));
    }
    
    /* Manage Frontend Captcha Settings Credentials */
    function captcha_settings($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        $this->db->where('type', "captcha_public");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('cpub')
        ));
        $this->db->where('type', "captcha_private");
        $this->db->update('general_settings', array(
            'value' => $this->input->post('cprv')
        ));
    }
    
    /* Manage Site Settings */
    function site_settings($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        $page_data['page_name'] = "site_settings";
        $page_data['tab_name']  = $para1;
        $this->load->view('back/index', $page_data);
    }
    
    /* Manage Languages */
    function language_settings($para1 = "", $para2 = "", $para3 = "")
    {
        if (!$this->crud_model->admin_permission('language')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'add_lang') {
            $this->load->view('back/admin/language_add');
        } elseif ($para1 == 'lang_list') {
            //if($para2 !== ''){
            $this->db->order_by('word_id', 'desc');
            $page_data['words'] = $this->db->get('language')->result_array();
            $page_data['lang']  = $para2;
            $this->load->view('back/admin/language_list', $page_data);
            //}
        } elseif ($para1 == 'add_word') {
            $page_data['lang'] = $para2;
            $this->load->view('back/admin/language_word_add', $page_data);
            recache();
        } elseif ($para1 == 'upd_trn') {
            $word_id     = $para2;
            $translation = $this->input->post('translation');
            $language    = $this->input->post('lang');
            $word        = $this->db->get_where('language', array(
                'word_id' => $word_id
            ))->row()->word;
            add_translation($word, $language, $translation);
            recache();
        } elseif ($para1 == 'do_add_word') {
            $language = $para2;
            $word     = $this->input->post('word');
            add_lang_word($word);
            recache();
        } elseif ($para1 == 'do_add_lang') {
            $language = $this->input->post('language');
            add_language($language);
            recache();
        } elseif ($para1 == 'check_existed') {
            echo lang_check_exists($para2);
        } elseif ($para1 == 'lang_select') {
            $this->load->view('back/admin/language_select');
        } elseif ($para1 == 'dlt_lang') {
            $this->load->dbforge();
            $this->dbforge->drop_column('language', $para2);
            recache();
        } elseif ($para1 == 'dlt_word') {
            $this->db->where('word_id', $para2);
            $this->db->delete('language');
            recache();
        } else {
            $page_data['page_name'] = "language";
            $this->load->view('back/index', $page_data);
        }
    }
    
    
    /* Manage Admin Settings */
    function manage_admin($para1 = "")
    {
        if ($this->session->userdata('admin_login') != 'yes') {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'update_password') {
            $user_data['password'] = $this->input->post('password');
            $account_data          = $this->db->get_where('admin', array(
                'admin_id' => $this->session->userdata('admin_id')
            ))->result_array();
            foreach ($account_data as $row) {
                if (sha1($user_data['password']) == $row['password']) {
                    if ($this->input->post('password1') == $this->input->post('password2')) {
                        $data['password'] = sha1($this->input->post('password1'));
                        $this->db->where('admin_id', $this->session->userdata('admin_id'));
                        $this->db->update('admin', $data);
                        echo 'updated';
                    }
                } else {
                    echo 'pass_prb';
                }
            }
        } else if ($para1 == 'update_profile') {
            $this->db->where('admin_id', $this->session->userdata('admin_id'));
            $this->db->update('admin', array(
                'name' => $this->input->post('name'),
                'email' => $this->input->post('email'),
                'address' => $this->input->post('address'),
                'phone' => $this->input->post('phone')
            ));
        } else {
            $page_data['page_name'] = "manage_admin";
            $this->load->view('back/index', $page_data);
        }
    }
    
    /*Page Management */
    function page($para1 = '', $para2 = '', $para3 = '')
    {
        if (!$this->crud_model->admin_permission('page')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == 'do_add') {
            $parts             = array();
            $data['page_name'] = $this->input->post('page_name');
            $data['parmalink'] = $this->input->post('parmalink');
            $size              = $this->input->post('part_size');
            $type              = $this->input->post('part_content_type');
            $content           = $this->input->post('part_content');
            $widget            = $this->input->post('part_widget');
            var_dump($widget);
            foreach ($size as $in => $row) {
                $parts[] = array(
                    'size' => $size[$in],
                    'type' => $type[$in],
                    'content' => $content[$in],
                    'widget' => $widget[$in]
                );
            }
            $data['parts']  = json_encode($parts);
            $data['status'] = 'ok';
            $this->db->insert('page', $data);
            recache();
        } else if ($para1 == 'edit') {
            $page_data['page_data'] = $this->db->get_where('page', array(
                'page_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/page_edit', $page_data);
        } elseif ($para1 == "update") {
            $parts             = array();
            $data['page_name'] = $this->input->post('page_name');
            $data['parmalink'] = $this->input->post('parmalink');
            $size              = $this->input->post('part_size');
            $type              = $this->input->post('part_content_type');
            $content           = $this->input->post('part_content');
            $widget            = $this->input->post('part_widget');
            var_dump($widget);
            foreach ($size as $in => $row) {
                $parts[] = array(
                    'size' => $size[$in],
                    'type' => $type[$in],
                    'content' => $content[$in],
                    'widget' => $widget[$in]
                );
            }
            $data['parts'] = json_encode($parts);
            $this->db->where('page_id', $para2);
            $this->db->update('page', $data);
            recache();
        } elseif ($para1 == 'delete') {
            $this->db->where('page_id', $para2);
            $this->db->delete('page');
            recache();
        } elseif ($para1 == 'list') {
            $this->db->order_by('page_id', 'desc');
            $page_data['all_page'] = $this->db->get('page')->result_array();
            $this->load->view('back/admin/page_list', $page_data);
        } else if ($para1 == 'page_publish_set') {
            $page = $para2;
            if ($para3 == 'true') {
                $data['status'] = 'ok';
            } else {
                $data['status'] = '0';
            }
            $this->db->where('page_id', $page);
            $this->db->update('page', $data);
            recache();
        } elseif ($para1 == 'view') {
            $page_data['page_data'] = $this->db->get_where('page', array(
                'page_id' => $para2
            ))->result_array();
            $this->load->view('back/admin/page_view', $page_data);
        } elseif ($para1 == 'add') {
            $this->load->view('back/admin/page_add');
        } else {
            $page_data['page_name'] = "page";
            $page_data['all_pages'] = $this->db->get('page')->result_array();
            $this->load->view('back/index', $page_data);
        }
    }
    
    /* Manage General Settings */
   
    
    /* Manage Social Links */
    function social_links($para1 = "")
    {
        if (!$this->crud_model->admin_permission('site_settings')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == "set") {
            $this->db->where('type', "facebook");
            $this->db->update('social_links', array(
                'value' => $this->input->post('facebook')
            ));
            $this->db->where('type', "google-plus");
            $this->db->update('social_links', array(
                'value' => $this->input->post('google-plus')
            ));
            $this->db->where('type', "twitter");
            $this->db->update('social_links', array(
                'value' => $this->input->post('twitter')
            ));
            $this->db->where('type', "skype");
            $this->db->update('social_links', array(
                'value' => $this->input->post('skype')
            ));
            $this->db->where('type', "pinterest");
            $this->db->update('social_links', array(
                'value' => $this->input->post('pinterest')
            ));
            $this->db->where('type', "youtube");
            $this->db->update('social_links', array(
                'value' => $this->input->post('youtube')
            ));
            redirect(base_url() . 'index.php/admin/site_settings/social_links/', 'refresh');
        }
        recache();
    }
    /* Manage SEO relateds */
    function seo_settings($para1 = "")
    {
        if (!$this->crud_model->admin_permission('seo')) {
            redirect(base_url() . 'index.php/admin');
        }
        if ($para1 == "set") {
            $this->db->where('type', "meta_description");
            $this->db->update('general_settings', array(
                'value' => $this->input->post('description')
            ));
            $this->db->where('type', "meta_keywords");
            $this->db->update('general_settings', array(
                'value' => $this->input->post('keywords')
            ));
            $this->db->where('type', "meta_author");
            $this->db->update('general_settings', array(
                'value' => $this->input->post('author')
            ));

            $this->db->where('type', "revisit_after");
            $this->db->update('general_settings', array(
                'value' => $this->input->post('revisit_after')
            ));
            recache();
        }
        else {
            require_once (APPPATH . 'libraries/SEOstats/bootstrap.php');
            $page_data['page_name'] = "seo";
            $this->load->view('back/index', $page_data);
        }
    }


}
/* End of file welcome.php */
/* Location: ./application/controllers/welcome.php */