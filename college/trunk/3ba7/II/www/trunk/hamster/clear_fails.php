<?php
		// $Id$

       // Import Configuration
		 include("config.inc");

		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();
	
		 // ensure user has permissions to clear account
		 if ($_SESSION['permissions'] != 1){
		 	header("Location: home.php");
		 }	
		 
		 // grab the username to be cleared
		 $user= $_POST["user"];

		 include($install_path."includes/mysql.inc");

		 // connect to the mysql server	
		 ba7_mysql_setup();
		
		 // delete the entries for the username
		 $sql = "DELETE FROM flogs WHERE user = '$user'";
		 $result = mysql_query($sql);

		 ba7_mysql_cleanup();
		
		 // redirect to reenable.php
		 header("Location: reenable.php");
?>
