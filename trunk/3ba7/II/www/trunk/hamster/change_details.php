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
		<title>Change User Details</title>
		<link rel="stylesheet" type="text/css" href="style.css" /> 
	</head>
	<body>
		<h1>Change User Details</h1>
		<p class="right">[<a href="logout.php" class="bar">Logout</a>]</p>
		<div class="main">
			<?php
			
			//print username
			echo "<p>You are logged in as: <b>" . $_SESSION['user'] . "</b></p>\n";

			echo "<li class=\"sel\"><a href=\"change_password.php\">Change Password</a></li>\n";
			
			echo "<p>Your current details:</p>\n";
			
			include ($install_path."includes/mysql.inc");
			ba7_mysql_setup();

			//get user details
			$sql = "SELECT * FROM users WHERE name='" . $_SESSION['user'] . "'";
			$result = mysql_query($sql);
			if (!$result) {
 				die( 'Could not run query: ' . mysql_error());
			}
			$row = mysql_fetch_row($result);

			echo "<form action=\"update_account.php\" method=\"POST\">\n";

			echo"<p>First Name: <br /> <input type=\"text\" name=\"fname\"
						value=\"$row[5]\" />&lowast;</p>\n";
			
			echo"<p>Second Name: <br /> <input type=\"text\" name=\"sname\"
						value=\"$row[6]\" />&lowast;</p>\n";
			
			echo"<p>Email Address: <br /> <input type=\"text\" name=\"email\"
						value=\"$row[4]\" />&lowast;&lowast;</p>\n";

			ba7_mysql_cleanup();			

			?>
				<br /><input class="but" type="submit" value="Submit"/>
			</form>
			<p class="err"><i>&lowast; - required fields</i><br />
			<i>&lowast;&lowast; - must be valid email address</i></p>
		<br />	
		</div>
		<div class="bar">
				<p class="bar">[<a class="bar" href="home.php">Home</a>]</p>
		</div>		
	</body>	
</html>

