<!-- Login Page -->
    	<div data-role="page" data-theme="a" id="home">
    		<div data-role="header" data-theme="a" data-fullscreen="false" data-position="fixed"> 
            <a href="home" data-role="button" data-icon="back" data-iconpos="notext"></a> 
            <p>Login: Akan Account</p>	
    		</div>
   		  <div data-role="content">  
          	<div data-role="controlgroup">
                <?php
				
				echo ("<script language='javascript'>
        					window.alert('Please check your ID Number and/or Password')
       					 </script>");
						 
						 
					$_SESSION['student_id'] = $this->input->post('student_id');
					
                    echo validation_errors('<p class="error">');
                    echo form_open('home/validate_credentials');	
                    
                    echo form_label('ID Number: ', 'student_id');			   
                           echo '<p>'.form_input(array(
                            'name' => 'student_id',
                            'value' => $_SESSION['student_id'],
                            'placeholder' => 'ID Number',
                            'id' => 'student_id'
                           )).'</p>';
						   
                           
                    echo form_label('Password: ', 'password') ;			   
                           echo '<p>'.form_password(array(
                            'name' => 'password',
                            'value' => '',
                            'placeholder' => 'Password',
                            'id' => 'password'
                          )).'</p>';
						  
					echo form_submit('login', 'Submit');			   				   	
                ?>      
                </div>			
		</div>