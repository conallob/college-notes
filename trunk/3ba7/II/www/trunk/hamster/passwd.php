<?php
		 // $Id$

       // Import Configuration
		 include("config.inc");

		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();

		 // grab details
		 $username = $_SESSION['user'];
		 $old_passwd = $_POST['oldpasswd'];
		 $new_passwd1 = $_POST['newpasswd1'];
		 $new_passwd2 = $_POST['newpasswd2'];

		 include($install_path."includes/mysql.inc");
		 ba7_mysql_setup();

		 $sql = "SELECT * FROM users WHERE name = '$username'";
		 $result = mysql_query($sql);
		 $row = mysql_fetch_row($result);

		 ba7_mysql_cleanup();
		
		 // ensure the old password is correct
		 if ($old_passwd != $row[2]){
		 		$content = "<p>Your password was incorrect. Please 
						<a href=\"change_password.php\">try again</a></p>";
		 }
		 // ensure the new passwords match
		 else if ($new_passwd1 != $new_passwd2){
				$content = "<p>The passwords you entered were not the same. Please
						<a href=\"change_password.php\">try again</a></p>";
		 }
		 // change password in the database
		 else{
				ba7_mysql_setup();
				$sql = "UPDATE users SET password='$new_passwd1' WHERE name='$username'";
				$result = mysql_query($sql);
			 	if (!$result) {
 			 		 die( 'Could not run query: ' . mysql_error());
			 	}

				ba7_mysql_cleanup();
		 		$content = "<p>Your password has been changed successfully</p>";
		 }		
?>		 
<html>
	<head>
		<title>Change Password</title>
		<link rel="stylesheet" type="text/css" href="style.css" /> 
	</head>
	<body>
		<h1>Change Password</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php echo $content; ?>
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>
