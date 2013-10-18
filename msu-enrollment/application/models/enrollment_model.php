<?php
class Enrollment_model extends CI_Model {
	
	public function __construct() {
		parent::__construct();
	}
	
	public function student_details()
	{
		$queryinfo = "SELECT * FROM student, akan_account where akan_account.student_id = student.student_id and student.student_id = '".$_SESSION['student_id']."'";
		$query = $this->db->query($queryinfo);
		return $query->result();
	}
	
	
	
	
	
	
	
}
?>