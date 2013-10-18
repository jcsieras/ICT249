<?php
class Home_model extends CI_Model { 

	public function __construct() {
		parent::__construct();	
	}
	
	public function validate($id) 
	{
		$this->db->where('student_id', $this->input->post('student_id'));
		$this->db->where('password', $this->input->post('password'));
		$query = $this->db->get('akan_account');
												 
			$sql="SELECT * FROM akan_account WHERE student_id='".$this->input->post('student_id')."' 
			and password='".$this->input->post('password')."'  ";
			$result=mysql_query($sql);
		
			$count=mysql_num_rows($result);
		
			while ($row = mysql_fetch_assoc($result)) 
				{
					$idnumber =$row['student_id'];
					$password = $row['password'];
				}
				
			mysql_free_result($result);
			
			if($query->num_rows != 0) {
				$id = 1;
				return $id;
			}
	}
	
	
			
}
?>