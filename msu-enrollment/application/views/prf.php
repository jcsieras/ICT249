<!-- PRF Page -->
    	<div data-role="page" data-theme="a" id="prf">
            <div data-role="header" data-theme="a" data-fullscreen="false" data-position="fixed">
            <p align="center">Preliminary Registration Form</p>	
    		</div>
            
    		<div data-role="content" data-theme="e"> 
            <div data-role="fieldcontain">
				<?php
					foreach($query as $row){
						$_SESSION['student_id'] = $row->student_id;
						$_SESSION['fname'] = $row->fname;
						$_SESSION['lname'] = $row->lname;
						$_SESSION['mname'] = $row->mname;
						$_SESSION['course'] = $row->course;
					}
                ?>
                <?php
				$today = date('Y-m-d');
					$query = $this->db->query('SELECT * FROM term 
						where start_date < "'.$today.'" order by start_date DESC limit 1');
							if ($query->num_rows() > 0) {			
								foreach ($query->result_array() as $row) {
										$term_id = $row['term_id'];
										$start_date = $row['start_date'];
										$school_yr = $row['school_yr'];
										$semester = $row['semester'];
								}
							}
				?>
            </div>
            
				 <div class="ui-grid-a">
					<div class="ui-block-a">
						<p><strong>ID Number:</strong> <?php echo $_SESSION['student_id']; ?></p>	 
						<p><strong>Full Name:</strong> <?php echo $_SESSION['lname'].', '.$_SESSION['fname'].' '.$_SESSION['mname']; ?></p>
                        <p><strong>Course:</strong> <?php echo $_SESSION['course']; ?></p>	 
						<p><strong>Semester:</strong> <?php echo $semester; ?></p>
                        <p><strong>Academic Year:</strong> <?php echo $school_yr; ?></p>
					</div>
				</div>
                
                <div class="ui-grid-b">
					<div class="ui-block-a">
						<p align="center"><strong><u>CODE</u></strong></p>
					</div>
                    <div class="ui-block-b">
						<p align="center"><strong><u>SECTION</u></strong></p>	
					</div>
                    <div class="ui-block-c">
						<p align="center"><strong><u>UNITS</u></strong></p>	
					</div>
				</div>
                
                <div class="ui-grid-b">
                <?php
					$totalunits = 0;
					$query = $this->db->query('SELECT * FROM enrollment
						where term_id = "'.$term_id.'"
						and student_id = "'.$_SESSION['student_id'].'" ');
							if ($query->num_rows() > 0) {			
								foreach ($query->result_array() as $row) {
										$enrollment_id = $row['enrollment_id'];
										$student_id = $row['student_id'];
										$term_id = $row['term_id'];
										$schedule_id = $row['schedule_id'];
										
										$query = $this->db->query('SELECT * FROM schedule
										where schedule_id = "'.$schedule_id.'" ');
											if ($query->num_rows() > 0) {			
												foreach ($query->result_array() as $row) {
														$subj_id = $row['subj_id'];
												}
											}
											
										$query = $this->db->query('SELECT * FROM subject
										where subj_id = "'.$subj_id.'" ');
											if ($query->num_rows() > 0) {			
												foreach ($query->result_array() as $row) {
														$subj_code = $row['subj_code'];
														echo '<div class="ui-block-a">';
														echo '<p align="center"><strong>'.$subj_code.'</strong></p>';
														echo '</div>';
												}
											}	
											
										$query = $this->db->query('SELECT * FROM schedule
										where subj_id = "'.$subj_id.'" ');
											if ($query->num_rows() > 0) {			
												foreach ($query->result_array() as $row) {
														$section = $row['section'];
														echo '<div class="ui-block-b">';
														echo '<p align="center"><strong>'.$section.'</strong></p>';
														echo '</div>';
												}
											}	
											
										$query = $this->db->query('SELECT * FROM subject
										where subj_id = "'.$subj_id.'" ');
											if ($query->num_rows() > 0) {	
												foreach ($query->result_array() as $row) {
														$units = $row['units'];
														$totalunits += $units;
														
														echo '<div class="ui-block-c">';
														echo '<p align="center"><strong>'.$units.'</strong></p>';
														echo '</div>';
												}
											}	
								}
							}
				?>
                </div>
                
                <?php
                $query = $this->db->query('SELECT * FROM prf
										where student_id = "'.$student_id.'" 
										and term_id = "'.$term_id.'" ');
											if ($query->num_rows() > 0) {	
												foreach ($query->result_array() as $row) {
														$prf_id = $row['prf_id'];
														$prf_stat = $row['prf_stat'];
														$date_printed = $row['date_printed'];
												}
											}
                
                ?>
                <div class="ui-grid-a">
					<div class="ui-block-a">
						<p><strong>Total Units Enrolled:</strong> <?php echo $totalunits; ?></p>	 
						<p><strong>Allowed Units:</strong> 18</p>
                        <p><strong>PRF Status:</strong> <?php echo $prf_stat; ?></p>
					</div>
				</div>
                
                
                
                
                
                
				<div><p></p></div>
                
                <footer data-role="footer" class="ui-bar" align="center">
                	<a href="../home/logout" data-transition="none">Logout</a>
                    <a href="">SOA</a>
                    <a href="">COR</a>
                </footer>
                
              