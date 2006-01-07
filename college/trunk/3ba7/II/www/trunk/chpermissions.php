<?php
		// $Id$

		 // setup session security
		 include("/3ba7/www/includes/session.inc");
		 ba7_session_setup();

		 // ensure user has permissions to clear account
		 if ($_SESSION['permissions'] != 1){
		 	header("Location: home.php");
		 }	

		 
		 $user = $_POST["user"];
		 $perm = $_POST["perm"];

		 include("/3ba7/www/includes/mysql.inc");
		 ba7_mysql_setup();

		 $sql = "UPDATE users SET permissions='$perm' WHERE name='$user'";
		 $result = mysql_query($sql);
		 if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
		 }
		 header("Location: view_users.php");
?>
