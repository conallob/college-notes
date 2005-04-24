<?php
		// $Id$

		 // setup session security
		 include("/3ba7/www/includes/session.inc");
		 ba7_session_setup();
	
		 // grab the username to be cleared
		 $user= $_POST["user"];

		 include("../includes/mysql.inc");

		 // connect to the mysql server	
		 ba7_mysql_setup();
		
		 // delete the entries for the username
		 $sql = "DELETE FROM flogs WHERE user = '$user'";
		 $result = mysql_query($sql);

		 ba7_mysql_cleanup();
		
		 // redirect to reenable.php
		 header("Location: reenable.php");
?>
