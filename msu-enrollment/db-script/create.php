<?php
require_once 'connect.php';

	if(!mysql_select_db('msu_enrollment'))
	{
		$sql = "CREATE DATABASE msu_enrollment";
		mysql_query($sql);
	}
	else
	{	
		
			

	} //end else
?>