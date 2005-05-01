<?php
		 // $Id$

       // Import Configuration
		 include("config.inc");
				  
		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 $username = $_SESSION['user'];
		 $fname = $_POST['fname'];
		 $sname = $_POST['sname'];
		 $email = $_POST['email'];

		 include($install_path."includes/common.inc");
		 
		 // ensure fields are full and e-mail's valid
		 if (($fname == "") || ($sname == "") || ($email == "")
		 			|| (checkEmail($email) == false)){
		 		header("Location: change_details.php");
		 }
		 else{
		 	include($install_path."includes/mysql.inc");
		 	ba7_mysql_setup();

		 	//update user details
		 	$sql[0] = "UPDATE users SET realfname='$fname'
		 				WHERE name='$username'";
			 $sql[1] = "UPDATE users SET realsname='$sname'
			 			WHERE name='$username'";
			 $sql[2] = "UPDATE users SET email='$email'
			 			WHERE name='$username'";
			 for ($i = 0; $i < 3; $i++){
			 	$result = mysql_query($sql[$i]);
			 	if (!$result) {
 			 		 die( 'Could not run query: ' . mysql_error());
			 	}
			 }
			ba7_mysql_cleanup();
			 header("Location: change_details.php");
		}	 
?>		 
