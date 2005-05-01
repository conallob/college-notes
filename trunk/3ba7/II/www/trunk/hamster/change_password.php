<?php
		// $Id$
      
		 // Import Configuration
		 include("config.inc");
				  
		 // setup session security
		 include($install_path."includes/session.inc");
		 ba7_session_setup();
	
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
			<p>You are logged in as: <b><?php echo $_SESSION['user'] ?></b></p>
			<form action="passwd.php" method="POST">
				<p>Enter Existing Password: <br />
				<input type="password" name="oldpasswd" /> </p>
				<p>Enter New Passord: <br />
				<input type="password" name="newpasswd1" /> </p>
				<p>Re-Enter New Password: <br />
				<input type="password" name="newpasswd2" /> </p>
				<input class="but" type="submit" value="Change"/>
			</form>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>



