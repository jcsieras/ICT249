<?php
class Enrollment extends CI_Controller {
	
	public function __construct()
	{
		parent::__construct();
		$this->is_logged_in();
	}
	
	public function is_logged_in()
	{
		$is_logged_in = $this->session->userdata('is_logged_in');
		
		$student_id = $this->session->userdata('student_id');
		$_SESSION['student_id'] = $student_id;
		
		if(!isset($is_logged_in) || $is_logged_in != true )
		{
			echo 'You don\'t have permission to access this page. <a href="../">Login</a>';
			die();
		}
	}
	
	public function prf() 
	{
		$this->load->model('enrollment_model');
		$data['query'] = $this->enrollment_model->student_details();
		
		$data['content'] = 'prf';
		$this->load->view('includes/template_member', $data);
	}
	
	
	
	
}
?>