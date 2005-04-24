<?php
	
	// $Id$

		  // grab the username and password
		  $usname = $_POST["usname"];
		  $passwd = $_POST["passwd"];

		  include("/3ba7/www/includes/mysql.inc");

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
			if ($row[2] >= 3){
				header("Location: lockout.html");
			}
			else{
			  $file = file("passwords");
			  $found = false;
			  $i = 0;

			  // find the password from the file
			  while ($file[$i] && !$found){
						 $line = explode(",",$file[$i]);
						 $line[1] = rtrim($line[1]);
						 if (($line[0] == $usname) && ($line[1] == $passwd)){
									$found = true;
						 }
						 $i++;
				}		 
						 /*
				ba7_mysql_setup();

				$found = false;
				$sql = "SELECT * FROM users WHERE user = '$usname'";
				if ($result = mysql_query($sql)){
					$row = mysql_fetch_row($result);
					if ($passwd == $row[2]){
						$found = true;
					}
					else{
						echo "row[2] = $row[2]";
					}	
				}
				ba7_mysql_cleanup();
				*/
			  
			  // if it's found, start a session and register it
			  if ($found == true){
			  			 session_start();
						 header("Cache-control: private"); //IE 6 Fix 

						 $_SESSION['user'] = $usname;
						 $_SESSION['time'] = time();
						 header("Location: home.php");
			  }

			  // otherwise, add it to the database
			  else{
			  			ba7_mysql_setup();
						
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
						
						// redirect to errorlogin page
			  			header("Location: errorlogin.html");
			  }
			}  
?>
