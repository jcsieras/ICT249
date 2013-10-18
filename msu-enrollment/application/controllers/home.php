<?php
class Home extends CI_Controller {
	
	public function index() 
	{
		$data['content'] = 'index';
		$this->load->view('includes/template', $data);
	}
	
	public function login() 
	{
		$data['content'] = 'login';
		$this->load->view('includes/template', $data);
	}
	
	public function login_failed() 
	{
		$data['content'] = 'login_failed';
		$this->load->view('includes/template', $data);
	}
	
	public function validate_credentials() 
	{
			$this->load->library('form_validation');
			$this->form_validation->set_rules('student_id', 'ID Number', 'trim|required');
			$this->form_validation->set_rules('password', 'Password', 'trim|required');
			
			if($this->form_validation->run() == FALSE) {
				$this->login(); 
			} 
			else { 
				$this->load->model('home_model');	
				$query = $this->home_model->validate('id');
			
					if($query == 1) {
						$data = array(
							'student_id' => $this->input->post('student_id'),
							'is_logged_in' => true
						);
						
						$this->session->set_userdata($data);
						redirect('enrollment/prf');
						
					}
					else {
						$this->login_failed();
					}
			}
			
	}
			
	
	public function logout()
	{
		$this->session->sess_destroy();
		$this->index();
	}	
}