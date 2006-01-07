<?php
	
	// $Id$
        // Import Configuration
		  include("config.inc");
				  
		  // grab the username and password
		  $usname = $_POST["usname"];
		  $passwd = $_POST["passwd"];

		  include($install_path."includes/mysql.inc");

		  // setup mysql server
		  ba7_mysql_setup();
			
			// check for previous failed logins from database
			$sql = "SELECT * FROM flogs WHERE user = '$usname'";	
			$result = mysql_query($sql);
			if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
			}
			$row = mysql_fetch_row($result);


			ba7_mysql_cleanup();
			

			// if there's 3 or more failed logins, redirect
			// to the lockout page
			if ($row[2] >= $max_attempt_logins){
				header("Location: lockout.html");
			}
			else{
			
				// find the password from the database
				ba7_mysql_setup();

				$found = false;
				$sql = "SELECT * FROM users WHERE name = '$usname'";
				$result = mysql_query($sql);
				if (!$result) {
 					die( 'Could not run query: ' . mysql_error());
				}
				$row = mysql_fetch_row($result);
				if ($passwd == $row[2]){
					$found = true;
				}
				ba7_mysql_cleanup();
				
			  
			  // if it's found, start a session and register it
			  if ($found == true){
			  			 session_start();
						 header("Cache-control: private"); //IE 6 Fix 

						 $_SESSION['user'] = $usname;
						 $_SESSION['time'] = time();
						 $_SESSION['permissions'] = $row[3];
						 header("Location: home.php");
			  }

			  // otherwise, add it to the database
			  else{
			  			ba7_mysql_setup();
						
						// get for previous failed logins from database
						$sql = "SELECT * FROM flogs WHERE user = '$usname'";	
						$result = mysql_query($sql);
						$row = mysql_fetch_row($result);
						
						// delete the entry
			  			$sql = "delete from flogs where user = '$usname'";
						$result = mysql_query($sql);
						
						// increment the failed entries, or if there are none,
						// set it to 1
						if ($row[2] > 0){
							$fails = $row[2] + 1;
						}	
						else{	
							$fails = 1;
						}	

						// insert the failed entry log into the database
						$sql = "insert into flogs values ('$usname', '$passwd', '$fails')";
						$result = mysql_query($sql);

						ba7_mysql_cleanup();
						
						if ($fails < 3){
							// redirect to errorlogin page
			  				header("Location: errorlogin.html");
						}
						else{
							header("Location: lockout.html");
						}	
			  }
			}  
?>
